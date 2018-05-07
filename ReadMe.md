
# SQL Indexes in an OLAP Architecture

The following demonstration shows some examples of indexing strategy in a read heavy (OLAP) environment utilising clustered and nonclustered indexes (and foreign keys).
Remember these are purely for demonstrative purposes and your indexing strategy may be different depending on your architecture.
Always remember indexes used correctly can speed up reads, but may have an overhead on maintenance of them and can degrade data writing operations.

## Overview

1. [HEAPs and Types of Index](#heaps-and-types-of-index)
1. [How to measure index efficacy](#how-to-measure-index-efficacy)
1. [Create architecture](#create-architecture)
1. [Our “Regular Query”](#our-regular-query)
1. [Nonclustered Index for the WHERE clause](#nonClustered-index-for-the-where-clause)
1. [Nonclustered Index for the ON clause](#nonclustered-index-for-the-on-clause)
1. [Back to Our Original Query](#back-to-our-original-query)
1. [Turn the DateKey into the clustered index](#turn-dateKey-into-clustered-index-on-fact-table)
1. [SARGs (Search Arguments)](#search-arguments)
1. [Foreign Key performance benefits](#foreign-key-performance-benefits)
1. [Summary](#summart)
1. [Disclaimer](#disclaimer)

## HEAPs and Types of Index

A table is called a **HEAP** if it does not have a primary key or unique constraint. At this point it does not have any logical order, the order of data is simply based on physical allocation. The whole heap has to be scanned for SQL Server to find data which will make it slow for large objects that contain lots of rows. Indexes can be added to tables to create logical ordering and aid in data retrieval.
The two classic types of index are **clustered** and **nonclustered**. There can be only one clustered index per table and this organises the table into a B-tree. There is a limit to the number of nonclustered indexes a table can have.

## How to measure index efficacy

In SQL server you can measure index efficacy by checking query plans and statistics, many of which will be demonstrated below.

* SET STATISTICS IO ON
* Using Actual Execution Plan (CTRL+M)
* Using Dynamic Management Objects (DMOs)

In general what we want to see...

* Less logical reads
* Index seeks instead of scans

In general what we don't want to see...

* Lots of logical reads
* Key Lookup (Clustered)
* Table scans!

These are extremely fast and loose rules but should help us as we go along. Now lets get stuck in!

## Create Architecture

First execute the [IndexDemoCreateDB](https://raw.githubusercontent.com/griff182uk/SQLServerIndexes/master/IndexDemoDBCreate.sql) on your server to setup the architecture. The script uses "CREATE OR ALTER" so is currently tailored for SQL 2016 and above.

## Our Regular Query

The query we want to tune looks as follows.  

```sql
SELECT
DimDate.CalendarYear
, DimDate.MonthOfYearName
, DimDate.CalendarMonthNo
, DimDate.DayOfMonthNo
, DimDate.DayOfWeekName
, DimTest.TestValueCategory
, Fact.CountTest
, Fact.AmountTest
FROM import.FactTest Fact WITH(NOLOCK)
JOIN import.DimDate DimDate WITH(NOLOCK) ON
DimDate.DateKey  = Fact.DateKey
JOIN import.DimTest DimTest WITH(NOLOCK) ON
DimTest.TestKey  = Fact.TestKey;
```

This query has been encapsulated in the VIEW  acc.RegularQuery.

Now execute the below to get some statistics on our regular query which currently has no nonclustered indexes...
**(Ensure you have execution plan on CTRL+M)**

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
CalendarYear, MonthOfYearName, CalendarMonthNo, DayOfMonthNo, DayOfWeekName, TestValueCategory, CountTest, AmountTest
 FROM acc.RegularQuery
WHERE CalendarMonthNo = 201401;

```

You can see at the moment we have a slightly complicated plan for a fairly simple query. There are lots of table scans and a lot of logical reads on each table (DimTest - 360, DimDate - 801, FactTest 17646). 
Our goal will be to simplify this plan and get those logical reads down using an indexing strategy...

## NonClustered Index for the WHERE Clause


We'll first focus on just the date object before looking at the interactions between objects in the view.

Execute the below to get some statistics on the query without any nonclustered indexes...
**(Ensure you have execution plan on CTRL+M)**

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
CalendarYear
, MonthName
, CalendarMonthNo
, DayOfMonthNo
, DayOfWeekName
 FROM import.DimDate
WHERE CalendarMonthNo = 201401;
```

This has a clustered index scan and 802 logical reads!

Lets add a nonclustered index on the column users are filtering  on and see what happens.

Execute the query below.

```sql
USE [IndexDemo]
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_DimDate_Filter_CalendarMonthNo'
AND object_id = OBJECT_ID('import.DimDate'))
	DROP INDEX [ncidx_DimDate_Filter_CalendarMonthNo] ON import.DimDate;

CREATE NONCLUSTERED INDEX [ncidx_DimDate_Filter_CalendarMonthNo]
ON [import].[DimDate]
([CalendarMonthNo] ASC);
GO

```

Now execute the query below to get some statistics on the query with this nonclustered index...
**(Ensure you have execution plan on CTRL+M)**

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
CalendarYear
, MonthName
, CalendarMonthNo
, DayOfMonthNo
, DayOfWeekName
 FROM import.DimDate
WHERE CalendarMonthNo = 201401;
```

Ah that's more like it, we get 105 logical reads and the query plan shows us an index seek and a key lookup.

Now we want to help the query out a little more... Lets include the columns we are returning in the query and see if we can get rid of that key lookup.

Execute the query below.

```sql
USE [IndexDemo]
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_DimDate_Filter_CalendarMonthNo'
AND object_id = OBJECT_ID('import.DimDate'))
	DROP INDEX [ncidx_DimDate_Filter_CalendarMonthNo] ON import.DimDate;

CREATE NONCLUSTERED INDEX [ncidx_DimDate_Filter_CalendarMonthNo] ON [import].[DimDate]
([CalendarMonthNo] ASC)
INCLUDE ( 	CalendarYear, MonthName, DayOfMonthNo, DayOfWeekName)
GO
```

Now execute the query below to get some statistics on the query with this **covering** index added...
**(Ensure you have execution plan on CTRL+M)**

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
CalendarYear
, MonthName
, CalendarMonthNo
, DayOfMonthNo
, DayOfWeekName
 FROM import.DimDate
WHERE CalendarMonthNo = 201401;
```

Boom! Rapido!

2 logical reads and no key lookup. This is because all of the columns returned are now included in the index and satisfied by it. This is called a **covering index.**

## NonClustered Index for the ON Clause

Now we want to look at the query that joins our fact and date together, which is a part of our original query.

Now execute the query below to get some statistics on this component of our original query.
**(Ensure you have execution plan on CTRL+M)**

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
CalendarYear
, MonthOfYearName
, CalendarMonthNo
, DayOfMonthNo
, DayOfWeekName
, CountTest
, AmountTest

FROM import.FactTest Fact WITH(NOLOCK)
JOIN import.DimDate DimDate WITH(NOLOCK) ON
DimDate.DateKey  = Fact.DateKey
WHERE CalendarMonthNo = 201401;
```

We get an index seek on our date dimension due to what we did in the previous section.

We still however get a clustered index scan on our fact with 18227 logical reads.

We shall add a nonclustered index for the DateKey on the fact table by executing the below to see if that helps...

```sql
USE [IndexDemo]
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_FactTest_DateKey'
AND object_id = OBJECT_ID('import.FactTest'))
	DROP INDEX [ncidx_FactTest_DateKey] ON import.[FactTest];

CREATE NONCLUSTERED INDEX [ncidx_FactTest_DateKey] ON [import].[FactTest]
(
	[DateKey] ASC
)
GO
```

Now again execute the query below to get some statistics on the query.
**(Ensure you have execution plan on CTRL+M)**

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
CalendarYear
, MonthOfYearName
, CalendarMonthNo
, DayOfMonthNo
, DayOfWeekName
, CountTest
, AmountTest

FROM import.FactTest Fact WITH(NOLOCK)
JOIN import.DimDate DimDate WITH(NOLOCK) ON
DimDate.DateKey  = Fact.DateKey
WHERE CalendarMonthNo = 201401;
```

What on earth?! The query plan and statistics remain the same...

We need to include the fact columns returned so the index is covering. We often forget that columns returned as measure still need to be included as part of the index, be careful of this trap! We only need to include it in one of the fact columns though and as date is the most commonly queried one, this is the best candidate.

Execute the below to create the new covering index.

```sql
USE [IndexDemo]
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_FactTest_DateKey'
AND object_id = OBJECT_ID('import.FactTest'))
	DROP INDEX [ncidx_FactTest_DateKey] ON import.FactTest;

CREATE NONCLUSTERED INDEX [ncidx_FactTest_DateKey] ON [import].[FactTest]
([DateKey] ASC)
INCLUDE ( 	[CountTest],[AmountTest])
GO

```

Now again execute the query below to get some statistics on the query.
**(Ensure you have execution plan on CTRL+M)**

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
CalendarYear
, MonthOfYearName
, CalendarMonthNo
, DayOfMonthNo
, DayOfWeekName
, CountTest
, AmountTest

FROM import.FactTest Fact WITH(NOLOCK)
JOIN import.DimDate DimDate WITH(NOLOCK) ON
DimDate.DateKey  = Fact.DateKey
WHERE CalendarMonthNo = 201401;
```

Now we can see we get a much more pleasant 381 logical reads on the fact table (compared to 18227 earlier).

## Back to Our Original Query

Execute our query below to get some statistics.
**(Ensure you have execution plan on CTRL+M)**

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
CalendarYear, MonthOfYearName, CalendarMonthNo, DayOfMonthNo, DayOfWeekName, TestValueCategory, CountTest,
AmountTest
 FROM acc.RegularQuery
WHERE CalendarMonthNo = 201401;
```

We're still getting lots of reads and table scans on the FactTest and DimTest even though DimDate seems pretty good now.

So applying the rules we've learned, we'll create a nonclustered index on the TestKey in the fact for filtering in the ON clause.
We don't need to INCLUDE the measure columns here as our Date index has already taken care of that.

Execute the below to create the index.

```sql
USE [IndexDemo]
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_FactTest_TestKey'
AND object_id = OBJECT_ID('import.FactTest'))
	DROP INDEX [ncidx_FactTest_TestKey] ON import.FactTest;

CREATE NONCLUSTERED INDEX [ncidx_FactTest_TestKey] ON [import].[FactTest]
([TestKey] ASC)
GO

```

Execute our query below to get some statistics.
**(Ensure you have execution plan on CTRL+M)**

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
CalendarYear, MonthOfYearName, CalendarMonthNo, DayOfMonthNo, DayOfWeekName, TestValueCategory, CountTest,
AmountTest
 FROM acc.RegularQuery
WHERE CalendarMonthNo = 201401;
```

Still performing clustered index scan on the fact table and 18227 logical reads...

We also now need to included the TestKey in the DateKey index so that the entire query is covered by a nonclustered index.

Execute the below to recreate the index.

```sql
USE [IndexDemo]
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_FactTest_DateKey'
AND object_id = OBJECT_ID('import.FactTest'))
	DROP INDEX [ncidx_FactTest_DateKey] ON import.FactTest;

CREATE NONCLUSTERED INDEX [ncidx_FactTest_DateKey] ON [import].[FactTest]
(
	[DateKey] ASC
)
INCLUDE ( 	[CountTest],
	[AmountTest],
	[TestKey])  
GO
```

Cool, now we get 418 logical reads on the fact table and it's using a seek instead of a scan.

We're getting a scan and lots of reads still on the DimTest table though.

We're only bringing back the TestValueCategory column so lets put an index on that.

```sql
USE [IndexDemo]
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_DimTest_Filter_TestValueCategory'
AND object_id = OBJECT_ID('import.DimTest'))
	DROP INDEX [ncidx_DimTest_Filter_TestValueCategory] ON import.DimTest;

CREATE NONCLUSTERED INDEX [ncidx_DimTest_Filter_TestValueCategory] ON [import].[DimTest]
(
	[TestValueCategory] ASC
)
GO

```


Execute our query below to get some statistics.
**(Ensure you have execution plan on CTRL+M)**

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
CalendarYear, MonthOfYearName, CalendarMonthNo, DayOfMonthNo, DayOfWeekName, TestValueCategory, CountTest,
AmountTest
 FROM acc.RegularQuery
WHERE CalendarMonthNo = 201401;
```

We've probably gone overboard but now we have 230 logical reads on the DimTest table as it's satisfied by the nonclustered index, so I think our work here is done...

Note this table is still doing an index scan as we're not filtering on this column.

Lets just run our new indexed architecture against a HEAP.
**(Ensure you have execution plan on CTRL+M)**

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
CalendarYear, MonthOfYearName, CalendarMonthNo, DayOfMonthNo, DayOfWeekName, TestValueCategory, CountTest, AmountTest
 FROM acc.RegularQuery
WHERE CalendarMonthNo = 201401;

SELECT
CalendarYear, MonthOfYearName, CalendarMonthNo, DayOfMonthNo, DayOfWeekName, TestValueCategory, CountTest, AmountTest
 FROM acc.RegularQueryHeap
WHERE CalendarMonthNo = 201401;

```

We can see there's a huge difference in the amount of work done on the HEAP compared to the indexed RegularQuery.

Always remember though indexes do come with a maintenance cost so we need to balance the number we have for reading purposes against the cost of keeping them up to date and their effect on inserts, updates and deletes.  
In an OLAP environment such as this though, we do want to aim for low latency reads.

## Turn DateKey into Clustered Index on Fact Table

We already have the majority of columns included in the DateKey nonclustered index, so why not make it the clustered index? The clustered index contains all the data of the table and orders the table by this key. It's likely some form of Date will be used to restrict every query, so lets try that.

Execute the below to make the current primary key nonclustered and make the DateKey index clustered.

```sql
USE [IndexDemo]
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'PK_FactTest'
AND object_id = OBJECT_ID('import.FactTest'))
ALTER TABLE [import].[FactTest] DROP CONSTRAINT [PK_FactTest];
GO
ALTER TABLE [import].[FactTest] ADD  CONSTRAINT [PK_FactTest] PRIMARY KEY NONCLUSTERED
(
	[FactKey] ASC
);
GO

USE [IndexDemo]
GO
IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_FactTest_DateKey'
AND object_id = OBJECT_ID('import.FactTest'))
DROP INDEX [ncidx_FactTest_DateKey] ON import.FactTest;
GO
CREATE CLUSTERED INDEX [cidx_FactTest_DateKey] ON [import].[FactTest]
(
	[DateKey] ASC
)
GO
```

Now lets run our query again with the Date as the clustering key.

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
CalendarYear, MonthOfYearName, CalendarMonthNo, DayOfMonthNo, DayOfWeekName, TestValueCategory, CountTest, AmountTest
 FROM acc.RegularQuery
WHERE CalendarMonthNo = 201401;
```

Ok, our dimension reads have stayed the same but the fact table logical reads has gone up slightly to from 418 to 513.
However, if the fact table gets wider the clustered DateKey will always have these columns included, which is very useful, as it is likely this DateKey will always be part of a query against a fact.

## Search Arguments

A good index is useless unless it is actually used. This means database designers need to know what columns users want to filter on and users need to know how to utilises these columns effectively. How good a column is for a WHERE clause is known as it's **SARGability**, where a SARG is short for search argument.

In the examples we have just been trying, using calendar year and month of year name instead of calendar month no will not provide the same benefits.

Execute queries below to see only the top query shows the indexes being used and hence the appropriate speed and reads.
**(Ensure you have execution plan on CTRL+M)**

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
CalendarYear, MonthOfYearName, CalendarMonthNo, DayOfMonthNo, DayOfWeekName, TestValueCategory, CountTest, AmountTest
 FROM acc.RegularQuery
WHERE CalendarMonthNo = 201401;

SELECT
CalendarYear, MonthOfYearName, CalendarMonthNo, DayOfMonthNo, DayOfWeekName, TestValueCategory, CountTest, AmountTest
 FROM acc.RegularQuery
WHERE  MonthOfYearName = 'January'
AND CalendarYear = 2014;
```

It's also worth noting here that smaller datatypes mean smaller  indexes, less to search over, and are therefore quicker. It is always worth considering this in your indexing strategy.

For indexes to be used by an end user correctly they must be supplied with the correct data type.

As strings implicitly convert to integers, supplying a string to an integer column won't matter to the index.
Therefore to demonstrate the effect there is another Date dimension created in the database setup where the CalendarMonthNo is a CHAR instead of an INT. INTs cannot be implicitly converted to a CHAR so we should see an effect...

Execute queries below to see only the top query shows the date index being used and hence the appropriate speed and reads.  
**(Ensure you have execution plan on CTRL+M)**


```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

--doesn't like the implicit conversion from int to char on this one
--see the logical reads are higher on DimDateChar and there is an Index Scan in the query plan
SELECT CalendarYear, MonthOfYearName, CalendarMonthNo, DayOfMonthNo, DayOfWeekName, TestValueCategory, CountTest, AmountTest
 FROM acc.RegularQueryChar
WHERE  CalendarMonthNo = 201401;

--uses the index as no conversion of data type
--logical reads are lower on DimDateChar and there is an Index Seek in the query plan
SELECT
CalendarYear, MonthOfYearName, CalendarMonthNo, DayOfMonthNo, DayOfWeekName, TestValueCategory, CountTest, AmountTest
 FROM acc.RegularQueryChar
WHERE  CalendarMonthNo = '201401';
```

This is because the bottom query is having to do an implicit conversion from string to an integer, which renders the index less effective.

There are also issues when using LIKE operators on strings, where if a wildcard is used at the start of a value supplied to the WHERE clause, the index is again rendered useless.

Execute queries below to see that the bottom query cannot utilise the index as the wildcard is at the start of the value supplied.   
**(Ensure you have execution plan on CTRL+M)**

```sql
USE IndexDemo;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

--indexes ok with this one and uses an index seek
SELECT * FROM acc.RegularQueryChar
WHERE  CalendarMonthNo LIKE '201401%';

--indexes ok with this one and uses an index seek
--(noticed fact reads went up - I need to look at why!)
SELECT * FROM acc.RegularQueryChar
WHERE  CalendarMonthNo LIKE '2014%1';

--nope doesnt like this, it therefore performs an index scan
SELECT * FROM acc.RegularQueryChar
WHERE  CalendarMonthNo LIKE '%201401';


```

We can therefore seen based on the above that the users query methods are also important with regards to indexes being utilised and queries performing well.

## Foreign Key Performance Benefits

If we return only fact and date columns from our original query view, it still does calls do the DimTest table.

Execute the below to see the calls still being made to the DimTest table even tough it isn't being used in the query.   
**(Ensure you have execution plan on CTRL+M)**

```sql
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

USE IndexDemo;
GO
SELECT CalendarMonthNo, SUM(AmountTest) FROM acc.RegularQuery
WHERE CalendarMonthNo BETWEEN 201401 AND 201406
GROUP BY CalendarMonthNo;
```

If only there was a way we could make it ignore any operations against objects that aren't being used in the query...

Execute the below to add foreign keys from the fact to the dimension tables.

```sql
USE [IndexDemo]
GO

ALTER TABLE [import].[FactTest]  WITH CHECK ADD  CONSTRAINT [FK_FactTest_DimDate] FOREIGN KEY([DateKey])
REFERENCES [import].[DimDate] ([DateKey])
GO

ALTER TABLE [import].[FactTest] CHECK CONSTRAINT [FK_FactTest_DimDate]
GO


USE [IndexDemo]
GO

ALTER TABLE [import].[FactTest]  WITH CHECK ADD  CONSTRAINT [FK_FactTest_DimTest] FOREIGN KEY([TestKey])
REFERENCES [import].[DimTest] ([TestKey])
GO

ALTER TABLE [import].[FactTest] CHECK CONSTRAINT [FK_FactTest_DimTest]
GO

```

Now execute the below...    
**(Ensure you have execution plan on CTRL+M)**

```sql
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

USE IndexDemo;
GO
SELECT CalendarMonthNo, SUM(AmountTest) FROM acc.RegularQuery
WHERE CalendarMonthNo BETWEEN 201401 AND 201406
GROUP BY CalendarMonthNo;
```

Cool! The query now ignores the JOIN to the DimTest table in the view, even though it is part of the definition. This is a really useful trick. We can therefore create large complex views to satisfy a number of queries as people can just pick the appropriate subsets of columns.

You can see the same thing if you only include DimTest columns, the DimDate table is excluded from the query plan.

```sql
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

USE IndexDemo;
GO
SELECT TestValueCategory, SUM(AmountTest) FROM acc.RegularQuery
GROUP BY TestValueCategory;

```

To achieve this you need:
1. An index on the dimension key column in the fact table.
1. The dimension key column in the fact table should not be NOT NULL.
1. There should be a foreign key from the fact dimension key to the dimension key.

This shows foreign keys can be useful for performance as well as referential integrity.

## Summary

* Nonclustered indexes designed well can vastly improve query performance

* Covering indexes in particular allow queries to be completely satisfied by the nonclustered index

* You may consider a date column in a fact table for the clustered index

* Consider the size of the data type for the indexed column

* The columns that are indexed need to correlate with what users are querying on

* Users need to be informed of how to utilise the indexed columns (or be provided with routines that harness them)

* Foreign keys are not just for referential integrity

## Disclaimer

* This demonstration is purely that and your particular environment and architecture may require different indexing strategies.

* The rules of measuring performance and implementing indexes are not always so cut and dry.

* But hopefully the basic knowledge or awareness will aid in your index design and implementation.
