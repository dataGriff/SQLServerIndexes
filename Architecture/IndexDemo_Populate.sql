/****************************************
1.0 Create and Populate DimDate
*****************************************/
SET DATEFORMAT DMY;
USE IndexDemo
GO
IF OBJECT_ID('import.DimDate') IS NOT NULL
	DROP TABLE import.DimDate;
SELECT a.*
INTO import.DimDate
FROM dw_tools.tools.tallydate t
CROSS APPLY [acc].[fu_Date] (t.dt) AS a
WHERE t.Dt BETWEEN DATEADD(YEAR,-200,GETDATE()) AND GETDATE();
GO

/****************************************
2.0 Create and Populate the DimDateChar
*****************************************/
USE IndexDemo;
GO
IF OBJECT_ID('import.DimDateChar') IS NOT NULL
	DROP TABLE import.DimDateChar;
SELECT * INTO import.DimDateChar
FROM import.DimDate;

--add and populate the CalendarMonthNoChar test column
ALTER TABLE import.DimDateChar
ADD CalendarMonthNoChar CHAR(6);
GO
UPDATE import.DimDateChar
SET CalendarMonthNoChar = CalendarMonthNo;

--SELECT TOP 10 * FROM import.DimDatecHAR

/****************************************
2.0 Create and Populate the DimDateOneRow
*****************************************/
USE IndexDemo
GO
IF OBJECT_ID('import.DimDateOneRow') IS NOT NULL
	DROP TABLE import.DimDateOneRow;
SELECT *
INTO import.DimDateOneRow
FROM dw_tools.tools.tallydate t
CROSS APPLY [acc].[fu_Date] (t.dt)
WHERE t.Dt = '01-jan-2015';
GO

--SELECT * FROM import.DimDateOneRow

/****************************************
3.0 Create and Populate our Heap
*****************************************/
USE IndexDemo;
GO
IF OBJECT_ID('import.DimDateHeap') IS NOT NULL
	DROP TABLE import.DimDateHeap;
SELECT * INTO import.DimDateHeap
FROM import.DimDate;

--SELECT TOP 10 * FROM import.DimDateOneRow

/****************************************
4.0 Create and Populate the Test Dim
*****************************************/
USE IndexDemo;
IF OBJECT_ID('import.DimTest') IS NOT NULL
	DROP TABLE import.DimTest;
CREATE TABLE import.DimTest
(
TestKey INT IDENTITY NOT NULL CONSTRAINT PK_DimTest PRIMARY KEY CLUSTERED
,TestValue CHAR(8) NOT NULL 
,TestValueCategory CHAR(8) NOT NULL
)
INSERT INTO import.DimTest
(TestValue,TestValueCategory)

SELECT RIGHT(REPLICATE('0',8)+CAST(n AS VARCHAR),8)
,  RIGHT(REPLICATE('0',8)+CAST(floor((N + 99) / 100) * 100 AS VARCHAR),8)

FROM dw_tools.tools.tally
WHERE n <= 100000;

--SELECT TOP 10 * FROM import.DimTest
 IF OBJECT_ID('import.DimTestHeap') IS NOT NULL
	DROP TABLE import.DimTestHeap;
SELECT * INTO import.DimTestHeap
FROM import.DimTest;

/****************************************
5.0 Populate the Test Fact
*****************************************/
USE IndexDemo;
IF OBJECT_ID('import.FactTest') IS NOT NULL
	DROP TABLE import.FactTest;
CREATE TABLE import.FactTest
(
FactKey INT IDENTITY  NOT NULL CONSTRAINT PK_FactTest PRIMARY KEY CLUSTERED
, DateKey INT NOT NULL CONSTRAINT DFT_FactTest_DateKey DEFAULT 0
, TestKey INT NOT NULL CONSTRAINT DFT_FactTest_TestKey DEFAULT 0
, CountTest INT NOT NULL CONSTRAINT DFT_FactTest_CountTest DEFAULT 1
, AmountTest MONEY NOT NULL CONSTRAINT DFT_FactTest_AmountTest DEFAULT '100.00'
)

DECLARE @id INT = 1

WHILE @id <=5
BEGIN

INSERT INTO import.FactTest
(
DateKey, TestKey
)

SELECT 
DateKey
,TestKey
FROM 
 (SELECT DateKey 
FROM  import.DimDate
WHERE 0.4 >= CAST(CHECKSUM(NEWID(), DateKey) & 0x7fffffff AS float)
 / CAST (0x7fffffff AS int)
 AND CalendarYear BETWEEN '2010' AND '2015') AS Randdate

CROSS JOIN (SELECT TestKey 
FROM  import.DimTest 
WHERE 0.01 >= CAST(CHECKSUM(NEWID(), TestKey) & 0x7fffffff AS float)
 / CAST (0x7fffffff AS int)) AS RandTest

 SET @id+= 1
 END

 --SELECT TOP 10 * FROM import.FactTest

 IF OBJECT_ID('import.FactTestHeap') IS NOT NULL
	DROP TABLE import.FactTestHeap;
SELECT * INTO import.FactTestHeap
FROM import.FactTest;


/****************************************
6.0 Create Test View
*****************************************/
IF OBJECT_ID('acc.RegularQuery') IS NOT NULL
	DROP VIEW acc.RegularQuery;
GO
CREATE VIEW acc.RegularQuery
--SELECT * FROM acc.RegularQuery
AS

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
GO
/****************************************
6.0 Create Test View on Heap
*****************************************/
IF OBJECT_ID('acc.RegularQueryHeap') IS NOT NULL
	DROP VIEW acc.RegularQueryHeap;
GO
CREATE VIEW acc.RegularQueryHeap
--SELECT * FROM acc.RegularQueryHeap
AS

SELECT 
DimDate.CalendarYear
, DimDate.MonthOfYearName
, DimDate.CalendarMonthNo
, DimDate.DayOfMonthNo
, DimDate.DayOfWeekName
, DimTest.TestValueCategory
, Fact.CountTest
, Fact.AmountTest

FROM import.FactTestHeap Fact WITH(NOLOCK)
JOIN import.DimDateHeap DimDate WITH(NOLOCK) ON
DimDate.DateKey  = Fact.DateKey
JOIN import.DimTestHeap DimTest WITH(NOLOCK) ON
DimTest.TestKey  = Fact.TestKey;
GO
/****************************************
6.0 Create Test View Char
*****************************************/
IF OBJECT_ID('acc.RegularQueryChar') IS NOT NULL
	DROP VIEW acc.RegularQueryChar;
GO
CREATE VIEW acc.RegularQueryChar
--SELECT * FROM acc.RegularQueryChar
AS

SELECT 
DimDate.CalendarYear
, DimDate.MonthOfYearName
, CalendarMonthNo = DimDate.CalendarMonthNoChar
, DimDate.DayOfMonthNo
, DimDate.DayOfWeekName
, DimTest.TestValueCategory
, Fact.CountTest
, Fact.AmountTest

FROM import.FactTest Fact WITH(NOLOCK)
JOIN import.DimDateChar DimDate WITH(NOLOCK) ON
DimDate.DateKey  = Fact.DateKey
JOIN import.DimTest DimTest WITH(NOLOCK) ON
DimTest.TestKey  = Fact.TestKey;