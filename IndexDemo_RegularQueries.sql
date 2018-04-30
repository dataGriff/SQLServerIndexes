
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

/***************************************************
Query 1 - The Regular Query
*****************************************************/
SELECT * FROM acc.RegularQuery 
WHERE CalendarMonthNo = 201401;

SELECT * FROM acc.RegularQueryHeap
WHERE CalendarMonthNo = 201401;

/***************************************************
Query 2 - Focus on Date
*****************************************************/
USE IndexDemo;
SELECT 
CalendarYear
, MonthName
, CalendarMonthNo
, DayOfMonthNo
, DayOfWeekName
 FROM import.DimDate
WHERE CalendarMonthNo = 201401;

/***************************************************
Query 3 - Focus on Date and Fact
*****************************************************/
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



/*****************************************************
Queries 4 - SARG 
******************************************************/

--The Regular Query with bad SARG
SELECT * FROM acc.RegularQuery 
WHERE  MonthOfYearName = 'January'
AND CalendarYear = 2014;


--The Regular Query with wrong Data Type
SELECT * FROM acc.RegularQueryChar 
WHERE  CalendarMonthNo = 201401;

SELECT * FROM acc.RegularQueryChar 
WHERE  CalendarMonthNo = '201401';


--The Regular Query with bad operators
SELECT * FROM acc.RegularQueryChar 
WHERE  CalendarMonthNo LIKE '201401%';
--ok with this one

SELECT * FROM acc.RegularQueryChar 
WHERE  CalendarMonthNo LIKE '2014%1';
--ok with this one

SELECT * FROM acc.RegularQueryChar 
WHERE  CalendarMonthNo LIKE '%201401';
--nope doesnt like this, performs a scan


/*****************************************************
Queries 5 Bonus Use of Foreign Keys
******************************************************/
SELECT CalendarMonthNo, SUM(AmountTest) FROM acc.RegularQuery 
WHERE CalendarMonthNo BETWEEN 201401 AND 201406
GROUP BY CalendarMonthNo;

