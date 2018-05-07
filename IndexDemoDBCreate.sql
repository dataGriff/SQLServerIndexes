
--####################################################################
RAISERROR('1.0 Create IndexDemo Database',10,0);
GO
--####################################################################
USE [Master]
GO
IF NOT EXISTS (SELECT * FROM SYS.databases WHERE name = 'indexdemo')
BEGIN
CREATE DATABASE [IndexDemo];
END 
GO 

USE [IndexDemo]
GO
--####################################################################
RAISERROR('2.0 Create Schemas...',10,0);
GO
--####################################################################
DECLARE @sql NVARCHAR(255) = '';
--####################################################################
RAISERROR('2.1 Create Schema Tools',10,0);
--####################################################################
IF SCHEMA_ID('tools') IS NULL
BEGIN
SET @Sql = 'CREATE SCHEMA [tools];';
EXEC sp_executesql @sql;
END
--####################################################################
RAISERROR('2.2 Create Schema Import',10,0);
--####################################################################
IF SCHEMA_ID('import') IS NULL
BEGIN
SET @Sql = 'CREATE SCHEMA [import];';
EXEC sp_executesql @sql;
END
--####################################################################
RAISERROR('2.3 Create Schema Acc',10,0);
--####################################################################
IF SCHEMA_ID('acc') IS NULL
BEGIN
SET @Sql = 'CREATE SCHEMA [acc];';
EXEC sp_executesql @sql;
END

GO

USE [IndexDemo]
GO
--####################################################################
RAISERROR('3.0 Create Tables...',10,0);
GO
--####################################################################
USE [IndexDemo]
GO
--####################################################################
RAISERROR('3.1 Create Table DimDate',10,0);
GO
--####################################################################
IF OBJECT_ID('[import].[DimDate]') IS NOT NULL
DROP TABLE [import].[DimDate];
GO 
CREATE TABLE [import].[DimDate](
	[DateKey] [int] NOT NULL,
	[DateValidFlag] [int] NOT NULL,
	[DateValid] [varchar](15) NOT NULL,
	[DateFormatValidFlag] [int] NOT NULL,
	[DateFormatValid] [varchar](15) NOT NULL,
	[Date] [date] NULL,
	[DateStyle] [varchar](10) NOT NULL,
	[DateStyle2] [varchar](10) NOT NULL,
	[DateStyleddmmmyyyy] [varchar](11) NOT NULL,
	[DateStyleddmmmyy] [varchar](9) NOT NULL,
	[DateStyleddmmyyyy] [varchar](10) NOT NULL,
	[DateStyleddmmyy] [varchar](8) NOT NULL,
	[DateStyleyyyymmdd] [varchar](10) NOT NULL,
	[DateStyleFulldmy] [varchar](17) NOT NULL,
	[DayOfWeekNo] [tinyint] NOT NULL,
	[DayOfWeekName] [varchar](15) NOT NULL,
	[DayOfWeekAbbreviation] [varchar](3) NOT NULL,
	[DayOfMonthNo] [tinyint] NOT NULL,
	[DayOfCalendarYearNo] [smallint] NOT NULL,
	[DayOfFinancialYearNo] [smallint] NOT NULL,
	[WeekdayFlag] [smallint] NOT NULL,
	[WeekDayDescription] [varchar](15) NOT NULL,
	[MonthOfYearName] [varchar](15) NOT NULL,
	[MonthOfYearAbbreviation] [varchar](3) NOT NULL,
	[MonthName] [varchar](15) NOT NULL,
	[MonthAbbreviation] [varchar](8) NOT NULL,
	[QuarterOfYearName] [varchar](15) NOT NULL,
	[QuarterName] [varchar](15) NOT NULL,
	[CalendarWeekOfYearNo] [tinyint] NOT NULL,
	[CalendarWeekNo] [int] NOT NULL,
	[CalendarMonthOfYearNo] [tinyint] NOT NULL,
	[CalendarMonthNo] [int] NOT NULL,
	[CalendarQuarterOfYearNo] [tinyint] NOT NULL,
	[CalendarQuarterNo] [int] NOT NULL,
	[CalendarQuarterOfYearNameStyle] [varchar](15) NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarDecade] [varchar](9) NOT NULL,
	[FinancialMonthOfYearNo] [varchar](2) NOT NULL,
	[FinancialMonthNo] [varchar](6) NOT NULL,
	[FinancialQuarterOfYearNo] [tinyint] NOT NULL,
	[FinancialQuarterNo] [smallint] NOT NULL,
	[FinancialQuarterOfYearNameStyle] [varchar](15) NOT NULL,
	[FinancialYear] [smallint] NOT NULL,
	[FinancialYearStyle] [varchar](7) NOT NULL,
	[FinancialDecade] [varchar](9) NOT NULL,
	[WeekEndingSunDateKey] [int] NOT NULL,
	[WeekEndingSunStyle] [varchar](11) NOT NULL,
	[WeekEndingSunStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingSunStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingSunWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSunMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSunMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingSunYear] [varchar](4) NOT NULL,
	[WeekEndingMonDateKey] [int] NOT NULL,
	[WeekEndingMonStyle] [varchar](11) NOT NULL,
	[WeekEndingMonStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingMonStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingMonWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingMonMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingMonMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingMonYear] [varchar](4) NOT NULL,
	[WeekEndingTueDateKey] [int] NOT NULL,
	[WeekEndingTueStyle] [varchar](11) NOT NULL,
	[WeekEndingTueStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingTueStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingTueWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingTueMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingTueMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingTueYear] [varchar](4) NOT NULL,
	[WeekEndingWedDateKey] [int] NOT NULL,
	[WeekEndingWedStyle] [varchar](11) NOT NULL,
	[WeekEndingWedStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingWedStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingWedWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingWedMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingWedMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingWedYear] [varchar](4) NOT NULL,
	[WeekEndingThuDateKey] [int] NOT NULL,
	[WeekEndingThuStyle] [varchar](11) NOT NULL,
	[WeekEndingThuStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingThuStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingThuWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingThuMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingThuMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingThuYear] [varchar](4) NOT NULL,
	[WeekEndingFriDateKey] [int] NOT NULL,
	[WeekEndingFriStyle] [varchar](11) NOT NULL,
	[WeekEndingFriStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingFriStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingFriWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingFriMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingFriMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingFriYear] [varchar](4) NOT NULL,
	[WeekEndingSatDateKey] [int] NOT NULL,
	[WeekEndingSatStyle] [varchar](11) NOT NULL,
	[WeekEndingSatStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingSatStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingSatWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSatMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSatMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingSatYear] [varchar](4) NOT NULL,
	[DateOffset] [int] NULL,
	[MonthOffset] [int] NULL,
	[QuarterOffset] [int] NULL,
	[CalendarYearOffset] [smallint] NULL,
	[FinancialYearOffset] [smallint] NULL,
	[StartDayofMonthDate] [date] NULL,
	[StartDayofMonthDateKey] [int] NULL,
	[StartDayofMonthDateStyle] [varchar](10) NOT NULL,
	[EndDayofMonthDate] [date] NULL,
	[EndDayofMonthDateKey] [int] NULL,
	[EndDayofMonthDateStyle] [varchar](10) NOT NULL,
	[StartDayofQuarterDate] [date] NULL,
	[StartDayofQuarterDateKey] [int] NULL,
	[StartDayofQuarterDateStyle] [varchar](10) NOT NULL,
	[EndDayofQuarterDate] [date] NULL,
	[EndDayofQuarterDateKey] [int] NULL,
	[EndDayofQuarterDateStyle] [varchar](10) NOT NULL,
	[StartDayofCalendarYearDate] [date] NULL,
	[StartDayofCalendarYearDateKey] [int] NULL,
	[StartDayofCalendarYearDateStyle] [varchar](10) NOT NULL,
	[EndDayofCalendarYearDate] [date] NULL,
	[EndDayofCalendarYearDateKey] [int] NULL,
	[EndDayofCalendarYearDateStyle] [varchar](10) NOT NULL,
	[StartDayofFinancialYearDate] [date] NULL,
	[StartDayofFinancialYearDateKey] [int] NULL,
	[StartDayofFinancialYearDateStyle] [varchar](10) NOT NULL,
	[EndDayofFinancialYearDate] [date] NULL,
	[EndDayofFinancialYearDateKey] [int] NULL,
	[EndDayofFinancialYearDateStyle] [varchar](10) NOT NULL,
	[DaysInMonth] [tinyint] NULL,
	[DaysInCalendarYear] [smallint] NULL,
	[DaysInFinancialYear] [smallint] NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) 

USE [IndexDemo]
GO
--####################################################################
RAISERROR('3.2 Create Table DimDateChar',10,0);
GO
--####################################################################
IF OBJECT_ID('[import].[DimDateChar]') IS NOT NULL
DROP TABLE [import].[DimDateChar];
GO 
CREATE TABLE [import].[DimDateChar](
	[DateKey] [int] NOT NULL,
	[DateValidFlag] [int] NOT NULL,
	[DateValid] [varchar](15) NOT NULL,
	[DateFormatValidFlag] [int] NOT NULL,
	[DateFormatValid] [varchar](15) NOT NULL,
	[Date] [date] NULL,
	[DateStyle] [varchar](10) NOT NULL,
	[DateStyle2] [varchar](10) NOT NULL,
	[DateStyleddmmmyyyy] [varchar](11) NOT NULL,
	[DateStyleddmmmyy] [varchar](9) NOT NULL,
	[DateStyleddmmyyyy] [varchar](10) NOT NULL,
	[DateStyleddmmyy] [varchar](8) NOT NULL,
	[DateStyleyyyymmdd] [varchar](10) NOT NULL,
	[DateStyleFulldmy] [varchar](17) NOT NULL,
	[DayOfWeekNo] [tinyint] NOT NULL,
	[DayOfWeekName] [varchar](15) NOT NULL,
	[DayOfWeekAbbreviation] [varchar](3) NOT NULL,
	[DayOfMonthNo] [tinyint] NOT NULL,
	[DayOfCalendarYearNo] [smallint] NOT NULL,
	[DayOfFinancialYearNo] [smallint] NOT NULL,
	[WeekdayFlag] [smallint] NOT NULL,
	[WeekDayDescription] [varchar](15) NOT NULL,
	[MonthOfYearName] [varchar](15) NOT NULL,
	[MonthOfYearAbbreviation] [varchar](3) NOT NULL,
	[MonthName] [varchar](15) NOT NULL,
	[MonthAbbreviation] [varchar](8) NOT NULL,
	[QuarterOfYearName] [varchar](15) NOT NULL,
	[QuarterName] [varchar](15) NOT NULL,
	[CalendarWeekOfYearNo] [tinyint] NOT NULL,
	[CalendarWeekNo] [int] NOT NULL,
	[CalendarMonthOfYearNo] [tinyint] NOT NULL,
	[CalendarMonthNo] [int] NOT NULL,
	[CalendarQuarterOfYearNo] [tinyint] NOT NULL,
	[CalendarQuarterNo] [int] NOT NULL,
	[CalendarQuarterOfYearNameStyle] [varchar](15) NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarDecade] [varchar](9) NOT NULL,
	[FinancialMonthOfYearNo] [varchar](2) NOT NULL,
	[FinancialMonthNo] [varchar](6) NOT NULL,
	[FinancialQuarterOfYearNo] [tinyint] NOT NULL,
	[FinancialQuarterNo] [smallint] NOT NULL,
	[FinancialQuarterOfYearNameStyle] [varchar](15) NOT NULL,
	[FinancialYear] [smallint] NOT NULL,
	[FinancialYearStyle] [varchar](7) NOT NULL,
	[FinancialDecade] [varchar](9) NOT NULL,
	[WeekEndingSunDateKey] [int] NOT NULL,
	[WeekEndingSunStyle] [varchar](11) NOT NULL,
	[WeekEndingSunStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingSunStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingSunWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSunMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSunMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingSunYear] [varchar](4) NOT NULL,
	[WeekEndingMonDateKey] [int] NOT NULL,
	[WeekEndingMonStyle] [varchar](11) NOT NULL,
	[WeekEndingMonStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingMonStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingMonWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingMonMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingMonMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingMonYear] [varchar](4) NOT NULL,
	[WeekEndingTueDateKey] [int] NOT NULL,
	[WeekEndingTueStyle] [varchar](11) NOT NULL,
	[WeekEndingTueStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingTueStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingTueWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingTueMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingTueMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingTueYear] [varchar](4) NOT NULL,
	[WeekEndingWedDateKey] [int] NOT NULL,
	[WeekEndingWedStyle] [varchar](11) NOT NULL,
	[WeekEndingWedStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingWedStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingWedWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingWedMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingWedMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingWedYear] [varchar](4) NOT NULL,
	[WeekEndingThuDateKey] [int] NOT NULL,
	[WeekEndingThuStyle] [varchar](11) NOT NULL,
	[WeekEndingThuStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingThuStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingThuWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingThuMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingThuMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingThuYear] [varchar](4) NOT NULL,
	[WeekEndingFriDateKey] [int] NOT NULL,
	[WeekEndingFriStyle] [varchar](11) NOT NULL,
	[WeekEndingFriStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingFriStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingFriWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingFriMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingFriMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingFriYear] [varchar](4) NOT NULL,
	[WeekEndingSatDateKey] [int] NOT NULL,
	[WeekEndingSatStyle] [varchar](11) NOT NULL,
	[WeekEndingSatStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingSatStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingSatWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSatMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSatMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingSatYear] [varchar](4) NOT NULL,
	[DateOffset] [int] NULL,
	[MonthOffset] [int] NULL,
	[QuarterOffset] [int] NULL,
	[CalendarYearOffset] [smallint] NULL,
	[FinancialYearOffset] [smallint] NULL,
	[StartDayofMonthDate] [date] NULL,
	[StartDayofMonthDateKey] [int] NULL,
	[StartDayofMonthDateStyle] [varchar](10) NOT NULL,
	[EndDayofMonthDate] [date] NULL,
	[EndDayofMonthDateKey] [int] NULL,
	[EndDayofMonthDateStyle] [varchar](10) NOT NULL,
	[StartDayofQuarterDate] [date] NULL,
	[StartDayofQuarterDateKey] [int] NULL,
	[StartDayofQuarterDateStyle] [varchar](10) NOT NULL,
	[EndDayofQuarterDate] [date] NULL,
	[EndDayofQuarterDateKey] [int] NULL,
	[EndDayofQuarterDateStyle] [varchar](10) NOT NULL,
	[StartDayofCalendarYearDate] [date] NULL,
	[StartDayofCalendarYearDateKey] [int] NULL,
	[StartDayofCalendarYearDateStyle] [varchar](10) NOT NULL,
	[EndDayofCalendarYearDate] [date] NULL,
	[EndDayofCalendarYearDateKey] [int] NULL,
	[EndDayofCalendarYearDateStyle] [varchar](10) NOT NULL,
	[StartDayofFinancialYearDate] [date] NULL,
	[StartDayofFinancialYearDateKey] [int] NULL,
	[StartDayofFinancialYearDateStyle] [varchar](10) NOT NULL,
	[EndDayofFinancialYearDate] [date] NULL,
	[EndDayofFinancialYearDateKey] [int] NULL,
	[EndDayofFinancialYearDateStyle] [varchar](10) NOT NULL,
	[DaysInMonth] [tinyint] NULL,
	[DaysInCalendarYear] [smallint] NULL,
	[DaysInFinancialYear] [smallint] NULL,
	[CalendarMonthNoChar] [char](6) NULL,
 CONSTRAINT [PK_DimDateChar] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
)
CREATE NONCLUSTERED INDEX [ncidx_DimDate_Filter_CalendarMonthNo] ON [import].[DimDateChar]
(
	[CalendarMonthNoChar] ASC
)
INCLUDE ( 	[DayOfWeekName],
	[DayOfMonthNo],
	[MonthOfYearName],
	[CalendarYear]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

 
GO 



USE [IndexDemo]
GO
--####################################################################
RAISERROR('3.3 Create Table DimDateHeap',10,0);
GO
--####################################################################
IF OBJECT_ID('[import].[DimDateHeap]') IS NOT NULL
DROP TABLE [import].[DimDateHeap];
GO 
CREATE TABLE [import].[DimDateHeap](
	[DateKey] [int] NOT NULL,
	[DateValidFlag] [int] NOT NULL,
	[DateValid] [varchar](15) NOT NULL,
	[DateFormatValidFlag] [int] NOT NULL,
	[DateFormatValid] [varchar](15) NOT NULL,
	[Date] [date] NULL,
	[DateStyle] [varchar](10) NOT NULL,
	[DateStyle2] [varchar](10) NOT NULL,
	[DateStyleddmmmyyyy] [varchar](11) NOT NULL,
	[DateStyleddmmmyy] [varchar](9) NOT NULL,
	[DateStyleddmmyyyy] [varchar](10) NOT NULL,
	[DateStyleddmmyy] [varchar](8) NOT NULL,
	[DateStyleyyyymmdd] [varchar](10) NOT NULL,
	[DateStyleFulldmy] [varchar](17) NOT NULL,
	[DayOfWeekNo] [tinyint] NOT NULL,
	[DayOfWeekName] [varchar](15) NOT NULL,
	[DayOfWeekAbbreviation] [varchar](3) NOT NULL,
	[DayOfMonthNo] [tinyint] NOT NULL,
	[DayOfCalendarYearNo] [smallint] NOT NULL,
	[DayOfFinancialYearNo] [smallint] NOT NULL,
	[WeekdayFlag] [smallint] NOT NULL,
	[WeekDayDescription] [varchar](15) NOT NULL,
	[MonthOfYearName] [varchar](15) NOT NULL,
	[MonthOfYearAbbreviation] [varchar](3) NOT NULL,
	[MonthName] [varchar](15) NOT NULL,
	[MonthAbbreviation] [varchar](8) NOT NULL,
	[QuarterOfYearName] [varchar](15) NOT NULL,
	[QuarterName] [varchar](15) NOT NULL,
	[CalendarWeekOfYearNo] [tinyint] NOT NULL,
	[CalendarWeekNo] [int] NOT NULL,
	[CalendarMonthOfYearNo] [tinyint] NOT NULL,
	[CalendarMonthNo] [int] NOT NULL,
	[CalendarQuarterOfYearNo] [tinyint] NOT NULL,
	[CalendarQuarterNo] [int] NOT NULL,
	[CalendarQuarterOfYearNameStyle] [varchar](15) NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarDecade] [varchar](9) NOT NULL,
	[FinancialMonthOfYearNo] [varchar](2) NOT NULL,
	[FinancialMonthNo] [varchar](6) NOT NULL,
	[FinancialQuarterOfYearNo] [tinyint] NOT NULL,
	[FinancialQuarterNo] [smallint] NOT NULL,
	[FinancialQuarterOfYearNameStyle] [varchar](15) NOT NULL,
	[FinancialYear] [smallint] NOT NULL,
	[FinancialYearStyle] [varchar](7) NOT NULL,
	[FinancialDecade] [varchar](9) NOT NULL,
	[WeekEndingSunDateKey] [int] NOT NULL,
	[WeekEndingSunStyle] [varchar](11) NOT NULL,
	[WeekEndingSunStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingSunStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingSunWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSunMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSunMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingSunYear] [varchar](4) NOT NULL,
	[WeekEndingMonDateKey] [int] NOT NULL,
	[WeekEndingMonStyle] [varchar](11) NOT NULL,
	[WeekEndingMonStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingMonStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingMonWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingMonMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingMonMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingMonYear] [varchar](4) NOT NULL,
	[WeekEndingTueDateKey] [int] NOT NULL,
	[WeekEndingTueStyle] [varchar](11) NOT NULL,
	[WeekEndingTueStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingTueStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingTueWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingTueMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingTueMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingTueYear] [varchar](4) NOT NULL,
	[WeekEndingWedDateKey] [int] NOT NULL,
	[WeekEndingWedStyle] [varchar](11) NOT NULL,
	[WeekEndingWedStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingWedStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingWedWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingWedMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingWedMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingWedYear] [varchar](4) NOT NULL,
	[WeekEndingThuDateKey] [int] NOT NULL,
	[WeekEndingThuStyle] [varchar](11) NOT NULL,
	[WeekEndingThuStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingThuStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingThuWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingThuMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingThuMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingThuYear] [varchar](4) NOT NULL,
	[WeekEndingFriDateKey] [int] NOT NULL,
	[WeekEndingFriStyle] [varchar](11) NOT NULL,
	[WeekEndingFriStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingFriStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingFriWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingFriMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingFriMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingFriYear] [varchar](4) NOT NULL,
	[WeekEndingSatDateKey] [int] NOT NULL,
	[WeekEndingSatStyle] [varchar](11) NOT NULL,
	[WeekEndingSatStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingSatStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingSatWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSatMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSatMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingSatYear] [varchar](4) NOT NULL,
	[DateOffset] [int] NULL,
	[MonthOffset] [int] NULL,
	[QuarterOffset] [int] NULL,
	[CalendarYearOffset] [smallint] NULL,
	[FinancialYearOffset] [smallint] NULL,
	[StartDayofMonthDate] [date] NULL,
	[StartDayofMonthDateKey] [int] NULL,
	[StartDayofMonthDateStyle] [varchar](10) NOT NULL,
	[EndDayofMonthDate] [date] NULL,
	[EndDayofMonthDateKey] [int] NULL,
	[EndDayofMonthDateStyle] [varchar](10) NOT NULL,
	[StartDayofQuarterDate] [date] NULL,
	[StartDayofQuarterDateKey] [int] NULL,
	[StartDayofQuarterDateStyle] [varchar](10) NOT NULL,
	[EndDayofQuarterDate] [date] NULL,
	[EndDayofQuarterDateKey] [int] NULL,
	[EndDayofQuarterDateStyle] [varchar](10) NOT NULL,
	[StartDayofCalendarYearDate] [date] NULL,
	[StartDayofCalendarYearDateKey] [int] NULL,
	[StartDayofCalendarYearDateStyle] [varchar](10) NOT NULL,
	[EndDayofCalendarYearDate] [date] NULL,
	[EndDayofCalendarYearDateKey] [int] NULL,
	[EndDayofCalendarYearDateStyle] [varchar](10) NOT NULL,
	[StartDayofFinancialYearDate] [date] NULL,
	[StartDayofFinancialYearDateKey] [int] NULL,
	[StartDayofFinancialYearDateStyle] [varchar](10) NOT NULL,
	[EndDayofFinancialYearDate] [date] NULL,
	[EndDayofFinancialYearDateKey] [int] NULL,
	[EndDayofFinancialYearDateStyle] [varchar](10) NOT NULL,
	[DaysInMonth] [tinyint] NULL,
	[DaysInCalendarYear] [smallint] NULL,
	[DaysInFinancialYear] [smallint] NULL
) 

USE [IndexDemo]
GO
--####################################################################
RAISERROR('3.4 Create Table DimDateOneRow',10,0);
GO
--####################################################################
IF OBJECT_ID('[import].[DimDateOneRow]') IS NOT NULL
DROP TABLE [import].[DimDateOneRow];
GO 
CREATE TABLE [import].[DimDateOneRow](
	[DateKey] [int] NOT NULL,
	[DateValidFlag] [int] NOT NULL,
	[DateValid] [varchar](15) NOT NULL,
	[DateFormatValidFlag] [int] NOT NULL,
	[DateFormatValid] [varchar](15) NOT NULL,
	[Date] [date] NULL,
	[DateStyle] [varchar](10) NOT NULL,
	[DateStyle2] [varchar](10) NOT NULL,
	[DateStyleddmmmyyyy] [varchar](11) NOT NULL,
	[DateStyleddmmmyy] [varchar](9) NOT NULL,
	[DateStyleddmmyyyy] [varchar](10) NOT NULL,
	[DateStyleddmmyy] [varchar](8) NOT NULL,
	[DateStyleyyyymmdd] [varchar](10) NOT NULL,
	[DateStyleFulldmy] [varchar](17) NOT NULL,
	[DayOfWeekNo] [tinyint] NOT NULL,
	[DayOfWeekName] [varchar](15) NOT NULL,
	[DayOfWeekAbbreviation] [varchar](3) NOT NULL,
	[DayOfMonthNo] [tinyint] NOT NULL,
	[DayOfCalendarYearNo] [smallint] NOT NULL,
	[DayOfFinancialYearNo] [smallint] NOT NULL,
	[WeekdayFlag] [smallint] NOT NULL,
	[WeekDayDescription] [varchar](15) NOT NULL,
	[MonthOfYearName] [varchar](15) NOT NULL,
	[MonthOfYearAbbreviation] [varchar](3) NOT NULL,
	[MonthName] [varchar](15) NOT NULL,
	[MonthAbbreviation] [varchar](8) NOT NULL,
	[QuarterOfYearName] [varchar](15) NOT NULL,
	[QuarterName] [varchar](15) NOT NULL,
	[CalendarWeekOfYearNo] [tinyint] NOT NULL,
	[CalendarWeekNo] [int] NOT NULL,
	[CalendarMonthOfYearNo] [tinyint] NOT NULL,
	[CalendarMonthNo] [int] NOT NULL,
	[CalendarQuarterOfYearNo] [tinyint] NOT NULL,
	[CalendarQuarterNo] [int] NOT NULL,
	[CalendarQuarterOfYearNameStyle] [varchar](15) NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarDecade] [varchar](9) NOT NULL,
	[FinancialMonthOfYearNo] [varchar](2) NOT NULL,
	[FinancialMonthNo] [varchar](6) NOT NULL,
	[FinancialQuarterOfYearNo] [tinyint] NOT NULL,
	[FinancialQuarterNo] [smallint] NOT NULL,
	[FinancialQuarterOfYearNameStyle] [varchar](15) NOT NULL,
	[FinancialYear] [smallint] NOT NULL,
	[FinancialYearStyle] [varchar](7) NOT NULL,
	[FinancialDecade] [varchar](9) NOT NULL,
	[WeekEndingSunDateKey] [int] NOT NULL,
	[WeekEndingSunStyle] [varchar](11) NOT NULL,
	[WeekEndingSunStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingSunStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingSunWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSunMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSunMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingSunYear] [varchar](4) NOT NULL,
	[WeekEndingMonDateKey] [int] NOT NULL,
	[WeekEndingMonStyle] [varchar](11) NOT NULL,
	[WeekEndingMonStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingMonStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingMonWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingMonMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingMonMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingMonYear] [varchar](4) NOT NULL,
	[WeekEndingTueDateKey] [int] NOT NULL,
	[WeekEndingTueStyle] [varchar](11) NOT NULL,
	[WeekEndingTueStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingTueStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingTueWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingTueMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingTueMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingTueYear] [varchar](4) NOT NULL,
	[WeekEndingWedDateKey] [int] NOT NULL,
	[WeekEndingWedStyle] [varchar](11) NOT NULL,
	[WeekEndingWedStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingWedStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingWedWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingWedMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingWedMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingWedYear] [varchar](4) NOT NULL,
	[WeekEndingThuDateKey] [int] NOT NULL,
	[WeekEndingThuStyle] [varchar](11) NOT NULL,
	[WeekEndingThuStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingThuStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingThuWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingThuMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingThuMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingThuYear] [varchar](4) NOT NULL,
	[WeekEndingFriDateKey] [int] NOT NULL,
	[WeekEndingFriStyle] [varchar](11) NOT NULL,
	[WeekEndingFriStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingFriStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingFriWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingFriMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingFriMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingFriYear] [varchar](4) NOT NULL,
	[WeekEndingSatDateKey] [int] NOT NULL,
	[WeekEndingSatStyle] [varchar](11) NOT NULL,
	[WeekEndingSatStyleddmmmyy] [varchar](9) NOT NULL,
	[WeekEndingSatStyleddmmmyyyy] [varchar](11) NOT NULL,
	[WeekEndingSatWeekOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSatMonthOfYearNo] [tinyint] NOT NULL,
	[WeekEndingSatMonthOfYearName] [varchar](15) NOT NULL,
	[WeekEndingSatYear] [varchar](4) NOT NULL,
	[DateOffset] [int] NULL,
	[MonthOffset] [int] NULL,
	[QuarterOffset] [int] NULL,
	[CalendarYearOffset] [smallint] NULL,
	[FinancialYearOffset] [smallint] NULL,
	[StartDayofMonthDate] [date] NULL,
	[StartDayofMonthDateKey] [int] NULL,
	[StartDayofMonthDateStyle] [varchar](10) NOT NULL,
	[EndDayofMonthDate] [date] NULL,
	[EndDayofMonthDateKey] [int] NULL,
	[EndDayofMonthDateStyle] [varchar](10) NOT NULL,
	[StartDayofQuarterDate] [date] NULL,
	[StartDayofQuarterDateKey] [int] NULL,
	[StartDayofQuarterDateStyle] [varchar](10) NOT NULL,
	[EndDayofQuarterDate] [date] NULL,
	[EndDayofQuarterDateKey] [int] NULL,
	[EndDayofQuarterDateStyle] [varchar](10) NOT NULL,
	[StartDayofCalendarYearDate] [date] NULL,
	[StartDayofCalendarYearDateKey] [int] NULL,
	[StartDayofCalendarYearDateStyle] [varchar](10) NOT NULL,
	[EndDayofCalendarYearDate] [date] NULL,
	[EndDayofCalendarYearDateKey] [int] NULL,
	[EndDayofCalendarYearDateStyle] [varchar](10) NOT NULL,
	[StartDayofFinancialYearDate] [date] NULL,
	[StartDayofFinancialYearDateKey] [int] NULL,
	[StartDayofFinancialYearDateStyle] [varchar](10) NOT NULL,
	[EndDayofFinancialYearDate] [date] NULL,
	[EndDayofFinancialYearDateKey] [int] NULL,
	[EndDayofFinancialYearDateStyle] [varchar](10) NOT NULL,
	[DaysInMonth] [tinyint] NULL,
	[DaysInCalendarYear] [smallint] NULL,
	[DaysInFinancialYear] [smallint] NULL
) 


USE [IndexDemo]
GO
--####################################################################
RAISERROR('3.5 Create Table DimTest',10,0);
GO
--####################################################################
IF OBJECT_ID('[import].[DimTest]') IS NOT NULL
DROP TABLE [import].[DimTest];
GO 
CREATE TABLE [import].[DimTest](
	[TestKey] [int] IDENTITY(1,1) NOT NULL,
	[TestValue] [char](8) NOT NULL,
	[TestValueCategory] [char](8) NOT NULL,
 CONSTRAINT [PK_DimTest] PRIMARY KEY CLUSTERED 
(
	[TestKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) 


USE [IndexDemo]
GO
--####################################################################
RAISERROR('3.5 Create Table DimTestHeap',10,0);
GO
--####################################################################
IF OBJECT_ID('[import].[DimTestHeap]') IS NOT NULL
DROP TABLE [import].[DimTestHeap];
GO 
CREATE TABLE [import].[DimTestHeap](
	[TestKey] [int] IDENTITY(1,1) NOT NULL,
	[TestValue] [char](8) NOT NULL,
	[TestValueCategory] [char](8) NOT NULL
) 

GO


USE [IndexDemo]
GO
--####################################################################
RAISERROR('3.6 Create Table FactTest',10,0);
GO
--####################################################################
IF OBJECT_ID('[import].[FactTest]') IS NOT NULL
DROP TABLE [import].[FactTest];
GO 
CREATE TABLE [import].[FactTest](
	[FactKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL CONSTRAINT [DFT_FactTest_DateKey]  DEFAULT ((0)),
	[TestKey] [int] NOT NULL CONSTRAINT [DFT_FactTest_TestKey]  DEFAULT ((0)),
	[CountTest] [int] NOT NULL CONSTRAINT [DFT_FactTest_CountTest]  DEFAULT ((1)),
	[AmountTest] [money] NOT NULL CONSTRAINT [DFT_FactTest_AmountTest]  DEFAULT ('100.00'),
 CONSTRAINT [PK_FactTest] PRIMARY KEY CLUSTERED 
(
	[FactKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) 

GO

USE [IndexDemo]
GO
--####################################################################
RAISERROR('3.7 Create Table FactTestHeap',10,0);
GO
--####################################################################
IF OBJECT_ID('[import].[FactTestHeap]') IS NOT NULL
DROP TABLE [import].[FactTestHeap];
GO 
CREATE TABLE [import].[FactTestHeap](
	[FactKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL,
	[TestKey] [int] NOT NULL,
	[CountTest] [int] NOT NULL,
	[AmountTest] [money] NOT NULL
)

GO
USE [IndexDemo]
GO
--####################################################################
RAISERROR('3.8 Create Table TallyDate',10,0);
GO
--####################################################################
IF OBJECT_ID('[tools].[TallyDate]') IS NOT NULL
DROP TABLE [tools].[TallyDate];
GO 
CREATE TABLE tools.TallyDate 
(
dt DATE CONSTRAINT Pk_TallyDate PRIMARY KEY CLUSTERED
);
--####################################################################
RAISERROR('3.9 Create Table Tally',10,0);
GO
--####################################################################
IF OBJECT_ID('[tools].[Tally]') IS NOT NULL
DROP TABLE [tools].[Tally];
GO 
CREATE TABLE tools.Tally
(
n INT CONSTRAINT Pk_Tally PRIMARY KEY CLUSTERED
);


USE [IndexDemo]
GO
--####################################################################
RAISERROR('4.0 Create Views',10,0);
GO
--####################################################################
USE [IndexDemo]
GO
--####################################################################
RAISERROR('4.1 Create View RegularQuery',10,0);
GO
--####################################################################
CREATE OR ALTER VIEW [acc].[RegularQuery]

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

USE [IndexDemo]
GO
--####################################################################
RAISERROR('4.2 Create View RegularQueryChar]',10,0);
GO
--####################################################################
CREATE OR ALTER VIEW [acc].[RegularQueryChar]

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
GO

USE [IndexDemo]
GO
--####################################################################
RAISERROR('4.3 Create View RegularQueryHeap',10,0);
GO
--####################################################################
CREATE OR ALTER VIEW [acc].[RegularQueryHeap]
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

USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.0 Create Functions',10,0);
GO
--####################################################################
USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.1 Create Function DateStyle',10,0);
GO
--####################################################################
CREATE OR ALTER FUNCTION [tools].[fu_DateStyle] (@date DATETIME, @year CHAR(4)
,@month CHAR(2), @day CHAR(2))
--DROP FUNCTION [tools].[fu_DateStyle]

RETURNS CHAR(10)

AS

BEGIN

--------------------------------------
--1.0 Declare Return Variable
--------------------------------------

DECLARE @return CHAR(10) 

-------------------------------------
--2.0 If is Valid Date Perform Change Using This
-------------------------------------

IF ISDATE(@date) = 1
BEGIN
SET @return = CONVERT(CHAR(10), @date, 103)
END

IF ISDATE(@date) = 0
BEGIN
SET @return = @day+'/'+@month+'/'+@year
END

RETURN ISNULL(@return,'')

END

GO 

USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.2 Create Function DateInt',10,0);
GO
--####################################################################

CREATE OR ALTER FUNCTION [tools].[fu_DateDateInt] (@date DATE)
--DROP FUNCTION [tools].[fu_DateDateInt]

RETURNS INT

AS

BEGIN

DECLARE @return INT

SET @return = ISNULL(
RIGHT(LTRIM(RTRIM('0000'+CAST(DATEPART(YEAR,@date)  AS CHAR))),4)+
RIGHT(RTRIM(LTRIM('00'+CAST(DATEPART(MONTH,@date) AS CHAR))),2)+
RIGHT(RTRIM(LTRIM('00'+CAST(DATEPART(DAY,@date) AS CHAR))),2),0)

RETURN @return

END

GO

--####################################################################
RAISERROR('5.3 Create Function DateStyle Valid',10,0);
GO
--####################################################################

CREATE OR ALTER FUNCTION [tools].[fu_DateStyleValid] (@datestyle CHAR(10))

RETURNS INT

AS

BEGIN

DECLARE @return INT = -1
IF @datestyle LIKE '[0-9][0-9]'+'/'+'[0-9][0-9]'+'/'+'[0-9][0-9][0-9][0-9]'
AND ISDATE(SUBSTRING(@datestyle,1,6)+'1999') = 1
BEGIN
SET @return = 1
END
ELSE
IF @datestyle = ''
BEGIN
SET @return = 0
END

RETURN @return

END

GO

USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.4 Create Function Date Style yymmdd',10,0);
GO
--####################################################################
CREATE OR ALTER FUNCTION [tools].[fu_DateStyleyymmdd] (@date DATETIME)

RETURNS VARCHAR(8)

AS

BEGIN

--------------------------------------
--1.0 Declare Return Variable
--------------------------------------

DECLARE @return VARCHAR(8)

-------------------------------------
--2.0 If is Valid Date Perform Change Using This
-------------------------------------

IF ISDATE(@date) = 1
BEGIN
SET @return = 
RIGHT(CAST(DATEPART(YEAR,@date) AS VARCHAR),2)
+'-'+RIGHT('00'+CAST(DATEPART(MONTH,@date) AS VARCHAR),2)
+'-'+RIGHT('00'+CAST(DATEPART(DAY,@date) AS VARCHAR),2)
END

IF ISDATE(@date) = 0
BEGIN
SET @return = ''
END

RETURN @return

END

GO


USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.5 Create Function Date Style Full dmy',10,0);
GO
--####################################################################

CREATE OR ALTER FUNCTION [tools].[fu_DateStyleFulldmy] (@date DATETIME)
--DROP FUNCTION [tools].[fu_DateStyleFulldmy]


RETURNS VARCHAR(25)

AS

BEGIN

--------------------------------------
--1.0 Declare Return Variable
--------------------------------------

DECLARE @return VARCHAR(25)

-------------------------------------
--2.0 If is Valid Date Perform Change Using This
-------------------------------------

IF ISDATE(@date) = 1
BEGIN
SET @return = 
RIGHT('00'+CAST(DATEPART(DAY,@date) AS VARCHAR),2)
+'-'+DATENAME(MONTH,@date)
+'-'+CAST(DATEPART(YEAR,@date) AS VARCHAR)
END

IF ISDATE(@date) = 0
BEGIN
SET @return = ''
END

RETURN @return

END

GO

USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.6 Create Function Date Week Ending',10,0);
GO
--####################################################################
CREATE OR ALTER FUNCTION [tools].[fu_DateWeekEnding] 
(
@date DATETIME, @dayend INT
)

RETURNS DATETIME

AS

BEGIN

DECLARE @enddate DATETIME
DECLARE @return CHAR(11)

IF @date <= '25-dec-9999'
BEGIN
SET @enddate = 
CASE WHEN @dayend >= DATEPART(WEEKDAY,@date)
THEN 
DATEADD(DAY, (@dayend - DATEPART(WEEKDAY,@date)), @date)
ELSE 
DATEADD(DAY, (7 - DATEPART(WEEKDAY,@date))+@dayend, @date) END
END 

SET @return  = REPLACE(CONVERT(CHAR(11),@enddate,113),' ','-')

RETURN @enddate

END

GO


USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.7 Create Function Date Style ddmmyyyy',10,0);
GO
--####################################################################
CREATE  OR ALTER FUNCTION [tools].[fu_DateStyleddmmyyyy] (@date DATETIME)
--DROP FUNCTION [tools].[fu_DateStyleddmmyyyy]

RETURNS VARCHAR(10)

AS

BEGIN

--------------------------------------
--1.0 Declare Return Variable
--------------------------------------

DECLARE @return VARCHAR(10)

-------------------------------------
--2.0 If is Valid Date Perform Change Using This
-------------------------------------

IF ISDATE(@date) = 1
BEGIN
SET @return = RIGHT('00'+CAST(DATEPART(DAY,@date) AS VARCHAR),2)
+'-'+RIGHT('00'+CAST(DATEPART(MONTH,@date) AS VARCHAR),2)
+'-'+CAST(DATEPART(YEAR,@date) AS VARCHAR)
END

IF ISDATE(@date) = 0
BEGIN
SET @return = ''
END

RETURN @return

END

GO

USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.8 Create Function Date Style ddmmmyyyy',10,0);
GO
--####################################################################

CREATE OR ALTER FUNCTION [tools].[fu_DateStyleddmmmyyyy] (@date DATETIME)

RETURNS VARCHAR(11)

AS

BEGIN

--------------------------------------
--1.0 Declare Return Variable
--------------------------------------

DECLARE @return VARCHAR(11)

-------------------------------------
--2.0 If is Valid Date Perform Change Using This
-------------------------------------

IF ISDATE(@date) = 1
BEGIN
SET @return = RIGHT('00'+CAST(DATEPART(DAY,@date) AS VARCHAR),2)+'-'+LEFT(DATENAME(MONTH,@date),3)
+'-'+CAST(DATEPART(YEAR,@date) AS VARCHAR)
END

IF ISDATE(@date) = 0
BEGIN
SET @return = ''
END

RETURN @return

END

GO

USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.9 Create Function Date Style ddmmmyy',10,0);
GO
--####################################################################

CREATE OR ALTER FUNCTION [tools].[fu_DateStyleddmmmyy] (@date DATETIME)

RETURNS VARCHAR(9)

AS

BEGIN

--------------------------------------
--1.0 Declare Return Variable
--------------------------------------

DECLARE @return VARCHAR(9)

-------------------------------------
--2.0 If is Valid Date Perform Change Using This
-------------------------------------

IF ISDATE(@date) = 1
BEGIN
SET @return = RIGHT('00'+CAST(DATEPART(DAY,@date) AS VARCHAR),2)+'-'+LEFT(DATENAME(MONTH,@date),3)
+'-'+RIGHT(CAST(DATEPART(YEAR,@date) AS VARCHAR),2)
END

IF ISDATE(@date) = 0
BEGIN
SET @return = ''
END

RETURN @return

END

GO

USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.10 Create Function Date Style ddmmyy',10,0);
GO
--####################################################################

CREATE OR ALTER FUNCTION [tools].[fu_DateStyleddmmyy] (@date DATETIME)
--DROP FUNCTION [tools].[fu_DateStyleddmmyy]

RETURNS VARCHAR(8)

AS

BEGIN

--------------------------------------
--1.0 Declare Return Variable
--------------------------------------

DECLARE @return VARCHAR(8)

-------------------------------------
--2.0 If is Valid Date Perform Change Using This
-------------------------------------

IF ISDATE(@date) = 1
BEGIN
SET @return = RIGHT('00'+CAST(DATEPART(DAY,@date) AS VARCHAR),2)+'-'+RIGHT('00'+CAST(DATEPART(MONTH,@date) AS VARCHAR),2)
+'-'+RIGHT(CAST(DATEPART(YEAR,@date) AS VARCHAR),2)
END

IF ISDATE(@date) = 0
BEGIN
SET @return = ''
END

RETURN @return

END

GO
USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.11 Create Function Date Style yyyymmdd',10,0);
GO
--####################################################################

CREATE OR ALTER FUNCTION [tools].[fu_DateStyleyyyymmdd] (@date DATETIME)
--DROP FUNCTION [tools].[fu_DateStyleyyyymmdd]

RETURNS VARCHAR(10)

AS

BEGIN

--------------------------------------
--1.0 Declare Return Variable
--------------------------------------

DECLARE @return VARCHAR(10)

-------------------------------------
--2.0 If is Valid Date Perform Change Using This
-------------------------------------

IF ISDATE(@date) = 1
BEGIN
SET @return = 
CAST(DATEPART(YEAR,@date) AS VARCHAR)
+'-'+RIGHT('00'+CAST(DATEPART(MONTH,@date) AS VARCHAR),2)
+'-'+RIGHT('00'+CAST(DATEPART(DAY,@date) AS VARCHAR),2)
END

IF ISDATE(@date) = 0
BEGIN
SET @return = ''
END

RETURN @return

END

GO

USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.12 Create Function Date Financial Day Of Year',10,0);
GO
--####################################################################

CREATE OR ALTER FUNCTION [tools].[fu_DateFinancialDayOfYear] (@date DATETIME)

RETURNS INT

AS

BEGIN

--1.0 Declare Return Variable
DECLARE @return INT

--2.0 Declare Int for Apr to Dec Days
DECLARE @aprdec INT = (SELECT DATEDIFF(DAY,'01-APR-2000','01-JAN-2001'))

--3.0 Set Financial Day of Year
SET @return = CASE WHEN datepart(QUARTER,@date) = 1 
--3.1 If First Quarter then Day of Year plus the Apr to Dec Period
  THEN datepart(dayofyear, @date) + @aprdec 
 --3.2 If not first quarer then day of year minus the number of days from jan to mar 
  ELSE datepart(dayofyear, @date) -  datepart(dayofyear, '31-MAR-'+CAST(DATEPART(year,@date)  AS VARCHAR)) 
  END

RETURN @return

END

GO

USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.13 Create Function String Trim Double Spaces',10,0);
GO
--####################################################################

CREATE OR ALTER FUNCTION [tools].[fu_StringTrimDoubleSpaces](@string VARCHAR(MAX))

RETURNS VARCHAR(MAX)

AS

BEGIN

--1.0 Remove Tab
SET @string =  replace(@string, char(9),' ')

--2.0 Remove Line Feed
SET @string =  replace(@string, char(10),' ')

--3.0 Remove Carriage Return
SET @string =  replace(@string, char(13),' ')

--4.0 Trim String
SET @string =  LTRIM(RTRIM(@string))

--5.0 Remove Double Spaces
WHILE @string LIKE '%  %'
BEGIN
SET @string = REPLACE(@string,'  ',' ')
END

--6.0 Return
RETURN @String

END

GO

USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.14 Create Function Date Financial Decade',10,0);
GO
--####################################################################
CREATE OR ALTER FUNCTION [tools].[fu_DateFinancialDecade] (@date DATETIME)


RETURNS CHAR(9)

AS

BEGIN

DECLARE @return CHAR(9)

IF ISDATE(@date) = 1

BEGIN
DECLARE @finyr CHAR(4)
SET @finyr = 
CASE WHEN DATEPART(QUARTER, @date) 
BETWEEN 2 AND 4 THEN DATENAME(YEAR,@date) 
ELSE DATENAME(YEAR,DATEADD(YEAR,-1,@date)) END

SET @return = LEFT(@finyr,3)+'0-'+
CAST((CAST(LEFT(@finyr,3)+'0' AS INT)+9) AS VARCHAR)

END

RETURN @return

END

GO

USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.15 Create Function Date Calendar Decade',10,0);
GO
--####################################################################

CREATE OR ALTER FUNCTION [tools].[fu_DateCalendarDecade] (@date DATETIME)

RETURNS CHAR(9)

AS

BEGIN

DECLARE @return CHAR(9)

IF ISDATE(@date) = 1

BEGIN

SET @return = LEFT(DATENAME(YEAR,@date),3)+'0-'+
CAST((CAST(LEFT(DATENAME(YEAR,@date),3)+'0' AS INT)+9) AS VARCHAR)

END

RETURN @return

END

GO


USE [IndexDemo]
GO
--####################################################################
RAISERROR('5.16 Create Function Date Table',10,0);
GO
--####################################################################
CREATE OR ALTER FUNCTION [tools].[fu_Date] (@date DATE)
--DROP FUNCTION [acc].[fu_Date]

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
DECLARE @datestyle CHAR(10) = TOOLS.fu_DateStyle(NULL,@y,@m,@d)
DECLARE @datetime DATETIME = CASE WHEN ISDATE(@datestyle) = 1 THEN @datestyle END

/*
Start Day of Month
*/
DECLARE @startdayofmonthdate DATE = 
CASE WHEN DATEPART(YEAR,@date) = 9999 AND DATEPART(MONTH,@date) = 12 THEN '9999-12-01'
ELSE
CAST(DATEPART(YEAR,@date) AS VARCHAR)+'-'+CAST(DATEPART(MONTH,@date)AS VARCHAR)+'-01' END
DECLARE @startdayofmonthdatekey INT  = tools.[fu_DateDateInt] (@startdayofmonthdate)
DECLARE @startdayofmonthdatestyle VARCHAR(10) = TOOLS.fu_DateStyle(@startdayofmonthdate,'','','')

/*
End Day of Month
*/
DECLARE @enddayofmonthdate DATE = 
CASE WHEN @startdayofmonthdate = '9999-12-01' THEN '9999-12-31'
ELSE
DATEADD(DAY,-1,DATEADD(MONTH,1,@startdayofmonthdate)) END
DECLARE @enddayofmonthdatekey INT = tools.[fu_DateDateInt] (@enddayofmonthdate)
DECLARE @enddayofmonthdatestyle VARCHAR(10)   = TOOLS.fu_DateStyle(@enddayofmonthdate,'','','')

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
DECLARE @startdayofquarterdatekey INT  = tools.[fu_DateDateInt] (@startdayofquarterdate)
DECLARE @startdayofquarterdatestyle VARCHAR(10) = TOOLS.fu_DateStyle(@startdayofquarterdate,'','','')

/*
End Day of Quarter
*/
DECLARE @enddayofquarterdate DATE = 
CASE WHEN @startdayofmonthdate = '9999-12-01' THEN '9999-12-31'
ELSE
DATEADD(DAY,-1,DATEADD(QUARTER,1,@startdayofquarterdate)) END
DECLARE @enddayofquarterdatekey INT = tools.[fu_DateDateInt] (@enddayofquarterdate)
DECLARE @enddayofquarterdatestyle VARCHAR(10)   = TOOLS.fu_DateStyle(@enddayofquarterdate,'','','')


/*
Start Day of Calendar Year
*/
DECLARE @startdayofcalendaryeardate DATE = DATENAME(YEAR, @date)+'-01-01'
DECLARE @startdayofcalendaryeardatekey INT  = tools.[fu_DateDateInt] (@startdayofcalendaryeardate)
DECLARE @startdayofcalendaryeardatestyle VARCHAR(10) = TOOLS.fu_DateStyle(@startdayofcalendaryeardate,'','','')

/*
End Day of Calendar Year
*/
DECLARE @enddayofcalendaryeardate DATE = DATENAME(YEAR, @date)+'-12-31'
DECLARE @enddayofcalendaryeardatekey INT = tools.[fu_DateDateInt] (@enddayofcalendaryeardate)
DECLARE @enddayofcalendaryeardatestyle VARCHAR(10)   = TOOLS.fu_DateStyle(@enddayofcalendaryeardate,'','','')

/*
Start Day of Financial Year
*/
DECLARE @startdayoffinancialyeardate DATE = 
CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 
THEN DATENAME(YEAR,@date)+'-04-01' ELSE DATENAME(YEAR,DATEADD(YEAR,-1,@date))+'-04-01' END
DECLARE @startdayoffinancialyeardatekey INT  = tools.[fu_DateDateInt] (@startdayoffinancialyeardate)
DECLARE @startdayoffinancialyeardatestyle VARCHAR(10) = TOOLS.fu_DateStyle(@startdayoffinancialyeardate,'','','')

/*
End Day of Financial Year
*/
DECLARE @enddayoffinancialyeardate DATE  = 
CASE WHEN DATEPART(YEAR,@date) = 9999 THEN '9999-12-31' ELSE
CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 
THEN DATENAME(YEAR,DATEADD(YEAR,1,@date))+'-03-31' ELSE DATENAME(YEAR,@date)+'-03-31' END END
DECLARE @enddayoffinancialyeardatekey INT =tools.[fu_DateDateInt] (@enddayoffinancialyeardate)
DECLARE @enddayoffinancialyeardatestyle VARCHAR(10)   =  TOOLS.fu_DateStyle(@enddayoffinancialyeardate,'','','')


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
[DateKey] = tools.[fu_DateDateInt] (@date)
,[DateValidFlag] = ISDATE(@datetime)
,[DateValid] = CASE WHEN ISDATE(@datetime) = 1 THEN 'Valid' ELSE 'Invalid' END
,DateFormatValidFlag = tools.Fu_DateStyleValid(@datestyle)
,DateFormatValid = CASE WHEN tools.Fu_DateStyleValid(@datestyle) = 1 THEN 'Valid' ELSE 'Invalid' END 
,[Date] = @date
,[DateStyle] = @datestyle
,[DateStyle] = REPLACE(@datestyle,'/','.')
,[DateStyleddmmmyyyy] = tools.fu_DateStyleddmmmyyyy(@datetime)
,[DateStyleddmmmyy]  = tools.fu_DateStyleddmmmyy(@datetime)
,[DateStyleddmmyyyy]  = tools.fu_DateStyleddmmyyyy(@datetime)
,[DateStyleddmmyy]  = tools.fu_DateStyleddmmyy(@datetime)
,[DateStyleyyyymmdd]  = tools.fu_DateStyleyyyymmdd(@datetime)
,[DateStyleFulldmy]  = tools.fu_DateStyleFulldmy(@datetime)
--day
,[DayOfWeekNo] = CASE WHEN DATEPART(WEEKDAY,@date ) BETWEEN 2 AND 7 
THEN DATEPART(WEEKDAY,@date )-1 ELSE 7 END 

,[DayOfWeekName] = DATENAME(WEEKDAY,@date)

,[DayOfWeekAbbreviation] = LEFT(DATENAME(WEEKDAY,@date ),3)
,[DayOfMonthNo] = DATEPART(DAY,@date) 


,[DayOfCalendarYearNo] = DATEPART(dayofyear,@date) 
,[DayOfFinancialYearNo]  = tools.fu_DateFinancialDayOfYear(@datetime)


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
tools.fu_StringTrimDoubleSpaces('Q'+CAST(DATEPART(QUARTER,@date) AS CHAR)+' ('+CASE WHEN DATENAME(QUARTER, @date) = 1 THEN 'Jan-Mar' WHEN DATENAME(QUARTER, @date) = 2 THEN 'Apr-Jun' WHEN DATENAME(QUARTER, @date) = 3 
THEN 'Jul-Sep' ELSE 'Oct-Dec' END+')')
,[CalendarYear] = DATEPART(YEAR,@date)
,[CalendarDecade] = tools.fu_datecalendardecade(@datetime)

--financial
,[FinancialMonthOfYearNo] = CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 THEN CAST(DATEPART(MONTH,@date)-3 AS VARCHAR) ELSE CAST(DATEPART(MONTH,@date)+9 AS VARCHAR) END
,[FinancialMonthNo] = CAST(CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 
THEN DATENAME(YEAR,@date) ELSE DATENAME(YEAR,DATEADD(YEAR,-1,@date)) 
END+RIGHT('00'+CAST(CASE WHEN DATEPART(QUARTER, @date) 
BETWEEN 2 AND 4 THEN DATEPART(MONTH,@date)-3 ELSE DATEPART(MONTH,@date)+9 END AS VARCHAR),2) AS INT)

,[FinancialQuarterOfYearNo] = CASE WHEN ISDATE(@datetime) = 1 THEN CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 THEN DATEPART(QUARTER,@date)-1 ELSE 4 END END
,[FinancialQuarterNo] = CAST(CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 THEN DATENAME(YEAR,@date)+DATENAME(QUARTER,@date)-1 ELSE DATENAME(YEAR,DATEADD(YEAR,-1,@date))+'4' END AS SMALLINT)
,[FinancialQuarterOfYearNameStyle] = CASE WHEN ISDATE(@datetime) = 1 THEN tools.fu_StringTrimDoubleSpaces('Q'+CAST(CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 THEN DATEPART(QUARTER,@date)-1 ELSE 4 END AS CHAR)+' ('+ CASE WHEN DATENAME(QUARTER, @date) = 1 THEN 'Jan-Mar' WHEN DATENAME(QUARTER, @date) = 2 THEN 'Apr-Jun' WHEN DATENAME(QUARTER, @date) = 3 THEN 'Jul-Sep' ELSE 'Oct-Dec' END+')') END

,[FinancialYear] = CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 
THEN DATEPART(YEAR,@date) ELSE DATEPART(YEAR,DATEADD(YEAR,-1,@date)) END

,[FinancialYearStyle] = CASE WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4 AND DATENAME(YEAR,@date) = '9999' THEN '9999/00' WHEN DATEPART(QUARTER, @date) BETWEEN 2 AND 4  THEN DATENAME(YEAR,@date)+'/'+RIGHT(DATENAME(YEAR,DATEADD(YEAR,1,@date)),2) ELSE DATENAME(YEAR,DATEADD(YEAR,-1,@date))+'/'+RIGHT(DATENAME(YEAR,@date),2) END
,[FinancialDecade] = tools.fu_datefinancialdecade(@datetime)


--week ending Sun
,[WeekEndingSunDateKey] = tools.fu_DateDateInt (tools.fu_DateWeekEnding(@datetime, 1))
,[WeekEndingSunStyle] = tools.fu_datestyle(tools.fu_DateWeekEnding(@datetime, 1),'','','')
,[WeekEndingSunStyleddmmmyy] = tools.[fu_datestyleddmmmyy] (tools.fu_DateWeekEnding(@datetime, 1))
,[WeekEndingSunStyleddmmmyyyy] = tools.[fu_datestyleddmmmyyyy] (tools.fu_DateWeekEnding(@datetime, 1))
,[WeekEndingSunWeekOfYearNo] = DATEPART(WEEK,tools.fu_DateWeekEnding(@datetime, 1))
,[WeekEndingSunSunthOfYearNo] = DATEPART(MONTH,tools.fu_DateWeekEnding(@datetime, 1))
,[WeekEndingSunSunthOfYearName] = DATENAME(MONTH,tools.fu_DateWeekEnding(@datetime, 1))
,[WeekEndingSunYear] = DATENAME(YEAR,tools.fu_DateWeekEnding(@datetime, 1))
--week ending Mon
,[WeekEndingMonDateKey] = tools.fu_DateDateInt (tools.fu_DateWeekEnding(@datetime, 2))
,[WeekEndingMonStyle] = tools.fu_datestyle(tools.fu_DateWeekEnding(@datetime, 2),'','','')
,[WeekEndingMonStyleddmmmyy] = tools.[fu_datestyleddmmmyy] (tools.fu_DateWeekEnding(@datetime, 2))
,[WeekEndingMonStyleddmmmyyyy] = tools.[fu_datestyleddmmmyyyy] (tools.fu_DateWeekEnding(@datetime, 2))
,[WeekEndingMonWeekOfYearNo] = DATEPART(WEEK,tools.fu_DateWeekEnding(@datetime, 2))
,[WeekEndingMonMonthOfYearNo] = DATEPART(MONTH,tools.fu_DateWeekEnding(@datetime, 2))
,[WeekEndingMonMonthOfYearName] = DATENAME(MONTH,tools.fu_DateWeekEnding(@datetime, 2))
,[WeekEndingMonYear] = DATENAME(YEAR,tools.fu_DateWeekEnding(@datetime, 2))
--week ending Tue
,[WeekEndingTueDateKey] = tools.fu_DateDateInt (tools.fu_DateWeekEnding(@datetime, 3))
,[WeekEndingTueStyle] = tools.fu_datestyle(tools.fu_DateWeekEnding(@datetime, 3),'','','')
,[WeekEndingTueStyleddmmmyy] = tools.[fu_datestyleddmmmyy] (tools.fu_DateWeekEnding(@datetime, 3))
,[WeekEndingTueStyleddmmmyyyy] = tools.[fu_datestyleddmmmyyyy] (tools.fu_DateWeekEnding(@datetime, 3))
,[WeekEndingTueWeekOfYearNo] = DATEPART(WEEK,tools.fu_DateWeekEnding(@datetime, 3))
,[WeekEndingTueTuethOfYearNo] = DATEPART(MONTH,tools.fu_DateWeekEnding(@datetime, 3))
,[WeekEndingTueTuethOfYearName] = DATENAME(MONTH,tools.fu_DateWeekEnding(@datetime, 3))
,[WeekEndingTueYear] = DATENAME(YEAR,tools.fu_DateWeekEnding(@datetime, 3))
--week ending Wed
,[WeekEndingWedDateKey] = tools.fu_DateDateInt (tools.fu_DateWeekEnding(@datetime, 4))
,[WeekEndingWedStyle] = tools.fu_datestyle(tools.fu_DateWeekEnding(@datetime, 4),'','','')
,[WeekEndingWedStyleddmmmyy] = tools.[fu_datestyleddmmmyy] (tools.fu_DateWeekEnding(@datetime, 4))
,[WeekEndingWedStyleddmmmyyyy] = tools.[fu_datestyleddmmmyyyy] (tools.fu_DateWeekEnding(@datetime, 4))
,[WeekEndingWedWeekOfYearNo] = DATEPART(WEEK,tools.fu_DateWeekEnding(@datetime, 4))
,[WeekEndingWedWedthOfYearNo] = DATEPART(MONTH,tools.fu_DateWeekEnding(@datetime, 4))
,[WeekEndingWedWedthOfYearName] = DATENAME(MONTH,tools.fu_DateWeekEnding(@datetime, 4))
,[WeekEndingWedYear] = DATENAME(YEAR,tools.fu_DateWeekEnding(@datetime, 4))
--week ending Thu
,[WeekEndingThuDateKey] = tools.fu_DateDateInt (tools.fu_DateWeekEnding(@datetime, 5))
,[WeekEndingThuStyle] = tools.fu_datestyle(tools.fu_DateWeekEnding(@datetime, 5),'','','')
,[WeekEndingThuStyleddmmmyy] = tools.[fu_datestyleddmmmyy] (tools.fu_DateWeekEnding(@datetime, 5))
,[WeekEndingThuStyleddmmmyyyy] = tools.[fu_datestyleddmmmyyyy] (tools.fu_DateWeekEnding(@datetime, 5))
,[WeekEndingThuWeekOfYearNo] = DATEPART(WEEK,tools.fu_DateWeekEnding(@datetime, 5))
,[WeekEndingThuThuthOfYearNo] = DATEPART(MONTH,tools.fu_DateWeekEnding(@datetime, 5))
,[WeekEndingThuThuthOfYearName] = DATENAME(MONTH,tools.fu_DateWeekEnding(@datetime, 5))
,[WeekEndingThuYear] = DATENAME(YEAR,tools.fu_DateWeekEnding(@datetime, 5))
--week ending Fri
,[WeekEndingFriDateKey] = tools.fu_DateDateInt (tools.fu_DateWeekEnding(@datetime, 6))
,[WeekEndingFriStyle] = tools.fu_datestyle(tools.fu_DateWeekEnding(@datetime, 6),'','','')
,[WeekEndingFriStyleddmmmyy] = tools.[fu_datestyleddmmmyy] (tools.fu_DateWeekEnding(@datetime, 6))
,[WeekEndingFriStyleddmmmyyyy] = tools.[fu_datestyleddmmmyyyy] (tools.fu_DateWeekEnding(@datetime, 6))
,[WeekEndingFriWeekOfYearNo] = DATEPART(WEEK,tools.fu_DateWeekEnding(@datetime, 6))
,[WeekEndingFriFrithOfYearNo] = DATEPART(MONTH,tools.fu_DateWeekEnding(@datetime, 6))
,[WeekEndingFriFrithOfYearName] = DATENAME(MONTH,tools.fu_DateWeekEnding(@datetime, 6))
,[WeekEndingFriYear] = DATENAME(YEAR,tools.fu_DateWeekEnding(@datetime, 6))
--week ending Sat
,[WeekEndingSatDateKey] = tools.fu_DateDateInt (tools.fu_DateWeekEnding(@datetime, 7))
,[WeekEndingSatStyle] = tools.fu_datestyle(tools.fu_DateWeekEnding(@datetime, 7),'','','')
,[WeekEndingSatStyleddmmmyy] = tools.[fu_datestyleddmmmyy] (tools.fu_DateWeekEnding(@datetime, 7))
,[WeekEndingSatStyleddmmmyyyy] = tools.[fu_datestyleddmmmyyyy] (tools.fu_DateWeekEnding(@datetime, 7))
,[WeekEndingSatWeekOfYearNo] = DATEPART(WEEK,tools.fu_DateWeekEnding(@datetime, 7))
,[WeekEndingSatSatthOfYearNo] = DATEPART(MONTH,tools.fu_DateWeekEnding(@datetime, 7))
,[WeekEndingSatSatthOfYearName] = DATENAME(MONTH,tools.fu_DateWeekEnding(@datetime, 7))
,[WeekEndingSatYear] = DATENAME(YEAR,tools.fu_DateWeekEnding(@datetime, 7))


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

USE [IndexDemo]
GO
--####################################################################
RAISERROR('6.0 Populate Objects',10,0);
GO
--####################################################################

USE [IndexDemo]
GO
--####################################################################
RAISERROR('6.1 Populate Tally Date',10,0);
GO
--####################################################################

WITH CTE_Recursive AS 
(
SELECT CAST('2000-01-01' AS DATE) AS dt
UNION ALL
SELECT DATEADD(DAY,1,dt) AS dt
FROM CTE_Recursive
WHERE dt < SYSUTCDATETIME()
)
INSERT INTO tools.tallydate
(
dt 
)
SELECT dt 
FROM CTE_Recursive
OPTION (MAXRECURSION 0);  

--SELECT * FROM tools.tallydate

--####################################################################
RAISERROR('6.2 Populate Tally',10,0);
GO
--####################################################################

WITH CTE_Recursive AS 
(
SELECT 1 AS n
UNION ALL
SELECT n+1 AS n
FROM CTE_Recursive
WHERE N < 1000000
)
INSERT INTO tools.tally
(
n 
)
SELECT n 
FROM CTE_Recursive
OPTION (MAXRECURSION 0);  

--SELECT * FROM tools.tally

USE [IndexDemo]
GO
--####################################################################
RAISERROR('6.3 Populate DimDate',10,0);
GO
--####################################################################

SET DATEFORMAT DMY;

INSERT INTO import.DimDate
(
[DateKey], [DateValidFlag], [DateValid], [DateFormatValidFlag], [DateFormatValid], [Date], [DateStyle], [DateStyle2], [DateStyleddmmmyyyy], [DateStyleddmmmyy], [DateStyleddmmyyyy], [DateStyleddmmyy], [DateStyleyyyymmdd], [DateStyleFulldmy], [DayOfWeekNo], [DayOfWeekName], [DayOfWeekAbbreviation], [DayOfMonthNo], [DayOfCalendarYearNo], [DayOfFinancialYearNo], [WeekdayFlag], [WeekDayDescription], [MonthOfYearName], [MonthOfYearAbbreviation], [MonthName], [MonthAbbreviation], [QuarterOfYearName], [QuarterName], [CalendarWeekOfYearNo], [CalendarWeekNo], [CalendarMonthOfYearNo], [CalendarMonthNo], [CalendarQuarterOfYearNo], [CalendarQuarterNo], [CalendarQuarterOfYearNameStyle], [CalendarYear], [CalendarDecade], [FinancialMonthOfYearNo], [FinancialMonthNo], [FinancialQuarterOfYearNo], [FinancialQuarterNo], [FinancialQuarterOfYearNameStyle], [FinancialYear], [FinancialYearStyle], [FinancialDecade], [WeekEndingSunDateKey], [WeekEndingSunStyle], [WeekEndingSunStyleddmmmyy], [WeekEndingSunStyleddmmmyyyy], [WeekEndingSunWeekOfYearNo], [WeekEndingSunMonthOfYearNo], [WeekEndingSunMonthOfYearName], [WeekEndingSunYear], [WeekEndingMonDateKey], [WeekEndingMonStyle], [WeekEndingMonStyleddmmmyy], [WeekEndingMonStyleddmmmyyyy], [WeekEndingMonWeekOfYearNo], [WeekEndingMonMonthOfYearNo], [WeekEndingMonMonthOfYearName], [WeekEndingMonYear], [WeekEndingTueDateKey], [WeekEndingTueStyle], [WeekEndingTueStyleddmmmyy], [WeekEndingTueStyleddmmmyyyy], [WeekEndingTueWeekOfYearNo], [WeekEndingTueMonthOfYearNo], [WeekEndingTueMonthOfYearName], [WeekEndingTueYear], [WeekEndingWedDateKey], [WeekEndingWedStyle], [WeekEndingWedStyleddmmmyy], [WeekEndingWedStyleddmmmyyyy], [WeekEndingWedWeekOfYearNo], [WeekEndingWedMonthOfYearNo], [WeekEndingWedMonthOfYearName], [WeekEndingWedYear], [WeekEndingThuDateKey], [WeekEndingThuStyle], [WeekEndingThuStyleddmmmyy], [WeekEndingThuStyleddmmmyyyy], [WeekEndingThuWeekOfYearNo], [WeekEndingThuMonthOfYearNo], [WeekEndingThuMonthOfYearName], [WeekEndingThuYear], [WeekEndingFriDateKey], [WeekEndingFriStyle], [WeekEndingFriStyleddmmmyy], [WeekEndingFriStyleddmmmyyyy], [WeekEndingFriWeekOfYearNo], [WeekEndingFriMonthOfYearNo], [WeekEndingFriMonthOfYearName], [WeekEndingFriYear], [WeekEndingSatDateKey], [WeekEndingSatStyle], [WeekEndingSatStyleddmmmyy], [WeekEndingSatStyleddmmmyyyy], [WeekEndingSatWeekOfYearNo], [WeekEndingSatMonthOfYearNo], [WeekEndingSatMonthOfYearName], [WeekEndingSatYear], [DateOffset], [MonthOffset], [QuarterOffset], [CalendarYearOffset], [FinancialYearOffset], [StartDayofMonthDate], [StartDayofMonthDateKey], [StartDayofMonthDateStyle], [EndDayofMonthDate], [EndDayofMonthDateKey], [EndDayofMonthDateStyle], [StartDayofQuarterDate], [StartDayofQuarterDateKey], [StartDayofQuarterDateStyle], [EndDayofQuarterDate], [EndDayofQuarterDateKey], [EndDayofQuarterDateStyle], [StartDayofCalendarYearDate], [StartDayofCalendarYearDateKey], [StartDayofCalendarYearDateStyle], [EndDayofCalendarYearDate], [EndDayofCalendarYearDateKey], [EndDayofCalendarYearDateStyle], [StartDayofFinancialYearDate], [StartDayofFinancialYearDateKey], [StartDayofFinancialYearDateStyle], [EndDayofFinancialYearDate], [EndDayofFinancialYearDateKey], [EndDayofFinancialYearDateStyle], [DaysInMonth], [DaysInCalendarYear], [DaysInFinancialYear]
)
SELECT 
[DateKey], [DateValidFlag], [DateValid], [DateFormatValidFlag], [DateFormatValid], [Date], [DateStyle], [DateStyle2], [DateStyleddmmmyyyy], [DateStyleddmmmyy], [DateStyleddmmyyyy], [DateStyleddmmyy], [DateStyleyyyymmdd], [DateStyleFulldmy], [DayOfWeekNo], [DayOfWeekName], [DayOfWeekAbbreviation], [DayOfMonthNo], [DayOfCalendarYearNo], [DayOfFinancialYearNo], [WeekdayFlag], [WeekDayDescription], [MonthOfYearName], [MonthOfYearAbbreviation], [MonthName], [MonthAbbreviation], [QuarterOfYearName], [QuarterName], [CalendarWeekOfYearNo], [CalendarWeekNo], [CalendarMonthOfYearNo], [CalendarMonthNo], [CalendarQuarterOfYearNo], [CalendarQuarterNo], [CalendarQuarterOfYearNameStyle], [CalendarYear], [CalendarDecade], [FinancialMonthOfYearNo], [FinancialMonthNo], [FinancialQuarterOfYearNo], [FinancialQuarterNo], [FinancialQuarterOfYearNameStyle], [FinancialYear], [FinancialYearStyle], [FinancialDecade], [WeekEndingSunDateKey], [WeekEndingSunStyle], [WeekEndingSunStyleddmmmyy], [WeekEndingSunStyleddmmmyyyy], [WeekEndingSunWeekOfYearNo], [WeekEndingSunMonthOfYearNo], [WeekEndingSunMonthOfYearName], [WeekEndingSunYear], [WeekEndingMonDateKey], [WeekEndingMonStyle], [WeekEndingMonStyleddmmmyy], [WeekEndingMonStyleddmmmyyyy], [WeekEndingMonWeekOfYearNo], [WeekEndingMonMonthOfYearNo], [WeekEndingMonMonthOfYearName], [WeekEndingMonYear], [WeekEndingTueDateKey], [WeekEndingTueStyle], [WeekEndingTueStyleddmmmyy], [WeekEndingTueStyleddmmmyyyy], [WeekEndingTueWeekOfYearNo], [WeekEndingTueMonthOfYearNo], [WeekEndingTueMonthOfYearName], [WeekEndingTueYear], [WeekEndingWedDateKey], [WeekEndingWedStyle], [WeekEndingWedStyleddmmmyy], [WeekEndingWedStyleddmmmyyyy], [WeekEndingWedWeekOfYearNo], [WeekEndingWedMonthOfYearNo], [WeekEndingWedMonthOfYearName], [WeekEndingWedYear], [WeekEndingThuDateKey], [WeekEndingThuStyle], [WeekEndingThuStyleddmmmyy], [WeekEndingThuStyleddmmmyyyy], [WeekEndingThuWeekOfYearNo], [WeekEndingThuMonthOfYearNo], [WeekEndingThuMonthOfYearName], [WeekEndingThuYear], [WeekEndingFriDateKey], [WeekEndingFriStyle], [WeekEndingFriStyleddmmmyy], [WeekEndingFriStyleddmmmyyyy], [WeekEndingFriWeekOfYearNo], [WeekEndingFriMonthOfYearNo], [WeekEndingFriMonthOfYearName], [WeekEndingFriYear], [WeekEndingSatDateKey], [WeekEndingSatStyle], [WeekEndingSatStyleddmmmyy], [WeekEndingSatStyleddmmmyyyy], [WeekEndingSatWeekOfYearNo], [WeekEndingSatMonthOfYearNo], [WeekEndingSatMonthOfYearName], [WeekEndingSatYear], [DateOffset], [MonthOffset], [QuarterOffset], [CalendarYearOffset], [FinancialYearOffset], [StartDayofMonthDate], [StartDayofMonthDateKey], [StartDayofMonthDateStyle], [EndDayofMonthDate], [EndDayofMonthDateKey], [EndDayofMonthDateStyle], [StartDayofQuarterDate], [StartDayofQuarterDateKey], [StartDayofQuarterDateStyle], [EndDayofQuarterDate], [EndDayofQuarterDateKey], [EndDayofQuarterDateStyle], [StartDayofCalendarYearDate], [StartDayofCalendarYearDateKey], [StartDayofCalendarYearDateStyle], [EndDayofCalendarYearDate], [EndDayofCalendarYearDateKey], [EndDayofCalendarYearDateStyle], [StartDayofFinancialYearDate], [StartDayofFinancialYearDateKey], [StartDayofFinancialYearDateStyle], [EndDayofFinancialYearDate], [EndDayofFinancialYearDateKey], [EndDayofFinancialYearDateStyle], [DaysInMonth], [DaysInCalendarYear], [DaysInFinancialYear]
FROM tools.tallydate t
CROSS APPLY [tools].[fu_Date] (t.dt) AS a
GO

USE [IndexDemo]
GO
--####################################################################
RAISERROR('6.4 Populate DimDateChar',10,0);
GO
--####################################################################

INSERT INTO import.DimDateChar
(
[DateKey], [DateValidFlag], [DateValid], [DateFormatValidFlag], [DateFormatValid], [Date], [DateStyle], [DateStyle2], [DateStyleddmmmyyyy], [DateStyleddmmmyy], [DateStyleddmmyyyy], [DateStyleddmmyy], [DateStyleyyyymmdd], [DateStyleFulldmy], [DayOfWeekNo], [DayOfWeekName], [DayOfWeekAbbreviation], [DayOfMonthNo], [DayOfCalendarYearNo], [DayOfFinancialYearNo], [WeekdayFlag], [WeekDayDescription], [MonthOfYearName], [MonthOfYearAbbreviation], [MonthName], [MonthAbbreviation], [QuarterOfYearName], [QuarterName], [CalendarWeekOfYearNo], [CalendarWeekNo], [CalendarMonthOfYearNo], [CalendarMonthNo], [CalendarQuarterOfYearNo], [CalendarQuarterNo], [CalendarQuarterOfYearNameStyle], [CalendarYear], [CalendarDecade], [FinancialMonthOfYearNo], [FinancialMonthNo], [FinancialQuarterOfYearNo], [FinancialQuarterNo], [FinancialQuarterOfYearNameStyle], [FinancialYear], [FinancialYearStyle], [FinancialDecade], [WeekEndingSunDateKey], [WeekEndingSunStyle], [WeekEndingSunStyleddmmmyy], [WeekEndingSunStyleddmmmyyyy], [WeekEndingSunWeekOfYearNo], [WeekEndingSunMonthOfYearNo], [WeekEndingSunMonthOfYearName], [WeekEndingSunYear], [WeekEndingMonDateKey], [WeekEndingMonStyle], [WeekEndingMonStyleddmmmyy], [WeekEndingMonStyleddmmmyyyy], [WeekEndingMonWeekOfYearNo], [WeekEndingMonMonthOfYearNo], [WeekEndingMonMonthOfYearName], [WeekEndingMonYear], [WeekEndingTueDateKey], [WeekEndingTueStyle], [WeekEndingTueStyleddmmmyy], [WeekEndingTueStyleddmmmyyyy], [WeekEndingTueWeekOfYearNo], [WeekEndingTueMonthOfYearNo], [WeekEndingTueMonthOfYearName], [WeekEndingTueYear], [WeekEndingWedDateKey], [WeekEndingWedStyle], [WeekEndingWedStyleddmmmyy], [WeekEndingWedStyleddmmmyyyy], [WeekEndingWedWeekOfYearNo], [WeekEndingWedMonthOfYearNo], [WeekEndingWedMonthOfYearName], [WeekEndingWedYear], [WeekEndingThuDateKey], [WeekEndingThuStyle], [WeekEndingThuStyleddmmmyy], [WeekEndingThuStyleddmmmyyyy], [WeekEndingThuWeekOfYearNo], [WeekEndingThuMonthOfYearNo], [WeekEndingThuMonthOfYearName], [WeekEndingThuYear], [WeekEndingFriDateKey], [WeekEndingFriStyle], [WeekEndingFriStyleddmmmyy], [WeekEndingFriStyleddmmmyyyy], [WeekEndingFriWeekOfYearNo], [WeekEndingFriMonthOfYearNo], [WeekEndingFriMonthOfYearName], [WeekEndingFriYear], [WeekEndingSatDateKey], [WeekEndingSatStyle], [WeekEndingSatStyleddmmmyy], [WeekEndingSatStyleddmmmyyyy], [WeekEndingSatWeekOfYearNo], [WeekEndingSatMonthOfYearNo], [WeekEndingSatMonthOfYearName], [WeekEndingSatYear], [DateOffset], [MonthOffset], [QuarterOffset], [CalendarYearOffset], [FinancialYearOffset], [StartDayofMonthDate], [StartDayofMonthDateKey], [StartDayofMonthDateStyle], [EndDayofMonthDate], [EndDayofMonthDateKey], [EndDayofMonthDateStyle], [StartDayofQuarterDate], [StartDayofQuarterDateKey], [StartDayofQuarterDateStyle], [EndDayofQuarterDate], [EndDayofQuarterDateKey], [EndDayofQuarterDateStyle], [StartDayofCalendarYearDate], [StartDayofCalendarYearDateKey], [StartDayofCalendarYearDateStyle], [EndDayofCalendarYearDate], [EndDayofCalendarYearDateKey], [EndDayofCalendarYearDateStyle], [StartDayofFinancialYearDate], [StartDayofFinancialYearDateKey], [StartDayofFinancialYearDateStyle], [EndDayofFinancialYearDate], [EndDayofFinancialYearDateKey], [EndDayofFinancialYearDateStyle], [DaysInMonth], [DaysInCalendarYear], [DaysInFinancialYear], [CalendarMonthNoChar]
)
SELECT [DateKey], [DateValidFlag], [DateValid], [DateFormatValidFlag], [DateFormatValid], [Date], [DateStyle], [DateStyle2], [DateStyleddmmmyyyy], [DateStyleddmmmyy], [DateStyleddmmyyyy], [DateStyleddmmyy], [DateStyleyyyymmdd], [DateStyleFulldmy], [DayOfWeekNo], [DayOfWeekName], [DayOfWeekAbbreviation], [DayOfMonthNo], [DayOfCalendarYearNo], [DayOfFinancialYearNo], [WeekdayFlag], [WeekDayDescription], [MonthOfYearName], [MonthOfYearAbbreviation], [MonthName], [MonthAbbreviation], [QuarterOfYearName], [QuarterName], [CalendarWeekOfYearNo], [CalendarWeekNo], [CalendarMonthOfYearNo], [CalendarMonthNo], [CalendarQuarterOfYearNo], [CalendarQuarterNo], [CalendarQuarterOfYearNameStyle], [CalendarYear], [CalendarDecade], [FinancialMonthOfYearNo], [FinancialMonthNo], [FinancialQuarterOfYearNo], [FinancialQuarterNo], [FinancialQuarterOfYearNameStyle], [FinancialYear], [FinancialYearStyle], [FinancialDecade], [WeekEndingSunDateKey], [WeekEndingSunStyle], [WeekEndingSunStyleddmmmyy], [WeekEndingSunStyleddmmmyyyy], [WeekEndingSunWeekOfYearNo], [WeekEndingSunMonthOfYearNo], [WeekEndingSunMonthOfYearName], [WeekEndingSunYear], [WeekEndingMonDateKey], [WeekEndingMonStyle], [WeekEndingMonStyleddmmmyy], [WeekEndingMonStyleddmmmyyyy], [WeekEndingMonWeekOfYearNo], [WeekEndingMonMonthOfYearNo], [WeekEndingMonMonthOfYearName], [WeekEndingMonYear], [WeekEndingTueDateKey], [WeekEndingTueStyle], [WeekEndingTueStyleddmmmyy], [WeekEndingTueStyleddmmmyyyy], [WeekEndingTueWeekOfYearNo], [WeekEndingTueMonthOfYearNo], [WeekEndingTueMonthOfYearName], [WeekEndingTueYear], [WeekEndingWedDateKey], [WeekEndingWedStyle], [WeekEndingWedStyleddmmmyy], [WeekEndingWedStyleddmmmyyyy], [WeekEndingWedWeekOfYearNo], [WeekEndingWedMonthOfYearNo], [WeekEndingWedMonthOfYearName], [WeekEndingWedYear], [WeekEndingThuDateKey], [WeekEndingThuStyle], [WeekEndingThuStyleddmmmyy], [WeekEndingThuStyleddmmmyyyy], [WeekEndingThuWeekOfYearNo], [WeekEndingThuMonthOfYearNo], [WeekEndingThuMonthOfYearName], [WeekEndingThuYear], [WeekEndingFriDateKey], [WeekEndingFriStyle], [WeekEndingFriStyleddmmmyy], [WeekEndingFriStyleddmmmyyyy], [WeekEndingFriWeekOfYearNo], [WeekEndingFriMonthOfYearNo], [WeekEndingFriMonthOfYearName], [WeekEndingFriYear], [WeekEndingSatDateKey], [WeekEndingSatStyle], [WeekEndingSatStyleddmmmyy], [WeekEndingSatStyleddmmmyyyy], [WeekEndingSatWeekOfYearNo], [WeekEndingSatMonthOfYearNo], [WeekEndingSatMonthOfYearName], [WeekEndingSatYear], [DateOffset], [MonthOffset], [QuarterOffset], [CalendarYearOffset], [FinancialYearOffset], [StartDayofMonthDate], [StartDayofMonthDateKey], [StartDayofMonthDateStyle], [EndDayofMonthDate], [EndDayofMonthDateKey], [EndDayofMonthDateStyle], [StartDayofQuarterDate], [StartDayofQuarterDateKey], [StartDayofQuarterDateStyle], [EndDayofQuarterDate], [EndDayofQuarterDateKey], [EndDayofQuarterDateStyle], [StartDayofCalendarYearDate], [StartDayofCalendarYearDateKey], [StartDayofCalendarYearDateStyle], [EndDayofCalendarYearDate], [EndDayofCalendarYearDateKey], [EndDayofCalendarYearDateStyle], [StartDayofFinancialYearDate], [StartDayofFinancialYearDateKey], [StartDayofFinancialYearDateStyle], [EndDayofFinancialYearDate], [EndDayofFinancialYearDateKey], [EndDayofFinancialYearDateStyle], [DaysInMonth], [DaysInCalendarYear], [DaysInFinancialYear],CalendarMonthNo
FROM import.DimDate;

--SELECT TOP 10 * FROM import.DimDatecHAR

USE [IndexDemo]
GO
--####################################################################
RAISERROR('6.5 Populate DimDateOneRow',10,0);
GO
--####################################################################

INSERT INTO import.DimDateOneRow
(
[DateKey], [DateValidFlag], [DateValid], [DateFormatValidFlag], [DateFormatValid], [Date], [DateStyle], [DateStyle2], [DateStyleddmmmyyyy], [DateStyleddmmmyy], [DateStyleddmmyyyy], [DateStyleddmmyy], [DateStyleyyyymmdd], [DateStyleFulldmy], [DayOfWeekNo], [DayOfWeekName], [DayOfWeekAbbreviation], [DayOfMonthNo], [DayOfCalendarYearNo], [DayOfFinancialYearNo], [WeekdayFlag], [WeekDayDescription], [MonthOfYearName], [MonthOfYearAbbreviation], [MonthName], [MonthAbbreviation], [QuarterOfYearName], [QuarterName], [CalendarWeekOfYearNo], [CalendarWeekNo], [CalendarMonthOfYearNo], [CalendarMonthNo], [CalendarQuarterOfYearNo], [CalendarQuarterNo], [CalendarQuarterOfYearNameStyle], [CalendarYear], [CalendarDecade], [FinancialMonthOfYearNo], [FinancialMonthNo], [FinancialQuarterOfYearNo], [FinancialQuarterNo], [FinancialQuarterOfYearNameStyle], [FinancialYear], [FinancialYearStyle], [FinancialDecade], [WeekEndingSunDateKey], [WeekEndingSunStyle], [WeekEndingSunStyleddmmmyy], [WeekEndingSunStyleddmmmyyyy], [WeekEndingSunWeekOfYearNo], [WeekEndingSunMonthOfYearNo], [WeekEndingSunMonthOfYearName], [WeekEndingSunYear], [WeekEndingMonDateKey], [WeekEndingMonStyle], [WeekEndingMonStyleddmmmyy], [WeekEndingMonStyleddmmmyyyy], [WeekEndingMonWeekOfYearNo], [WeekEndingMonMonthOfYearNo], [WeekEndingMonMonthOfYearName], [WeekEndingMonYear], [WeekEndingTueDateKey], [WeekEndingTueStyle], [WeekEndingTueStyleddmmmyy], [WeekEndingTueStyleddmmmyyyy], [WeekEndingTueWeekOfYearNo], [WeekEndingTueMonthOfYearNo], [WeekEndingTueMonthOfYearName], [WeekEndingTueYear], [WeekEndingWedDateKey], [WeekEndingWedStyle], [WeekEndingWedStyleddmmmyy], [WeekEndingWedStyleddmmmyyyy], [WeekEndingWedWeekOfYearNo], [WeekEndingWedMonthOfYearNo], [WeekEndingWedMonthOfYearName], [WeekEndingWedYear], [WeekEndingThuDateKey], [WeekEndingThuStyle], [WeekEndingThuStyleddmmmyy], [WeekEndingThuStyleddmmmyyyy], [WeekEndingThuWeekOfYearNo], [WeekEndingThuMonthOfYearNo], [WeekEndingThuMonthOfYearName], [WeekEndingThuYear], [WeekEndingFriDateKey], [WeekEndingFriStyle], [WeekEndingFriStyleddmmmyy], [WeekEndingFriStyleddmmmyyyy], [WeekEndingFriWeekOfYearNo], [WeekEndingFriMonthOfYearNo], [WeekEndingFriMonthOfYearName], [WeekEndingFriYear], [WeekEndingSatDateKey], [WeekEndingSatStyle], [WeekEndingSatStyleddmmmyy], [WeekEndingSatStyleddmmmyyyy], [WeekEndingSatWeekOfYearNo], [WeekEndingSatMonthOfYearNo], [WeekEndingSatMonthOfYearName], [WeekEndingSatYear], [DateOffset], [MonthOffset], [QuarterOffset], [CalendarYearOffset], [FinancialYearOffset], [StartDayofMonthDate], [StartDayofMonthDateKey], [StartDayofMonthDateStyle], [EndDayofMonthDate], [EndDayofMonthDateKey], [EndDayofMonthDateStyle], [StartDayofQuarterDate], [StartDayofQuarterDateKey], [StartDayofQuarterDateStyle], [EndDayofQuarterDate], [EndDayofQuarterDateKey], [EndDayofQuarterDateStyle], [StartDayofCalendarYearDate], [StartDayofCalendarYearDateKey], [StartDayofCalendarYearDateStyle], [EndDayofCalendarYearDate], [EndDayofCalendarYearDateKey], [EndDayofCalendarYearDateStyle], [StartDayofFinancialYearDate], [StartDayofFinancialYearDateKey], [StartDayofFinancialYearDateStyle], [EndDayofFinancialYearDate], [EndDayofFinancialYearDateKey], [EndDayofFinancialYearDateStyle], [DaysInMonth], [DaysInCalendarYear], [DaysInFinancialYear]
)
SELECT TOP 1 [DateKey], [DateValidFlag], [DateValid], [DateFormatValidFlag], [DateFormatValid], [Date], [DateStyle], [DateStyle2], [DateStyleddmmmyyyy], [DateStyleddmmmyy], [DateStyleddmmyyyy], [DateStyleddmmyy], [DateStyleyyyymmdd], [DateStyleFulldmy], [DayOfWeekNo], [DayOfWeekName], [DayOfWeekAbbreviation], [DayOfMonthNo], [DayOfCalendarYearNo], [DayOfFinancialYearNo], [WeekdayFlag], [WeekDayDescription], [MonthOfYearName], [MonthOfYearAbbreviation], [MonthName], [MonthAbbreviation], [QuarterOfYearName], [QuarterName], [CalendarWeekOfYearNo], [CalendarWeekNo], [CalendarMonthOfYearNo], [CalendarMonthNo], [CalendarQuarterOfYearNo], [CalendarQuarterNo], [CalendarQuarterOfYearNameStyle], [CalendarYear], [CalendarDecade], [FinancialMonthOfYearNo], [FinancialMonthNo], [FinancialQuarterOfYearNo], [FinancialQuarterNo], [FinancialQuarterOfYearNameStyle], [FinancialYear], [FinancialYearStyle], [FinancialDecade], [WeekEndingSunDateKey], [WeekEndingSunStyle], [WeekEndingSunStyleddmmmyy], [WeekEndingSunStyleddmmmyyyy], [WeekEndingSunWeekOfYearNo], [WeekEndingSunMonthOfYearNo], [WeekEndingSunMonthOfYearName], [WeekEndingSunYear], [WeekEndingMonDateKey], [WeekEndingMonStyle], [WeekEndingMonStyleddmmmyy], [WeekEndingMonStyleddmmmyyyy], [WeekEndingMonWeekOfYearNo], [WeekEndingMonMonthOfYearNo], [WeekEndingMonMonthOfYearName], [WeekEndingMonYear], [WeekEndingTueDateKey], [WeekEndingTueStyle], [WeekEndingTueStyleddmmmyy], [WeekEndingTueStyleddmmmyyyy], [WeekEndingTueWeekOfYearNo], [WeekEndingTueMonthOfYearNo], [WeekEndingTueMonthOfYearName], [WeekEndingTueYear], [WeekEndingWedDateKey], [WeekEndingWedStyle], [WeekEndingWedStyleddmmmyy], [WeekEndingWedStyleddmmmyyyy], [WeekEndingWedWeekOfYearNo], [WeekEndingWedMonthOfYearNo], [WeekEndingWedMonthOfYearName], [WeekEndingWedYear], [WeekEndingThuDateKey], [WeekEndingThuStyle], [WeekEndingThuStyleddmmmyy], [WeekEndingThuStyleddmmmyyyy], [WeekEndingThuWeekOfYearNo], [WeekEndingThuMonthOfYearNo], [WeekEndingThuMonthOfYearName], [WeekEndingThuYear], [WeekEndingFriDateKey], [WeekEndingFriStyle], [WeekEndingFriStyleddmmmyy], [WeekEndingFriStyleddmmmyyyy], [WeekEndingFriWeekOfYearNo], [WeekEndingFriMonthOfYearNo], [WeekEndingFriMonthOfYearName], [WeekEndingFriYear], [WeekEndingSatDateKey], [WeekEndingSatStyle], [WeekEndingSatStyleddmmmyy], [WeekEndingSatStyleddmmmyyyy], [WeekEndingSatWeekOfYearNo], [WeekEndingSatMonthOfYearNo], [WeekEndingSatMonthOfYearName], [WeekEndingSatYear], [DateOffset], [MonthOffset], [QuarterOffset], [CalendarYearOffset], [FinancialYearOffset], [StartDayofMonthDate], [StartDayofMonthDateKey], [StartDayofMonthDateStyle], [EndDayofMonthDate], [EndDayofMonthDateKey], [EndDayofMonthDateStyle], [StartDayofQuarterDate], [StartDayofQuarterDateKey], [StartDayofQuarterDateStyle], [EndDayofQuarterDate], [EndDayofQuarterDateKey], [EndDayofQuarterDateStyle], [StartDayofCalendarYearDate], [StartDayofCalendarYearDateKey], [StartDayofCalendarYearDateStyle], [EndDayofCalendarYearDate], [EndDayofCalendarYearDateKey], [EndDayofCalendarYearDateStyle], [StartDayofFinancialYearDate], [StartDayofFinancialYearDateKey], [StartDayofFinancialYearDateStyle], [EndDayofFinancialYearDate], [EndDayofFinancialYearDateKey], [EndDayofFinancialYearDateStyle], [DaysInMonth], [DaysInCalendarYear], [DaysInFinancialYear]
FROM import.DimDate
ORDER BY DateKey DESC;

GO

--SELECT * FROM import.DimDateOneRow

USE [IndexDemo]
GO
--####################################################################
RAISERROR('6.6 Populate DimDateHeap',10,0);
GO
--####################################################################


INSERT INTO import.DimDateHeap
(
[DateKey], [DateValidFlag], [DateValid], [DateFormatValidFlag], [DateFormatValid], [Date], [DateStyle], [DateStyle2], [DateStyleddmmmyyyy], [DateStyleddmmmyy], [DateStyleddmmyyyy], [DateStyleddmmyy], [DateStyleyyyymmdd], [DateStyleFulldmy], [DayOfWeekNo], [DayOfWeekName], [DayOfWeekAbbreviation], [DayOfMonthNo], [DayOfCalendarYearNo], [DayOfFinancialYearNo], [WeekdayFlag], [WeekDayDescription], [MonthOfYearName], [MonthOfYearAbbreviation], [MonthName], [MonthAbbreviation], [QuarterOfYearName], [QuarterName], [CalendarWeekOfYearNo], [CalendarWeekNo], [CalendarMonthOfYearNo], [CalendarMonthNo], [CalendarQuarterOfYearNo], [CalendarQuarterNo], [CalendarQuarterOfYearNameStyle], [CalendarYear], [CalendarDecade], [FinancialMonthOfYearNo], [FinancialMonthNo], [FinancialQuarterOfYearNo], [FinancialQuarterNo], [FinancialQuarterOfYearNameStyle], [FinancialYear], [FinancialYearStyle], [FinancialDecade], [WeekEndingSunDateKey], [WeekEndingSunStyle], [WeekEndingSunStyleddmmmyy], [WeekEndingSunStyleddmmmyyyy], [WeekEndingSunWeekOfYearNo], [WeekEndingSunMonthOfYearNo], [WeekEndingSunMonthOfYearName], [WeekEndingSunYear], [WeekEndingMonDateKey], [WeekEndingMonStyle], [WeekEndingMonStyleddmmmyy], [WeekEndingMonStyleddmmmyyyy], [WeekEndingMonWeekOfYearNo], [WeekEndingMonMonthOfYearNo], [WeekEndingMonMonthOfYearName], [WeekEndingMonYear], [WeekEndingTueDateKey], [WeekEndingTueStyle], [WeekEndingTueStyleddmmmyy], [WeekEndingTueStyleddmmmyyyy], [WeekEndingTueWeekOfYearNo], [WeekEndingTueMonthOfYearNo], [WeekEndingTueMonthOfYearName], [WeekEndingTueYear], [WeekEndingWedDateKey], [WeekEndingWedStyle], [WeekEndingWedStyleddmmmyy], [WeekEndingWedStyleddmmmyyyy], [WeekEndingWedWeekOfYearNo], [WeekEndingWedMonthOfYearNo], [WeekEndingWedMonthOfYearName], [WeekEndingWedYear], [WeekEndingThuDateKey], [WeekEndingThuStyle], [WeekEndingThuStyleddmmmyy], [WeekEndingThuStyleddmmmyyyy], [WeekEndingThuWeekOfYearNo], [WeekEndingThuMonthOfYearNo], [WeekEndingThuMonthOfYearName], [WeekEndingThuYear], [WeekEndingFriDateKey], [WeekEndingFriStyle], [WeekEndingFriStyleddmmmyy], [WeekEndingFriStyleddmmmyyyy], [WeekEndingFriWeekOfYearNo], [WeekEndingFriMonthOfYearNo], [WeekEndingFriMonthOfYearName], [WeekEndingFriYear], [WeekEndingSatDateKey], [WeekEndingSatStyle], [WeekEndingSatStyleddmmmyy], [WeekEndingSatStyleddmmmyyyy], [WeekEndingSatWeekOfYearNo], [WeekEndingSatMonthOfYearNo], [WeekEndingSatMonthOfYearName], [WeekEndingSatYear], [DateOffset], [MonthOffset], [QuarterOffset], [CalendarYearOffset], [FinancialYearOffset], [StartDayofMonthDate], [StartDayofMonthDateKey], [StartDayofMonthDateStyle], [EndDayofMonthDate], [EndDayofMonthDateKey], [EndDayofMonthDateStyle], [StartDayofQuarterDate], [StartDayofQuarterDateKey], [StartDayofQuarterDateStyle], [EndDayofQuarterDate], [EndDayofQuarterDateKey], [EndDayofQuarterDateStyle], [StartDayofCalendarYearDate], [StartDayofCalendarYearDateKey], [StartDayofCalendarYearDateStyle], [EndDayofCalendarYearDate], [EndDayofCalendarYearDateKey], [EndDayofCalendarYearDateStyle], [StartDayofFinancialYearDate], [StartDayofFinancialYearDateKey], [StartDayofFinancialYearDateStyle], [EndDayofFinancialYearDate], [EndDayofFinancialYearDateKey], [EndDayofFinancialYearDateStyle], [DaysInMonth], [DaysInCalendarYear], [DaysInFinancialYear]
)
SELECT 
[DateKey], [DateValidFlag], [DateValid], [DateFormatValidFlag], [DateFormatValid], [Date], [DateStyle], [DateStyle2], [DateStyleddmmmyyyy], [DateStyleddmmmyy], [DateStyleddmmyyyy], [DateStyleddmmyy], [DateStyleyyyymmdd], [DateStyleFulldmy], [DayOfWeekNo], [DayOfWeekName], [DayOfWeekAbbreviation], [DayOfMonthNo], [DayOfCalendarYearNo], [DayOfFinancialYearNo], [WeekdayFlag], [WeekDayDescription], [MonthOfYearName], [MonthOfYearAbbreviation], [MonthName], [MonthAbbreviation], [QuarterOfYearName], [QuarterName], [CalendarWeekOfYearNo], [CalendarWeekNo], [CalendarMonthOfYearNo], [CalendarMonthNo], [CalendarQuarterOfYearNo], [CalendarQuarterNo], [CalendarQuarterOfYearNameStyle], [CalendarYear], [CalendarDecade], [FinancialMonthOfYearNo], [FinancialMonthNo], [FinancialQuarterOfYearNo], [FinancialQuarterNo], [FinancialQuarterOfYearNameStyle], [FinancialYear], [FinancialYearStyle], [FinancialDecade], [WeekEndingSunDateKey], [WeekEndingSunStyle], [WeekEndingSunStyleddmmmyy], [WeekEndingSunStyleddmmmyyyy], [WeekEndingSunWeekOfYearNo], [WeekEndingSunMonthOfYearNo], [WeekEndingSunMonthOfYearName], [WeekEndingSunYear], [WeekEndingMonDateKey], [WeekEndingMonStyle], [WeekEndingMonStyleddmmmyy], [WeekEndingMonStyleddmmmyyyy], [WeekEndingMonWeekOfYearNo], [WeekEndingMonMonthOfYearNo], [WeekEndingMonMonthOfYearName], [WeekEndingMonYear], [WeekEndingTueDateKey], [WeekEndingTueStyle], [WeekEndingTueStyleddmmmyy], [WeekEndingTueStyleddmmmyyyy], [WeekEndingTueWeekOfYearNo], [WeekEndingTueMonthOfYearNo], [WeekEndingTueMonthOfYearName], [WeekEndingTueYear], [WeekEndingWedDateKey], [WeekEndingWedStyle], [WeekEndingWedStyleddmmmyy], [WeekEndingWedStyleddmmmyyyy], [WeekEndingWedWeekOfYearNo], [WeekEndingWedMonthOfYearNo], [WeekEndingWedMonthOfYearName], [WeekEndingWedYear], [WeekEndingThuDateKey], [WeekEndingThuStyle], [WeekEndingThuStyleddmmmyy], [WeekEndingThuStyleddmmmyyyy], [WeekEndingThuWeekOfYearNo], [WeekEndingThuMonthOfYearNo], [WeekEndingThuMonthOfYearName], [WeekEndingThuYear], [WeekEndingFriDateKey], [WeekEndingFriStyle], [WeekEndingFriStyleddmmmyy], [WeekEndingFriStyleddmmmyyyy], [WeekEndingFriWeekOfYearNo], [WeekEndingFriMonthOfYearNo], [WeekEndingFriMonthOfYearName], [WeekEndingFriYear], [WeekEndingSatDateKey], [WeekEndingSatStyle], [WeekEndingSatStyleddmmmyy], [WeekEndingSatStyleddmmmyyyy], [WeekEndingSatWeekOfYearNo], [WeekEndingSatMonthOfYearNo], [WeekEndingSatMonthOfYearName], [WeekEndingSatYear], [DateOffset], [MonthOffset], [QuarterOffset], [CalendarYearOffset], [FinancialYearOffset], [StartDayofMonthDate], [StartDayofMonthDateKey], [StartDayofMonthDateStyle], [EndDayofMonthDate], [EndDayofMonthDateKey], [EndDayofMonthDateStyle], [StartDayofQuarterDate], [StartDayofQuarterDateKey], [StartDayofQuarterDateStyle], [EndDayofQuarterDate], [EndDayofQuarterDateKey], [EndDayofQuarterDateStyle], [StartDayofCalendarYearDate], [StartDayofCalendarYearDateKey], [StartDayofCalendarYearDateStyle], [EndDayofCalendarYearDate], [EndDayofCalendarYearDateKey], [EndDayofCalendarYearDateStyle], [StartDayofFinancialYearDate], [StartDayofFinancialYearDateKey], [StartDayofFinancialYearDateStyle], [EndDayofFinancialYearDate], [EndDayofFinancialYearDateKey], [EndDayofFinancialYearDateStyle], [DaysInMonth], [DaysInCalendarYear], [DaysInFinancialYear]
FROM import.DimDate
ORDER BY DateKey DESC;

GO

--SELECT TOP 10 * FROM import.DimDateHeap

USE [IndexDemo]
GO
--####################################################################
RAISERROR('6.7 Populate DimTest',10,0);
GO
--####################################################################

INSERT INTO import.DimTest
(TestValue,TestValueCategory)

SELECT RIGHT(REPLICATE('0',8)+CAST(n AS VARCHAR),8)
,  RIGHT(REPLICATE('0',8)+CAST(floor((N + 99) / 100) * 100 AS VARCHAR),8)

FROM tools.tally
WHERE n <= 100000;

--SELECT TOP 10 * FROM import.DimTest;

USE [IndexDemo]
GO
--####################################################################
RAISERROR('6.8 Populate DimTestHeap',10,0);
GO
--####################################################################

INSERT INTO import.DimTestHeap
(TestValue,TestValueCategory)
SELECT  TestValue,TestValueCategory
FROM import.DimTest;

--SELECT TOP 10 * FROM import.DimTestHeap;

USE [IndexDemo]
GO
--####################################################################
RAISERROR('6.9 Populate FactTest',10,0);
GO
--####################################################################
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

 --SELECT TOP 10 * FROM import.FactTest;

 USE [IndexDemo]
GO
--####################################################################
RAISERROR('6.10 Populate FactTest',10,0);
GO
--####################################################################
INSERT INTO import.FactTestHeap
(
[DateKey], [TestKey], [CountTest], [AmountTest]
)
SELECT [DateKey], [TestKey], [CountTest], [AmountTest]
FROM import.FactTest;

 --SELECT TOP 10 * FROM import.FactTestHeap;


