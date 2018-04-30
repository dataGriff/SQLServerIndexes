USE [IndexDemo]
GO

/****** Object:  UserDefinedFunction [acc].[fu_Date]    Script Date: 25/02/2015 13:39:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
Function Details
------------------
Creator				: Richard Griffiths 
Last Modified Date	: 24/02/2015
Details				: Returns Date Lookup Values when Date Supplied
Parameters
------------------
@date				: Date in DATE datatype

Depends On
------------------
none
*/

ALTER FUNCTION [acc].[fu_Date] (@date DATE)
--DROP FUNCTION [acc].[fu_Date]
--set dateformat dmy SELECT financialyearoffset, quarteroffset, * FROM [acc].[fu_Date] ('01-oct-2014')

RETURNS @return TABLE 
(
	[DateKey] [int] NOT NULL,
	[DateValidFlag] [int] NOT NULL,
	[DateValid] [varchar](15) NOT NULL,
	[DateFormatValidFlag] [int] NOT NULL,
	[DateFormatValid] [varchar](15) NOT NULL,
	[Date] [date] NULL,
	[DateStyle] [varchar](10) NOT NULL DEFAULT '',
	[DateStyle2] [varchar](10) NOT NULL,
	[DateStyleddmmmyyyy] [varchar](11) NOT NULL,
	[DateStyleddmmmyy] [varchar](9) NOT NULL,
	[DateStyleddmmyyyy] [varchar](10) NOT NULL,
	[DateStyleddmmyy] [varchar](8) NOT NULL,
	[DateStyleyyyymmdd] [varchar](10) NOT NULL,
	[DateStyleFulldmy] [varchar](17) NOT NULL,
	
	[DayOfWeekNo] TINYINT NOT NULL,
	[DayOfWeekName] [varchar](15) NOT NULL,
	[DayOfWeekAbbreviation] [varchar](3) NOT NULL,
	[DayOfMonthNo] TINYINT NOT NULL,
	[DayOfCalendarYearNo] SMALLINT NOT NULL,
	[DayOfFinancialYearNo] SMALLINT NOT NULL,
	[WeekdayFlag] SMALLINT NOT NULL,
	[WeekDayDescription] [varchar](15) NOT NULL,
	[MonthOfYearName] [varchar](15) NOT NULL,
	[MonthOfYearAbbreviation] [varchar](3) NOT NULL,
	[MonthName] [varchar](15) NOT NULL,
	[MonthAbbreviation] [varchar](8) NOT NULL,
	[QuarterOfYearName] [varchar](15) NOT NULL,
	[QuarterName] [varchar](15) NOT NULL,
	[CalendarWeekOfYearNo] TINYINT NOT NULL,
	[CalendarWeekNo] INT NOT NULL,
	[CalendarMonthOfYearNo] TINYINT NOT NULL,
	[CalendarMonthNo] INT NOT NULL,
	[CalendarQuarterOfYearNo] TINYINT NOT NULL,
	[CalendarQuarterNo] INT NOT NULL,
	[CalendarQuarterOfYearNameStyle] [varchar](15) NOT NULL,
	[CalendarYear] SMALLINT NOT NULL,
	[CalendarDecade] [varchar](9) NOT NULL,
	[FinancialMonthOfYearNo] [varchar](2) NOT NULL,
	[FinancialMonthNo] [varchar](6) NOT NULL,
	[FinancialQuarterOfYearNo] TINYINT NOT NULL,
	[FinancialQuarterNo] SMALLINT NOT NULL,
	[FinancialQuarterOfYearNameStyle] [varchar](15) NOT NULL,
	[FinancialYear] SMALLINT NOT NULL,
	[FinancialYearStyle] [varchar](7) NOT NULL,
	[FinancialDecade] [varchar](9) NOT NULL,
	[WeekEndingSunDateKey] [int] NOT NULL,
	[WeekEndingSunStyle] [varchar](11) NOT NULL,
	[WeekEndingSunStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingSunStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingSunWeekOfYearNo] TINYINT NOT NULL,
	[WeekEndingSunMonthOfYearNo] TINYINT NOT NULL,
	[WeekEndingSunMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingSunYear] [varchar](4) NOT NULL,
	[WeekEndingMonDateKey] [int] NOT NULL,
	[WeekEndingMonStyle] [varchar](11) NOT NULL,
	[WeekEndingMonStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingMonStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingMonWeekOfYearNo] TINYINT NOT NULL,
	[WeekEndingMonMonthOfYearNo] TINYINT NOT NULL,
	[WeekEndingMonMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingMonYear] [varchar](4) NOT NULL,
	[WeekEndingTueDateKey] [int] NOT NULL,
	[WeekEndingTueStyle] [varchar](11) NOT NULL,
	[WeekEndingTueStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingTueStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingTueWeekOfYearNo] TINYINT NOT NULL,
	[WeekEndingTueMonthOfYearNo] TINYINT NOT NULL,
	[WeekEndingTueMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingTueYear] [varchar](4) NOT NULL,
	[WeekEndingWedDateKey] [int] NOT NULL,
	[WeekEndingWedStyle] [varchar](11) NOT NULL,
	[WeekEndingWedStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingWedStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingWedWeekOfYearNo] TINYINT NOT NULL,
	[WeekEndingWedMonthOfYearNo] TINYINT NOT NULL,
	[WeekEndingWedMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingWedYear] [varchar](4) NOT NULL,
	[WeekEndingThuDateKey] [int] NOT NULL,
	[WeekEndingThuStyle] [varchar](11) NOT NULL,
	[WeekEndingThuStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingThuStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingThuWeekOfYearNo] TINYINT NOT NULL,
	[WeekEndingThuMonthOfYearNo] TINYINT NOT NULL,
	[WeekEndingThuMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingThuYear] [varchar](4) NOT NULL,
	[WeekEndingFriDateKey] [int] NOT NULL,
	[WeekEndingFriStyle] [varchar](11) NOT NULL,
	[WeekEndingFriStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingFriStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingFriWeekOfYearNo] TINYINT NOT NULL,
	[WeekEndingFriMonthOfYearNo] TINYINT NOT NULL,
	[WeekEndingFriMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingFriYear] [varchar](4) NOT NULL,
	[WeekEndingSatDateKey] [int] NOT NULL,
	[WeekEndingSatStyle] [varchar](11) NOT NULL,
	[WeekEndingSatStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingSatStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingSatWeekOfYearNo] TINYINT NOT NULL,
	[WeekEndingSatMonthOfYearNo] TINYINT NOT NULL,
	[WeekEndingSatMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingSatYear] [varchar](4) NOT NULL,

	[DateOffset] INT  NULL,
	[MonthOffset] INT  NULL,
	[QuarterOffset] INT NULL,
	[CalendarYearOffset] SMALLINT  NULL,
	[FinancialYearOffset] SMALLINT  NULL,
	
	[StartDayofMonthDate] DATE NULL,
	[StartDayofMonthDateKey] INT NULL,
	[StartDayofMonthDateStyle] VARCHAR(10) NOT NULL DEFAULT '' ,
	[EndDayofMonthDate] DATE NULL,
	[EndDayofMonthDateKey] INT NULL,
	[EndDayofMonthDateStyle] VARCHAR(10) NOT NULL DEFAULT '' ,
	
	[StartDayofQuarterDate] DATE NULL,
	[StartDayofQuarterDateKey] INT NULL,
	[StartDayofQuarterDateStyle] VARCHAR(10) NOT NULL DEFAULT '' ,
	[EndDayofQuarterDate] DATE NULL,
	[EndDayofQuarterDateKey] INT NULL,
	[EndDayofQuarterDateStyle] VARCHAR(10) NOT NULL DEFAULT '' ,
	
	[StartDayofCalendarYearDate] DATE NULL,
	[StartDayofCalendarYearDateKey] INT NULL,
	[StartDayofCalendarYearDateStyle] VARCHAR(10) NOT NULL DEFAULT '' ,
	[EndDayofCalendarYearDate] DATE NULL,
	[EndDayofCalendarYearDateKey] INT NULL,
	[EndDayofCalendarYearDateStyle] VARCHAR(10) NOT NULL DEFAULT '' ,
	
	[StartDayofFinancialYearDate] DATE NULL,
	[StartDayofFinancialYearDateKey] INT NULL,
	[StartDayofFinancialYearDateStyle] VARCHAR(10) NOT NULL DEFAULT '' ,
	[EndDayofFinancialYearDate] DATE NULL,
	[EndDayofFinancialYearDateKey] INT NULL,
	[EndDayofFinancialYearDateStyle] VARCHAR(10) NOT NULL DEFAULT '' ,
	
	[DaysInMonth] TINYINT NULL,
	[DaysInCalendarYear] SMALLINT NULL,
	[DaysInFinancialYear] SMALLINT NULL
)

AS 

BEGIN

DECLARE @y CHAR(4) = DATEPART(YEAR,@date)
DECLARE @m CHAR(2) = RIGHT('00'+CAST(DATEPART(MONTH,@date) AS VARCHAR),2)
DECLARE @d CHAR(2) = RIGHT('00'+CAST(DATEPART(DAY,@date) AS VARCHAR),2)
DECLARE @datestyle CHAR(10) = DW_TOOLS.TOOLS.fu_DateStyle(NULL,@y,@m,@d)
DECLARE @datetime DATETIME = CASE WHEN ISDATE(@datestyle) = 1 THEN @datestyle END

/*
Start Day of Month
*/
DECLARE @startdayofmonthdate DATE = 
CASE WHEN DATEPART(YEAR,@date) = 9999 AND DATEPART(MONTH,@date) = 12 THEN '9999-12-01'
ELSE
CAST(DATEPART(YEAR,@date) AS VARCHAR)+'-'+CAST(DATEPART(MONTH,@date)AS VARCHAR)+'-01' END
DECLARE @startdayofmonthdatekey INT  = dw_tools.tools.[fu_DateDateInt] (@startdayofmonthdate)
DECLARE @startdayofmonthdatestyle VARCHAR(10) = DW_TOOLS.TOOLS.fu_DateStyle(@startdayofmonthdate,'','','')

/*
End Day of Month
*/
DECLARE @enddayofmonthdate DATE = 
CASE WHEN @startdayofmonthdate = '9999-12-01' THEN '9999-12-31'
ELSE
DATEADD(DAY,-1,DATEADD(MONTH,1,@startdayofmonthdate)) END
DECLARE @enddayofmonthdatekey INT = dw_tools.tools.[fu_DateDateInt] (@enddayofmonthdate)
DECLARE @enddayofmonthdatestyle VARCHAR(10)   = DW_TOOLS.TOOLS.fu_DateStyle(@enddayofmonthdate,'','','')

/*
Start Day of Quarter
*/
DECLARE @startdayofquarterdate DATE = 
CASE WHEN DATEPART(YEAR,@date) = 9999 AND DATEPART(QUARTER,@date) = 4 THEN '9999-12-01'
ELSE
CAST(DATEPART(YEAR,@date) AS VARCHAR)+'-'+
CASE WHEN DATEPART(QUARTER,@date) = 1 THEN '01'
WHEN DATEPART(QUARTER,@date) = 2 THEN '04'
WHEN DATEPART(QUARTER,@date) = 3 THEN '07'
WHEN DATEPART(QUARTER,@date) = 4 THEN '10'
END+'-01' END
DECLARE @startdayofquarterdatekey INT  = dw_tools.tools.[fu_DateDateInt] (@startdayofquarterdate)
DECLARE @startdayofquarterdatestyle VARCHAR(10) = DW_TOOLS.TOOLS.fu_DateStyle(@startdayofquarterdate,'','','')

/*
End Day of Quarter
*/
DECLARE @enddayofquarterdate DATE = 
CASE WHEN @startdayofmonthdate = '9999-12-01' THEN '9999-12-31'
ELSE
DATEADD(DAY,-1,DATEADD(QUARTER,1,@startdayofquarterdate)) END
DECLARE @enddayofquarterdatekey INT = dw_tools.tools.[fu_DateDateInt] (@enddayofquarterdate)
DECLARE @enddayofquarterdatestyle VARCHAR(10)   = DW_TOOLS.TOOLS.fu_DateStyle(@enddayofquarterdate,'','','')


/*
Start Day of Calendar Year
*/
DECLARE @startdayofcalendaryeardate DATE = DATENAME(YEAR, @date)+'-01-01'
DECLARE @startdayofcalendaryeardatekey INT  = dw_tools.tools.[fu_DateDateInt] (@startdayofcalendaryeardate)
DECLARE @startdayofcalendaryeardatestyle VARCHAR(10) = DW_TOOLS.TOOLS.fu_DateStyle(@startdayofcalendaryeardate,'','','')

/*
End Day of Calendar Year
*/
DECLARE @enddayofcalendaryeardate DATE = DATENAME(YEAR, @date)+'-12-31'
DECLARE @enddayofcalendaryeardatekey INT = dw_tools.tools.[fu_DateDateInt] (@enddayofcalendaryeardate)
DECLARE @enddayofcalendaryeardatestyle VARCHAR(10)   = DW_TOOLS.TOOLS.fu_DateStyle(@enddayofcalendaryeardate,'','','')

/*
Start Day of Financial Year
*/
DECLARE @startdayoffinancialyeardate DATE = 
CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 
THEN DATENAME(YEAR,@date)+'-04-01' ELSE DATENAME(YEAR,DATEADD(YEAR,-1,@date))+'-04-01' END
DECLARE @startdayoffinancialyeardatekey INT  = dw_tools.tools.[fu_DateDateInt] (@startdayoffinancialyeardate)
DECLARE @startdayoffinancialyeardatestyle VARCHAR(10) = DW_TOOLS.TOOLS.fu_DateStyle(@startdayoffinancialyeardate,'','','')

/*
End Day of Financial Year
*/
DECLARE @enddayoffinancialyeardate DATE  = 
CASE WHEN DATEPART(YEAR,@date) = 9999 THEN '9999-12-31' ELSE
CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 
THEN DATENAME(YEAR,DATEADD(YEAR,1,@date))+'-03-31' ELSE DATENAME(YEAR,@date)+'-03-31' END END
DECLARE @enddayoffinancialyeardatekey INT =dw_tools.tools.[fu_DateDateInt] (@enddayoffinancialyeardate)
DECLARE @enddayoffinancialyeardatestyle VARCHAR(10)   =  DW_TOOLS.TOOLS.fu_DateStyle(@enddayoffinancialyeardate,'','','')


BEGIN

INSERT INTO @return
(
	[DateKey] ,
	[DateValidFlag] ,
	[DateValid] ,
	[DateFormatValidFlag] ,
	[DateFormatValid] ,
	[Date] ,
	[DateStyle] ,
	[DateStyle2] ,
	[DateStyleddmmmyyyy],
	[DateStyleddmmmyy] ,
	[DateStyleddmmyyyy] ,
	[DateStyleddmmyy] ,
	[DateStyleyyyymmdd] ,
	[DateStyleFulldmy] ,
	[DayOfWeekNo] ,
	[DayOfWeekName] ,
	[DayOfWeekAbbreviation] ,
	[DayOfMonthNo] ,
	[DayOfCalendarYearNo] ,
	[DayOfFinancialYearNo] ,
	[WeekdayFlag] ,
	[WeekDayDescription],
	[MonthOfYearName] ,
	[MonthOfYearAbbreviation] ,
	[MonthName] ,
	[MonthAbbreviation] ,
	[QuarterOfYearName] ,
	[QuarterName],
	[CalendarWeekOfYearNo],
	[CalendarWeekNo],
	[CalendarMonthOfYearNo] ,
	[CalendarMonthNo] ,
	[CalendarQuarterOfYearNo] ,
	[CalendarQuarterNo] ,
	[CalendarQuarterOfYearNameStyle] ,
	[CalendarYear] ,
	[CalendarDecade] ,
	[FinancialMonthOfYearNo] ,
	[FinancialMonthNo] ,
	[FinancialQuarterOfYearNo] ,
	[FinancialQuarterNo] ,
	[FinancialQuarterOfYearNameStyle] ,
	[FinancialYear],
	[FinancialYearStyle],
	[FinancialDecade] ,
	[WeekEndingSunDateKey],
	[WeekEndingSunStyle],
	[WeekEndingSunStyleddmmmyy],
	[WeekEndingSunStyleddmmmyyyy] ,
	[WeekEndingSunWeekOfYearNo] ,
	[WeekEndingSunMonthOfYearNo] ,
	[WeekEndingSunMonthOfYearName] ,
	[WeekEndingSunYear] ,
	[WeekEndingMonDateKey] ,
	[WeekEndingMonStyle] ,
	[WeekEndingMonStyleddmmmyy] ,
	[WeekEndingMonStyleddmmmyyyy],
	[WeekEndingMonWeekOfYearNo],
	[WeekEndingMonMonthOfYearNo] ,
	[WeekEndingMonMonthOfYearName] ,
	[WeekEndingMonYear] ,
	[WeekEndingTueDateKey] ,
	[WeekEndingTueStyle] ,
	[WeekEndingTueStyleddmmmyy] ,
	[WeekEndingTueStyleddmmmyyyy] ,
	[WeekEndingTueWeekOfYearNo] ,
	[WeekEndingTueMonthOfYearNo] ,
	[WeekEndingTueMonthOfYearName] ,
	[WeekEndingTueYear] ,
	[WeekEndingWedDateKey] ,
	[WeekEndingWedStyle] ,
	[WeekEndingWedStyleddmmmyy],
	[WeekEndingWedStyleddmmmyyyy] ,
	[WeekEndingWedWeekOfYearNo] ,
	[WeekEndingWedMonthOfYearNo] ,
	[WeekEndingWedMonthOfYearName] ,
	[WeekEndingWedYear] ,
	[WeekEndingThuDateKey] ,
	[WeekEndingThuStyle] ,
	[WeekEndingThuStyleddmmmyy],
	[WeekEndingThuStyleddmmmyyyy],
	[WeekEndingThuWeekOfYearNo] ,
	[WeekEndingThuMonthOfYearNo] ,
	[WeekEndingThuMonthOfYearName] ,
	[WeekEndingThuYear] ,
	[WeekEndingFriDateKey] ,
	[WeekEndingFriStyle] ,
	[WeekEndingFriStyleddmmmyy] ,
	[WeekEndingFriStyleddmmmyyyy] ,
	[WeekEndingFriWeekOfYearNo] ,
	[WeekEndingFriMonthOfYearNo] ,
	[WeekEndingFriMonthOfYearName] ,
	[WeekEndingFriYear] ,
	[WeekEndingSatDateKey] ,
	[WeekEndingSatStyle] ,
	[WeekEndingSatStyleddmmmyy] ,
	[WeekEndingSatStyleddmmmyyyy],
	[WeekEndingSatWeekOfYearNo] ,
	[WeekEndingSatMonthOfYearNo] ,
	[WeekEndingSatMonthOfYearName] ,
	[WeekEndingSatYear] ,

	[DateOffset],
	[MonthOffset],
	 [QuarterOffset],
	[CalendarYearOffset],
	[FinancialYearOffset],
	
	[StartDayofMonthDate] ,
	[StartDayofMonthDateKey] ,
	[StartDayofMonthDateStyle] ,
	[EndDayofMonthDate] ,
	[EndDayofMonthDateKey] ,
	[EndDayofMonthDateStyle],
	
		[StartDayofQuarterDate] ,
	[StartDayofQuarterDateKey] ,
	[StartDayofQuarterDateStyle]  ,
	[EndDayofQuarterDate] ,
	[EndDayofQuarterDateKey] ,
	[EndDayofQuarterDateStyle]  ,
	
	[StartDayofCalendarYearDate] ,
	[StartDayofCalendarYearDateKey] ,
	[StartDayofCalendarYearDateStyle] ,
	[EndDayofCalendarYearDate] ,
	[EndDayofCalendarYearDateKey] ,
	[EndDayofCalendarYearDateStyle],
	
	[StartDayofFinancialYearDate] ,
	[StartDayofFinancialYearDateKey] ,
	[StartDayofFinancialYearDateStyle] ,
	[EndDayofFinancialYearDate] ,
	[EndDayofFinancialYearDateKey] ,
	[EndDayofFinancialYearDateStyle],
	
	[DaysInMonth],
	[DaysInCalendarYear],
	[DaysInFinancialYear]
)

SELECT
[DateKey] = dw_tools.tools.[fu_DateDateInt] (@date)
,[DateValidFlag] = ISDATE(@datetime)
,[DateValid] = CASE WHEN ISDATE(@datetime) = 1 THEN 'Valid' ELSE 'Invalid' END
,DateFormatValidFlag = dw_tools.tools.Fu_DateStyleValid(@datestyle)
,DateFormatValid = CASE WHEN dw_tools.tools.Fu_DateStyleValid(@datestyle) = 1 THEN 'Valid' ELSE 'Invalid' END 
,[Date] = @date
,[DateStyle] = @datestyle
,[DateStyle] = REPLACE(@datestyle,'/','.')
,[DateStyleddmmmyyyy] = dw_tools.tools.fu_DateStyleddmmmyyyy(@datetime)
,[DateStyleddmmmyy]  = dw_tools.tools.fu_DateStyleddmmmyy(@datetime)
,[DateStyleddmmyyyy]  = dw_tools.tools.fu_DateStyleddmmyyyy(@datetime)
,[DateStyleddmmyy]  = dw_tools.tools.fu_DateStyleddmmyy(@datetime)
,[DateStyleyyyymmdd]  = dw_tools.tools.fu_DateStyleyyyymmdd(@datetime)
,[DateStyleFulldmy]  = dw_tools.tools.fu_DateStyleFulldmy(@datetime)
--day
,[DayOfWeekNo] = CASE WHEN DATEPART(WEEKDAY,@date ) BETWEEN 2 AND 7 
THEN DATEPART(WEEKDAY,@date )-1 ELSE 7 END 

,[DayOfWeekName] = DATENAME(WEEKDAY,@date)

,[DayOfWeekAbbreviation] = LEFT(DATENAME(WEEKDAY,@date ),3)
,[DayOfMonthNo] = DATEPART(DAY,@date) 


,[DayOfCalendarYearNo] = DATEPART(dayofyear,@date) 
,[DayOfFinancialYearNo]  = dw_tools.tools.fu_DateFinancialDayOfYear(@datetime)


,[WeekdayFlag]  = CASE WHEN ISDATE(@datetime) = 1 THEN CASE WHEN DATENAME(WEEKDAY,@date ) LIKE 'S%' THEN 0 ELSE 1 END END
,[WeekdayDescription] = CASE WHEN ISDATE(@datetime) = 1 THEN CASE WHEN DATENAME(WEEKDAY,@date ) LIKE 'S%' THEN 'Weekend'ELSE 'Weekday' END END
,[MonthOfYearName] = DATENAME(MONTH,@date)
,[MonthOfYearAbbreviation] = LEFT(DATENAME(MONTH,@date),3)
,[MonthName] = DATENAME(MONTH,@date)+' '+DATENAME(YEAR,@date)
,[MonthAbbreviation] = LEFT(DATENAME(MONTH,@date),3)+' '+DATENAME(YEAR,@date)

--quarter
,[QuarterOfYearName] =  CASE WHEN ISDATE(@datetime) = 1 THEN CASE WHEN DATENAME(QUARTER, @date) = 1 THEN 'Jan-Mar' WHEN DATENAME(QUARTER, @date) = 2 THEN 'Apr-Jun' WHEN DATENAME(QUARTER, @date) = 3 THEN 'Jul-Sep' ELSE 'Oct-Dec' END END
,[QuarterName] = CASE WHEN DATENAME(QUARTER, @date) = 1 THEN 'Jan-Mar '+DATENAME(YEAR,@date) WHEN DATENAME(QUARTER, @date) = 2 THEN 'Apr-Jun '+DATENAME(YEAR,@date) WHEN DATENAME(QUARTER, @date) = 3 THEN 'Jul-Sep '+DATENAME(YEAR,@date)  ELSE 'Oct-Dec '+DATENAME(YEAR,@date) END

--calendar
,[CalendarWeekOfYearNo] = DATEPART(WEEK, @date) 
,[CalendarWeekNo] = CAST(DATENAME(YEAR, @date)+RIGHT('00'+DATENAME(WEEK, @date),2) AS INT)
,[CalendarMonthOfYearNo] = DATEPART(MONTH,@date) 
,[CalendarMonthNo] = CAST(DATENAME(YEAR, @date)+RIGHT('00'+CAST(DATEPART(MONTH,@date) AS VARCHAR),2) AS INT)
,[CalendarQuarterOfYearNo] = DATEPART(QUARTER,@date)
,[CalendarQuarterNo] = CAST(DATENAME(YEAR,@date)+DATENAME(QUARTER,@date) AS SMALLINT)

,[CalendarQuarterOfYearNameStyle] = 
dw_tools.tools.fu_StringTrimDoubleSpaces('Q'+CAST(DATEPART(QUARTER,@date) AS CHAR)+' ('+CASE WHEN DATENAME(QUARTER, @date) = 1 THEN 'Jan-Mar' WHEN DATENAME(QUARTER, @date) = 2 THEN 'Apr-Jun' WHEN DATENAME(QUARTER, @date) = 3 
THEN 'Jul-Sep' ELSE 'Oct-Dec' END+')')
,[CalendarYear] = DATEPART(YEAR,@date)
,[CalendarDecade] = dw_tools.tools.fu_datecalendardecade(@datetime)

--financial
,[FinancialMonthOfYearNo] = CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 THEN CAST(DATEPART(MONTH,@date)-3 AS VARCHAR) ELSE CAST(DATEPART(MONTH,@date)+9 AS VARCHAR) END
,[FinancialMonthNo] = CAST(CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 
THEN DATENAME(YEAR,@date) ELSE DATENAME(YEAR,DATEADD(YEAR,-1,@date)) 
END+RIGHT('00'+CAST(CASE WHEN DATEPART(QUARTER, @date) 
BETWEEN 2 AND 4 THEN DATEPART(MONTH,@date)-3 ELSE DATEPART(MONTH,@date)+9 END AS VARCHAR),2) AS INT)

,[FinancialQuarterOfYearNo] = CASE WHEN ISDATE(@datetime) = 1 THEN CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 THEN DATEPART(QUARTER,@date)-1 ELSE 4 END END
,[FinancialQuarterNo] = CAST(CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 THEN DATENAME(YEAR,@date)+DATENAME(QUARTER,@date)-1 ELSE DATENAME(YEAR,DATEADD(YEAR,-1,@date))+'4' END AS SMALLINT)
,[FinancialQuarterOfYearNameStyle] = CASE WHEN ISDATE(@datetime) = 1 THEN dw_tools.tools.fu_StringTrimDoubleSpaces('Q'+CAST(CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 THEN DATEPART(QUARTER,@date)-1 ELSE 4 END AS CHAR)+' ('+ CASE WHEN DATENAME(QUARTER, @date) = 1 THEN 'Jan-Mar' WHEN DATENAME(QUARTER, @date) = 2 THEN 'Apr-Jun' WHEN DATENAME(QUARTER, @date) = 3 THEN 'Jul-Sep' ELSE 'Oct-Dec' END+')') END

,[FinancialYear] = CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 
THEN DATEPART(YEAR,@date) ELSE DATEPART(YEAR,DATEADD(YEAR,-1,@date)) END

,[FinancialYearStyle] = CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 AND DATENAME(YEAR,@date) = '9999' THEN '9999/00' WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4  THEN DATENAME(YEAR,@date)+'/'+RIGHT(DATENAME(YEAR,DATEADD(YEAR,1,@date)),2) ELSE DATENAME(YEAR,DATEADD(YEAR,-1,@date))+'/'+RIGHT(DATENAME(YEAR,@date),2) END
,[FinancialDecade] = dw_tools.tools.fu_datefinancialdecade(@datetime)


--week ending Sun
,[WeekEndingSunDateKey] = dw_tools.tools.fu_DateDateInt (dw_tools.tools.fu_DateWeekEnding(@datetime, 1))
,[WeekEndingSunStyle] = dw_tools.tools.fu_datestyle(dw_tools.tools.fu_DateWeekEnding(@datetime, 1),'','','')
,[WeekEndingSunStyleddmmmyy] = dw_tools.tools.[fu_datestyleddmmmyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 1))
,[WeekEndingSunStyleddmmmyyyy] = dw_tools.tools.[fu_datestyleddmmmyyyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 1))
,[WeekEndingSunWeekOfYearNo] = DATEPART(WEEK,dw_tools.tools.fu_DateWeekEnding(@datetime, 1))
,[WeekEndingSunSunthOfYearNo] = DATEPART(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 1))
,[WeekEndingSunSunthOfYearName] = DATENAME(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 1))
,[WeekEndingSunYear] = DATENAME(YEAR,dw_tools.tools.fu_DateWeekEnding(@datetime, 1))
--week ending Mon
,[WeekEndingMonDateKey] = dw_tools.tools.fu_DateDateInt (dw_tools.tools.fu_DateWeekEnding(@datetime, 2))
,[WeekEndingMonStyle] = dw_tools.tools.fu_datestyle(dw_tools.tools.fu_DateWeekEnding(@datetime, 2),'','','')
,[WeekEndingMonStyleddmmmyy] = dw_tools.tools.[fu_datestyleddmmmyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 2))
,[WeekEndingMonStyleddmmmyyyy] = dw_tools.tools.[fu_datestyleddmmmyyyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 2))
,[WeekEndingMonWeekOfYearNo] = DATEPART(WEEK,dw_tools.tools.fu_DateWeekEnding(@datetime, 2))
,[WeekEndingMonMonthOfYearNo] = DATEPART(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 2))
,[WeekEndingMonMonthOfYearName] = DATENAME(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 2))
,[WeekEndingMonYear] = DATENAME(YEAR,dw_tools.tools.fu_DateWeekEnding(@datetime, 2))
--week ending Tue
,[WeekEndingTueDateKey] = dw_tools.tools.fu_DateDateInt (dw_tools.tools.fu_DateWeekEnding(@datetime, 3))
,[WeekEndingTueStyle] = dw_tools.tools.fu_datestyle(dw_tools.tools.fu_DateWeekEnding(@datetime, 3),'','','')
,[WeekEndingTueStyleddmmmyy] = dw_tools.tools.[fu_datestyleddmmmyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 3))
,[WeekEndingTueStyleddmmmyyyy] = dw_tools.tools.[fu_datestyleddmmmyyyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 3))
,[WeekEndingTueWeekOfYearNo] = DATEPART(WEEK,dw_tools.tools.fu_DateWeekEnding(@datetime, 3))
,[WeekEndingTueTuethOfYearNo] = DATEPART(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 3))
,[WeekEndingTueTuethOfYearName] = DATENAME(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 3))
,[WeekEndingTueYear] = DATENAME(YEAR,dw_tools.tools.fu_DateWeekEnding(@datetime, 3))
--week ending Wed
,[WeekEndingWedDateKey] = dw_tools.tools.fu_DateDateInt (dw_tools.tools.fu_DateWeekEnding(@datetime, 4))
,[WeekEndingWedStyle] = dw_tools.tools.fu_datestyle(dw_tools.tools.fu_DateWeekEnding(@datetime, 4),'','','')
,[WeekEndingWedStyleddmmmyy] = dw_tools.tools.[fu_datestyleddmmmyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 4))
,[WeekEndingWedStyleddmmmyyyy] = dw_tools.tools.[fu_datestyleddmmmyyyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 4))
,[WeekEndingWedWeekOfYearNo] = DATEPART(WEEK,dw_tools.tools.fu_DateWeekEnding(@datetime, 4))
,[WeekEndingWedWedthOfYearNo] = DATEPART(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 4))
,[WeekEndingWedWedthOfYearName] = DATENAME(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 4))
,[WeekEndingWedYear] = DATENAME(YEAR,dw_tools.tools.fu_DateWeekEnding(@datetime, 4))
--week ending Thu
,[WeekEndingThuDateKey] = dw_tools.tools.fu_DateDateInt (dw_tools.tools.fu_DateWeekEnding(@datetime, 5))
,[WeekEndingThuStyle] = dw_tools.tools.fu_datestyle(dw_tools.tools.fu_DateWeekEnding(@datetime, 5),'','','')
,[WeekEndingThuStyleddmmmyy] = dw_tools.tools.[fu_datestyleddmmmyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 5))
,[WeekEndingThuStyleddmmmyyyy] = dw_tools.tools.[fu_datestyleddmmmyyyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 5))
,[WeekEndingThuWeekOfYearNo] = DATEPART(WEEK,dw_tools.tools.fu_DateWeekEnding(@datetime, 5))
,[WeekEndingThuThuthOfYearNo] = DATEPART(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 5))
,[WeekEndingThuThuthOfYearName] = DATENAME(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 5))
,[WeekEndingThuYear] = DATENAME(YEAR,dw_tools.tools.fu_DateWeekEnding(@datetime, 5))
--week ending Fri
,[WeekEndingFriDateKey] = dw_tools.tools.fu_DateDateInt (dw_tools.tools.fu_DateWeekEnding(@datetime, 6))
,[WeekEndingFriStyle] = dw_tools.tools.fu_datestyle(dw_tools.tools.fu_DateWeekEnding(@datetime, 6),'','','')
,[WeekEndingFriStyleddmmmyy] = dw_tools.tools.[fu_datestyleddmmmyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 6))
,[WeekEndingFriStyleddmmmyyyy] = dw_tools.tools.[fu_datestyleddmmmyyyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 6))
,[WeekEndingFriWeekOfYearNo] = DATEPART(WEEK,dw_tools.tools.fu_DateWeekEnding(@datetime, 6))
,[WeekEndingFriFrithOfYearNo] = DATEPART(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 6))
,[WeekEndingFriFrithOfYearName] = DATENAME(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 6))
,[WeekEndingFriYear] = DATENAME(YEAR,dw_tools.tools.fu_DateWeekEnding(@datetime, 6))
--week ending Sat
,[WeekEndingSatDateKey] = dw_tools.tools.fu_DateDateInt (dw_tools.tools.fu_DateWeekEnding(@datetime, 7))
,[WeekEndingSatStyle] = dw_tools.tools.fu_datestyle(dw_tools.tools.fu_DateWeekEnding(@datetime, 7),'','','')
,[WeekEndingSatStyleddmmmyy] = dw_tools.tools.[fu_datestyleddmmmyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 7))
,[WeekEndingSatStyleddmmmyyyy] = dw_tools.tools.[fu_datestyleddmmmyyyy] (dw_tools.tools.fu_DateWeekEnding(@datetime, 7))
,[WeekEndingSatWeekOfYearNo] = DATEPART(WEEK,dw_tools.tools.fu_DateWeekEnding(@datetime, 7))
,[WeekEndingSatSatthOfYearNo] = DATEPART(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 7))
,[WeekEndingSatSatthOfYearName] = DATENAME(MONTH,dw_tools.tools.fu_DateWeekEnding(@datetime, 7))
,[WeekEndingSatYear] = DATENAME(YEAR,dw_tools.tools.fu_DateWeekEnding(@datetime, 7))


	,[DateOffset] = DATEDIFF(DAY,GETDATE(),@date)
 
 	,[MonthOffset]= DATEDIFF(MONTH,GETDATE(),@date)
 	
 	,[QuarterOffset]= DATEDIFF(QUARTER,GETDATE(),@date)
 	
	,[CalendarYearOffset]= DATEDIFF(YEAR,GETDATE(),@date)
	
	,[FinancialYearOffset]= 
	CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 
THEN DATEPART(YEAR,@date) ELSE DATEPART(YEAR,DATEADD(YEAR,-1,@date)) END
-
CASE WHEN DATEPART(QUARTER, GETDATE()) BETWEEN 2 AND 4 
THEN DATEPART(YEAR,GETDATE()) ELSE DATEPART(YEAR,DATEADD(YEAR,-1,GETDATE())) END

 
	,[StartDayofMonthDate]  = @startdayofmonthdate
	,[StartDayofMonthDateKey] = @startdayofmonthdatekey
	,[StartDayofMonthDateStyle] = @startdayofmonthdatestyle
	,[EndDayofMonthDate]  = @enddayofmonthdate
	,[EndDayofMonthDateKey] = @enddayofmonthdatekey
	,[EndDayofMonthDateStyle] = @enddayofmonthdatestyle
	
	,[StartDayofQuarterDate]  = @startdayofQuarterdate
	,[StartDayofQuarterDateKey] = @startdayofQuarterdatekey
	,[StartDayofQuarterDateStyle] = @startdayofQuarterdatestyle
	,[EndDayofQuarterDate]  = @enddayofQuarterdate
	,[EndDayofQuarterDateKey] = @enddayofQuarterdatekey
	,[EndDayofQuarterDateStyle] = @enddayofQuarterdatestyle
	
	,[StartDayofCalendarYearDate]  = @startdayofcalendaryeardate
	,[StartDayofCalendarYearDateKey] = @startdayofcalendaryeardatekey
	,[StartDayofCalendarYearDateStyle] = @startdayofcalendaryeardatestyle
	,[EndDayofCalendarYearDate]  = @enddayofcalendaryeardate
	,[EndDayofCalendarYearDateKey] = @enddayofcalendaryeardatekey
	,[EndDayofCalendarYearDateStyle] = @enddayofcalendaryeardatestyle
	
	,[StartDayofFinancialYearDate]  = @startdayofFinancialyeardate
	,[StartDayofFinancialYearDateKey] = @startdayofFinancialyeardatekey
	,[StartDayofFinancialYearDateStyle] = @startdayofFinancialyeardatestyle
	,[EndDayofFinancialYearDate]  = @enddayofFinancialyeardate
	,[EndDayofFinancialYearDateKey] = @enddayofFinancialyeardatekey
	,[EndDayofFinancialYearDateStyle] = @enddayofFinancialyeardatestyle
	
	,[DaysInMonth] = DATEDIFF(DAY,@startdayofmonthdate, DATEADD(MONTH,1,@startdayofmonthdate))
	,[DaysInCalendarYear] = DATEDIFF(DAY,@startdayofcalendaryeardate, DATEADD(YEAR,1,@startdayofcalendaryeardate))
	,[DaysInFinancialYear] = DATEDIFF(DAY,@startdayoffinancialyeardate, @enddayoffinancialyeardate)+1
	
	
	END
	


RETURN




END


















GO


