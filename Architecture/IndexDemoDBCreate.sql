USE [master]
GO
/****** Object:  Database [IndexDemo]    Script Date: 25/02/2015 19:56:56 ******/
CREATE DATABASE [IndexDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IndexDemo_pri', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL12.SQLExpress2014\MSSQL\Data\IndexDemo_pri.mdf' , SIZE = 51200KB , MAXSIZE = UNLIMITED, FILEGROWTH = 0), 
 FILEGROUP [IndexDemo]  DEFAULT
( NAME = N'IndexDemo', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL12.SQLExpress2014\MSSQL\Data\IndexDemo.ndf' , SIZE = 1024000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 0), 
 FILEGROUP [IndexDemo_common] 
( NAME = N'IndexDemo_common', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL12.SQLExpress2014\MSSQL\Data\IndexDemo_common.mdf' , SIZE = 51200KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [IndexDemo_ncidx] 
( NAME = N'IndexDemo_ncidx', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL12.SQLExpress2014\MSSQL\Data\IndexDemo_ncidx.mdf' , SIZE = 512000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 0)
 LOG ON 
( NAME = N'IndexDemo_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL12.SQLExpress2014\MSSQL\Log\IndexDemo_log.ldf' , SIZE = 3480448KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IndexDemo] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IndexDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IndexDemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IndexDemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IndexDemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IndexDemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IndexDemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [IndexDemo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [IndexDemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IndexDemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IndexDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IndexDemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IndexDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IndexDemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IndexDemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IndexDemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IndexDemo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IndexDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IndexDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IndexDemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IndexDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IndexDemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IndexDemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IndexDemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IndexDemo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IndexDemo] SET  MULTI_USER 
GO
ALTER DATABASE [IndexDemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IndexDemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IndexDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IndexDemo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [IndexDemo] SET DELAYED_DURABILITY = DISABLED 
GO
USE [IndexDemo]
GO
/****** Object:  DatabaseRole [tools]    Script Date: 25/02/2015 19:56:56 ******/
CREATE ROLE [tools]
GO
/****** Object:  DatabaseRole [metadata]    Script Date: 25/02/2015 19:56:56 ******/
CREATE ROLE [metadata]
GO
/****** Object:  DatabaseRole [import]    Script Date: 25/02/2015 19:56:56 ******/
CREATE ROLE [import]
GO
/****** Object:  DatabaseRole [export]    Script Date: 25/02/2015 19:56:56 ******/
CREATE ROLE [export]
GO
/****** Object:  DatabaseRole [DenyPII]    Script Date: 25/02/2015 19:56:56 ******/
CREATE ROLE [DenyPII]
GO
/****** Object:  DatabaseRole [app]    Script Date: 25/02/2015 19:56:56 ******/
CREATE ROLE [app]
GO
/****** Object:  DatabaseRole [admin]    Script Date: 25/02/2015 19:56:56 ******/
CREATE ROLE [admin]
GO
/****** Object:  DatabaseRole [acc]    Script Date: 25/02/2015 19:56:56 ******/
CREATE ROLE [acc]
GO
/****** Object:  Schema [acc]    Script Date: 25/02/2015 19:56:56 ******/
CREATE SCHEMA [acc]
GO
/****** Object:  Schema [admin]    Script Date: 25/02/2015 19:56:56 ******/
CREATE SCHEMA [admin]
GO
/****** Object:  Schema [app]    Script Date: 25/02/2015 19:56:56 ******/
CREATE SCHEMA [app]
GO
/****** Object:  Schema [export]    Script Date: 25/02/2015 19:56:56 ******/
CREATE SCHEMA [export]
GO
/****** Object:  Schema [import]    Script Date: 25/02/2015 19:56:56 ******/
CREATE SCHEMA [import]
GO
/****** Object:  Schema [metadata]    Script Date: 25/02/2015 19:56:56 ******/
CREATE SCHEMA [metadata]
GO
/****** Object:  Schema [tools]    Script Date: 25/02/2015 19:56:56 ******/
CREATE SCHEMA [tools]
GO
/****** Object:  UserDefinedFunction [acc].[fu_Date]    Script Date: 25/02/2015 19:56:56 ******/
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

CREATE FUNCTION [acc].[fu_Date] (@date DATE)
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
/****** Object:  UserDefinedFunction [metadata].[fu_ViewTableSource]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Function Details
------------------
Creator				: Richard Griffiths 
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Returns table of views with the source objects in a single line
Parameters
------------------
none

Depends On
------------------
none
*/

CREATE FUNCTION [metadata].[fu_ViewTableSource] ()
--DROP FUNCTION [metadata].[fu_ViewTableSource] 
--SELECT * FROM [metadata].[fu_ViewTableSource] ()

RETURNS @view_table_source TABLE
(
view_table_source_id INT IDENTITY
,view_name VARCHAR(MAX)
,view_table_Source VARCHAR(MAX)
)

BEGIN

/******************************************************************************************
1.0 Get Stage Source Items in Single rows per dimension ready for metadata insert later
*******************************************************************************************/

INSERT INTO @view_table_source
(
view_name 
,view_table_Source 
)

SELECT view_name,QUOTENAME(table_catalog)+'.'+QUOTENAME(TABLE_SCHEMA)+'.'+QUOTENAME(TABLE_NAME)
FROM INFORMATION_SCHEMA.VIEW_TABLE_USAGE 
ORDER BY VIEW_NAME,QUOTENAME(table_catalog)+'.'+QUOTENAME(TABLE_SCHEMA)+'.'+QUOTENAME(TABLE_NAME)


--1.4 Declare intefer ids from stage columns in dbostage_log.refresh_dimcolumns table to cycle through obtaining values
DECLARE @id INT = 1
DECLARE @maxid INT = (SELECT MAX(view_table_source_id) FROM @view_table_source)
DECLARE @view VARCHAR(255) = ''
DECLARE @maxviewid INT 
DECLARE @table VARCHAR(MAX) = ''

WHILE @id <= @maxid
BEGIN
SET @view = (SELECT view_name FROM @view_table_source WHERE view_table_source_id = @id)
SET @maxviewid = (SELECT MAX(view_table_source_id) FROM @view_table_source WHERE view_name = @view)
SET @table  = (SELECT view_table_source FROM @view_table_source WHERE view_table_source_id = @id)

IF @id <> @maxviewid
BEGIN
UPDATE @view_table_source
SET view_table_source = view_table_source+', '+@table
WHERE view_table_source_id = @maxviewid
END
ELSE
BEGIN
DELETE FROM @view_table_source
WHERE view_name = @view AND view_table_source_id <> @maxviewid
END
SET @id=@id+1
END

RETURN

END


GO
/****** Object:  UserDefinedFunction [tools].[fu_MergeAutoScript]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Function Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Returns Merge Statement based on parameters entered

Parameters
------------------
none

Depends On
------------------
none
*/


CREATE FUNCTION [tools].[fu_MergeAutoScript]
(
--0.1 Declare Target Table Variable
@targettable VARCHAR(50) --= 'AdministrativeCategory'
--0.2 Declare Target Schema Variable
,@targetschema VARCHAR(50) --= 'import'
--0.3 Declare Source Table Variable
,@sourcetable VARCHAR(50) --= '##AdministrativeCategory'
--0.4 Declare Source Schema Variable
,@sourceschema VARCHAR(50) --= ''
--0.5 Index to Match Key Columns on
,@index VARCHAR(50) --= 'PK_AdministrativeCategory'
--0.6 Exclusion Columns Key (optional)
,@exckey VARCHAR(MAX) --= ''
--0.7 Exclusion Column Non Key (optional)
,@excnonkey VARCHAR(MAX) --= 'ID'
--0.8 Script type : Normal Merge Sequence (1) or Delete Redundancies where Rows are the same (0)
,@scripttype BIT = 1
--0.8 Generate Insert
,@insertflag BIT = 1
--0.9 Generate Update
,@updateflag BIT = 1
--0.10 Generate Delete
,@deleteflag BIT = 1
)

RETURNS VARCHAR(MAX)

AS

BEGIN


/*
1.0 Declare Variables
*/

--1.1 Create variable for Key Column Matching String
DECLARE @keymatch VARCHAR(MAX) = '--KEY COLUMNS MATCHING STRING'+CHAR(10)
--1.2 Create Variable for Non Key Column Matching String
DECLARE @nonkeymatch VARCHAR(MAX) = '--NON KEY COLUMNS MATCH'+CHAR(10)
--1.3 Create Variable for Non Key Column Non Matching String
DECLARE @nonkeynonmatch VARCHAR(MAX) = '--NON KEY COLUMNS NON MATCH'+CHAR(10)
--1.4 Declare Target Table
DECLARE @targetname VARCHAR(255) = CASE WHEN @targettable LIKE '#%' THEN @targettable ELSE 
QUOTENAME(@targetschema)+'.'+QUOTENAME(@targettable) END
--1.5 Declare Source Table
DECLARE @sourcename VARCHAR(255) = CASE WHEN @sourcetable LIKE '#%' THEN @sourcetable ELSE 
QUOTENAME(@sourceschema)+'.'+QUOTENAME(@sourcetable) END
--1.6 Declare Select List of Target
--1.6.1
DECLARE @targetselect VARCHAR(MAX) = (SELECT tools.fu_SelectList(@targetschema,@targettable))
--1.6.2 String trim the select list to make 1.6.3 work
SET @targetselect = dw_tools.tools.fu_StringTrimTotal(@targetselect)
--1.6.3 remove excluded columns
SELECT @targetselect  = REPLACE(@targetselect,QUOTENAME(value)+',','')
FROM (SELECT value FROM [dw_tools].[tools].[fu_ToolTableValues](@excnonkey,',')) AS t
--1.6.4 Remove columns not in source
--1.6.4.1 If Temp
IF @sourcename LIKE '#%'
BEGIN
SELECT @targetselect  = REPLACE(@targetselect,QUOTENAME(column_name)+',','')
FROM 
(SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA =  @targetschema AND TABLE_NAME = @targettable
AND COLUMN_NAME NOT IN 
(SELECT COLUMN_NAME FROM tempdb.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @sourcename)) AS t
END
--1.6.4.2 If not Temp
ELSE 
BEGIN 
SELECT @targetselect  = REPLACE(@targetselect,QUOTENAME(column_name)+',','')
FROM 
(SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA =  @targetschema AND TABLE_NAME = @targetname
AND COLUMN_NAME NOT IN 
(SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = @sourceschema AND TABLE_NAME = @sourcetable)) AS t
END

/*
2.0 Declare Table Variables
*/

--2.1 Declare Table to Hold Key Columns
DECLARE @keycols TABLE 
(ColName VARCHAR(255))

--2.2 Declare Table to Hold Non Key Columns
DECLARE @nonkeycols TABLE 
(ColName VARCHAR(255))

/*
3.0 Populate Key Column Tables
*/

--3.1 Insert Columns of Index into Key Columns Temp Table
INSERT INTO @keycols
(ColName)
SELECT c.name FROM sys.indexes i
JOIN sys.index_columns ic ON
ic.index_id = i.index_id
AND ic.object_id = i.object_id
JOIN sys.columns c ON
c.column_id = ic.column_id
AND c.object_id = ic.object_id
JOIN sys.tables t ON
t.object_id = c.object_id
JOIN sys.schemas s ON
s.schema_id = t.schema_id
WHERE 
S.name = @targetschema
AND t.name = @targettable
AND I.name = @index
AND C.NAME NOT IN (SELECT value FROM [dw_tools].[tools].[fu_ToolTableValues](@exckey,','))--exclusion columns

--3.2 Insert Non Key Columns into Table From Column Metadata that are not Key Columns
INSERT INTO @nonkeycols
(ColName)
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = @targetschema
AND TABLE_NAME = @targettable
--3.2.1 Not Key Columns
AND COLUMN_NAME NOT IN (SELECT ColName FROM @keycols) 
--3.2.2 exclusion columns
AND COLUMN_NAME NOT IN (SELECT value FROM  [dw_tools].[tools].[fu_ToolTableValues](@excnonkey,',')) 
--3.2.3 columns must be in source (where not temp)
AND ((@sourcename NOT LIKE '#%' AND COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = @sourceschema AND TABLE_NAME = @sourcetable))
--3.2.4 columns must be in source (where temp table)
OR (@sourcename LIKE '#%' AND COLUMN_NAME IN (SELECT COLUMN_NAME FROM tempdb.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @sourcetable))) 

/*
4.0 Generate joining Merge Script Parts
*/

--4.1 Generate Key Column Join Script
SELECT  @keymatch = @keymatch+' t.'+ColName+' = s.'+ColName+' AND'+CHAR(10) 
FROM @keycols
SET @keymatch = SUBSTRING(@keymatch,1,LEN(@keymatch)-4)

--4.2 Generate Non Key Column Join Script
SELECT  @nonkeymatch = @nonkeymatch+' t.'+ColName+' = s.'+ColName+' ,'+CHAR(10) 
FROM @nonkeycols
SET @nonkeymatch = SUBSTRING(@nonkeymatch,1,LEN(@nonkeymatch)-2)

--4.3 Generate Non Key Column Non Equal Join Script
SELECT  @nonkeynonmatch = @nonkeynonmatch+' t.'+ColName+' <> s.'+ColName+' OR'+CHAR(10) 
FROM @nonkeycols
SET @nonkeynonmatch = SUBSTRING(@nonkeynonmatch,1,LEN(@nonkeynonmatch)-4)

/*
5.0 Generate Start of Merge Statement
*/

--5.1 Generate Merge Statement to be printed
DECLARE @merge VARCHAR(MAX) = 
'
 MERGE INTO '+@targetname+' AS t
 USING '+@sourcename+'  AS s
 ON '+@keymatch +CHAR(10)
 
 /*
 6.0 Normal Merge Statement (@scripttype = 1)
 */
 
IF @scripttype = 1
BEGIN
--6.1 If insert flag = 1 then create insert component
IF @insertflag = 1
BEGIN
SET @merge = @merge+' WHEN NOT MATCHED BY TARGET THEN 
INSERT ('+@targetselect+')
VALUES ('+@targetselect+')'+CHAR(10)
END 
--6.2 If update flag = 1 then create update component
IF @updateflag = 1
BEGIN
SET @merge = @merge+
' WHEN MATCHED AND 
'+@nonkeynonmatch+'
THEN 
UPDATE SET '+@nonkeymatch+CHAR(10)
END 
--6.3 If delete flag = 1 then create delete component
IF @deleteflag = 1
BEGIN
SET @merge = @merge+'
WHEN NOT MATCHED BY SOURCE THEN 
DELETE'+CHAR(10)
END
END

/*
7.0 Delete Redudnancies Statement (@scripttype = 0)
*/

IF @scripttype = 0
BEGIN
--7.1 Change commas to AND and set length of it to remove the final AND
SET @nonkeymatch = REPLACE(@nonkeymatch,',',' AND ')
SET @merge = @merge+' WHEN MATCHED AND 
'+@nonkeymatch+' THEN DELETE'
END

SET @merge = @merge+';'

RETURN @merge

END


GO
/****** Object:  UserDefinedFunction [tools].[fu_SelectList]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Function Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Returns comma seperated string list of columns for a table

Parameters
------------------
@schema				: schema of table
@table				: name of table

Depends On
------------------
none
*/

CREATE FUNCTION [tools].[fu_SelectList] 
(@schema			VARCHAR(255)			
,@table				VARCHAR(255)
)
--DROP FUNCTION [tools].[fu_SelectList]
--SELECT [tools].[fu_SelectList] ('admin','setupdatabase')

RETURNS VARCHAR(MAX)

AS

BEGIN

   DECLARE @select NVARCHAR(MAX) = ''

   SELECT @select = @select+','+QUOTENAME(column_name)+CHAR(10)
   FROM INFORMATION_SCHEMA.COLUMNS
   WHERE TABLE_SCHEMA = @schema AND TABLE_NAME = @table
   
   RETURN SUBSTRING(@select,2,LEN(@select))
   
   END

GO
/****** Object:  UserDefinedFunction [tools].[fu_TableCount]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
View Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Fast table counts for tables
Parameters
------------------
@table				: The name of the table to count or if blank returns all tables count

Depends On
------------------
none
*/

CREATE FUNCTION [tools].[fu_TableCount] (@table VARCHAR(255))
--DROP FUNCTION [tools].[fu_TableCount] 

RETURNS @returntable TABLE
([ID] INT IDENTITY, [table] VARCHAR(255), [rows] INT)

BEGIN

INSERT INTO @returntable
([table], [rows])

SELECT o.name,  ddps.row_count FROM sys.indexes AS i 
 INNER JOIN sys.objects AS o ON 
 i.OBJECT_ID = o.OBJECT_ID  
 INNER JOIN sys.dm_db_partition_stats AS ddps ON 
 i.OBJECT_ID = ddps.OBJECT_ID  
 AND i.index_id = ddps.index_id 
 WHERE i.index_id < 2  AND o.is_ms_shipped = 0 
 AND (o.name = @table OR ISNULL(@table,'') = '')
 ORDER BY o.NAME

RETURN

END


GO
/****** Object:  Table [import].[DimDate]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexDemo]
) ON [IndexDemo]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [import].[DimDateChar]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexDemo]
) ON [IndexDemo]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [import].[DimDateHeap]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
) ON [IndexDemo]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [import].[DimDateOneRow]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [import].[DimDateOneRow](
	[Dt] [date] NOT NULL,
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
) ON [IndexDemo]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [import].[DimTest]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [import].[DimTest](
	[TestKey] [int] IDENTITY(1,1) NOT NULL,
	[TestValue] [char](8) NOT NULL,
	[TestValueCategory] [char](8) NOT NULL,
 CONSTRAINT [PK_DimTest] PRIMARY KEY CLUSTERED 
(
	[TestKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexDemo]
) ON [IndexDemo]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [import].[DimTestHeap]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [import].[DimTestHeap](
	[TestKey] [int] IDENTITY(1,1) NOT NULL,
	[TestValue] [char](8) NOT NULL,
	[TestValueCategory] [char](8) NOT NULL
) ON [IndexDemo]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [import].[FactTest]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexDemo]
) ON [IndexDemo]

GO
/****** Object:  Table [import].[FactTestHeap]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [import].[FactTestHeap](
	[FactKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL,
	[TestKey] [int] NOT NULL,
	[CountTest] [int] NOT NULL,
	[AmountTest] [money] NOT NULL
) ON [IndexDemo]

GO
/****** Object:  Table [metadata].[AuditDatabaseDDL]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [metadata].[AuditDatabaseDDL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dt] [datetime] NULL,
	[db] [varchar](255) NULL,
	[SchemaName] [varchar](20) NULL,
	[ObjectType] [varchar](50) NULL,
	[ObjectName] [varchar](255) NULL,
	[ObjectID] [int] NULL,
	[Command] [varchar](max) NULL,
	[CommandType] [varchar](50) NULL,
	[LoginName] [varchar](100) NULL,
	[UserName] [varchar](100) NULL,
	[HostName] [varchar](255) NULL,
 CONSTRAINT [PK_AuditDatabaseDDL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexDemo_common]
) ON [IndexDemo_common] TEXTIMAGE_ON [IndexDemo_common]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [acc].[RegularQuery]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [acc].[RegularQuery]
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
/****** Object:  View [acc].[RegularQueryChar]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [acc].[RegularQueryChar]
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
GO
/****** Object:  View [acc].[RegularQueryHeap]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [acc].[RegularQueryHeap]
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
/****** Object:  View [metadata].[Documentation]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
View Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Documentation for database sourced from extended properties

User-Defined Functions, Views Referenced
------------------- 	
none
*/

CREATE VIEW [metadata].[Documentation] 
--SELECT * FROM [metadata].[Documentation] 

AS

SELECT 
[FullName] = 
CASE WHEN propertylevel3name <> '' THEN QUOTENAME(propertylevel3name)+'.' ELSE '' END+
CASE WHEN propertylevel2name <> '' THEN QUOTENAME(propertylevel2name)+'.' ELSE '' END+
QUOTENAME(PropertyLevel1Name) 
,PropertyLevel1Type
 ,PropertyLevel1Name
, PropertyLevel2Type
,PropertyLevel2Name
,PropertyLevel3Type
,PropertyLevel3Name
, DescriptionType
,DescriptionDefinition

FROM 

(

/****************
Database
******************/

SELECT 
'Database' AS PropertyLevel1Type
,DB_NAME() AS PropertyLevel1Name
,'' AS PropertyLevel2Type
,'' AS PropertyLevel2Name
,'' AS PropertyLevel3Type
,'' AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition
FROM sys.extended_properties SEP
WHERE class_desc = N'Database'

UNION

/****************
Schema
******************/

SELECT 
'Schema' AS PropertyLevel1Type
,SCH.name AS PropertyLevel1Name
,'' AS PropertyLevel2Type
,'' AS PropertyLevel2Name
,'' AS PropertyLevel3Type
,'' AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition 
FROM (SELECT * FROM sys.extended_properties WHERE class_desc = N'SCHEMA') AS SEP
  RIGHT OUTER  JOIN sys.schemas SCH
 ON SEP.major_id = SCH.schema_id
 WHERE sch.principal_id = 1

UNION

/****************
Table
******************/

SELECT 
'Table' AS PropertyLevel1Type
,TBL.name AS PropertyLevel1Name
,'Schema' AS PropertyLevel2Type
,SCH.name AS PropertyLevel2Name
,'' AS PropertyLevel3Type
,'' AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition
FROM sys.tables  TBL
  JOIN sys.schemas SCH
 ON TBL.schema_id = SCH.schema_id 
  LEFT OUTER JOIN (SELECT * FROM sys.extended_properties WHERE class = 1 
 AND minor_id = 0
 AND (value <> '1' AND value <> 1)
 ) AS SEP
 ON TBL.object_id = SEP.major_id 

 UNION
 
 /****************
Table Columns
******************/
 
 SELECT 
'Table Column' AS PropertyLevel1Type
,COL.name AS PropertyLevel1Name
,'Table' AS PropertyLevel2Type
,TBL.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition
FROM sys.columns COL
  JOIN sys.tables TBL
 ON col.object_id = TBL.object_id 
  JOIN sys.schemas SCH
 ON TBL.schema_id = SCH.schema_id
 LEFT OUTER JOIN (SELECT * FROM sys.extended_properties WHERE class = 1
 AND (value <> '1' AND value <> 1)) AS SEP
 ON SEP.major_id = COL.object_id 
 AND SEP.minor_id = COL.column_id 

UNION

/****************
View 
******************/
 
SELECT 
'View' AS PropertyLevel1Type
,VIW.name AS PropertyLevel1Name
,'Schema' AS PropertyLevel2Type
,SCH.name AS PropertyLevel2Name
,'' AS PropertyLevel3Type
,'' AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition
FROM sys.views VIW
 JOIN sys.schemas SCH
 ON VIW.schema_id = SCH.schema_id 
LEFT OUTER JOIN (SELECT * FROM sys.extended_properties WHERE minor_id = 0) AS SEP
   ON SEP.major_id = VIW.object_id 
 
 UNION

 /****************
View Columns
******************/
 
 SELECT 
'View Column' AS PropertyLevel1Type
,COL.name AS PropertyLevel1Name
,'View' AS PropertyLevel2Type
,VIW.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition
FROM  sys.columns COL
JOIN sys.views VIW
 ON COL.object_id = VIW.object_id 
JOIN sys.schemas SCH
 ON VIW.schema_id = SCH.schema_id
 LEFT OUTER JOIN  (SELECT * FROM sys.extended_properties WHERE class = 1
 AND (value <> '1' AND value <> 1)) AS SEP
  ON SEP.major_id = COL.object_id 
  AND SEP.minor_id = COL.column_id 
  
 UNION

  /****************
Procedures
******************/

SELECT 
'Procedure' AS PropertyLevel1Type
,PRC.name AS PropertyLevel1Name
,'Schema' AS PropertyLevel2Type
,SCH.name AS PropertyLevel2Name
,'' AS PropertyLevel3Type
,'' AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition 
FROM  sys.procedures PRC
  JOIN sys.schemas SCH
 ON PRC.schema_id = SCH.schema_id 
LEFT OUTER JOIN (SELECT * FROM sys.extended_properties WHERE minor_id = 0) AS SEP
 ON SEP.major_id = PRC.object_id 
 
 UNION

/****************
Primary Keys
******************/

SELECT 
'Primary Key' AS PropertyLevel1Type
,SKC.name AS PropertyLevel1Name
,'Table' AS PropertyLevel2Type
,TBL.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition
FROM sys.tables TBL
 JOIN sys.schemas SCH
 ON TBL.schema_id = SCH.schema_id 
  JOIN sys.key_constraints SKC
 ON TBL.object_id = SKC.parent_object_id 
  LEFT OUTER  JOIN sys.extended_properties SEP
ON SEP.major_id = SKC.object_id 
WHERE SKC.type_desc = N'PRIMARY_KEY_CONSTRAINT'

UNION

/****************
Unique Constraints
******************/

SELECT 
'Unique Constraint' AS PropertyLevel1Type
,SKC.name AS PropertyLevel1Name
,'Table' AS PropertyLevel2Type
,TBL.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition 
FROM sys.tables TBL
  JOIN sys.schemas SCH
 ON TBL.schema_id = SCH.schema_id 
  LEFT OUTER  JOIN (SELECT * FROM sys.extended_properties WHERE (value <> '1' AND value <> 1)) AS SEP
  LEFT OUTER  JOIN sys.key_constraints SKC
 ON SEP.major_id = SKC.object_id 
 ON TBL.object_id = SKC.parent_object_id 
WHERE SKC.type_desc = N'UNIQUE_CONSTRAINT'

UNION
 
/****************
Check Constraints
******************/

SELECT 
'Check Constraint' AS PropertyLevel1Type
,CHK.name AS PropertyLevel1Name
,'Table' AS PropertyLevel2Type
,TBL.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition 
FROM 
sys.check_constraints CHK
JOIN sys.tables TBL ON 
CHK.parent_object_id = TBL.object_id
JOIN sys.schemas SCH ON
SCH.schema_id = TBL.schema_id 
LEFT OUTER JOIN sys.extended_properties SEP
ON SEP.major_id = CHK.object_id 
  
 UNION
 
/****************
Indexes
******************/

SELECT 
'Table Index' AS PropertyLevel1Type
,SIX.name AS PropertyLevel1Name
,'Table' AS PropertyLevel2Type
,TBL.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition 
FROM sys.indexes SIX
  JOIN sys.tables TBL ON
   SIX.object_id = TBL.object_id 
  JOIN sys.schemas SCH
 ON TBL.schema_id = SCH.schema_id 
  LEFT OUTER  JOIN (SELECT * FROM sys.extended_properties WHERE class_desc = N'INDEX' ) AS SEP
 ON SIX.object_id = SEP.major_id 
 AND SIX.index_id = SEP.minor_id 
WHERE  SIX.is_primary_key = 0
AND six.type <> 0

UNION
 
/****************
Foriegn Keys
******************/

SELECT 
'Foreign Key' AS PropertyLevel1Type
,SFK.name AS PropertyLevel1Name 
,'Table' AS PropertyLevel2Type
,TBL.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition 
FROM    sys.foreign_keys SFK
JOIN sys.tables TBL
 ON SFK.parent_object_id = TBL.object_id 
JOIN sys.schemas SCH
 ON TBL.schema_id = SCH.schema_id
LEFT OUTER JOIN sys.extended_properties SEP  ON 
SEP.major_id = SFK.object_id 

 UNION
 
/****************
Defaults
******************/

SELECT 
'Default' AS PropertyLevel1Type
,SDC.name AS PropertyLevel1Name
,'Table' AS PropertyLevel2Type
,TBL.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition 
FROM sys.default_constraints SDC
  JOIN sys.schemas SCH
  JOIN sys.tables TBL
 ON SCH.schema_id = TBL.schema_id 
 ON SDC.parent_object_id = TBL.object_id 
  LEFT OUTER  JOIN sys.extended_properties SEP
 ON SDC.object_id = SEP.major_id
 
 UNION
 
/****************
View Columns
******************/

SELECT 
'View Column' AS PropertyLevel1Type
,COL.name AS PropertyLevel1Name
,'View' AS PropertyLevel2Type
,VIW.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition
FROM  sys.columns COL
  JOIN sys.views VIW
 ON COL.OBJECT_ID = VIW.object_id 
JOIN sys.schemas SCH
 ON VIW.schema_id = SCH.schema_id
 LEFT OUTER JOIN (SELECT * FROM sys.extended_properties WHERE class = 1
 AND (value <> '1' AND value <> 1)) AS SEP
 ON SEP.major_id = COL.object_id 
 AND SEP.minor_id = COL.column_id 
 
 UNION
 
/****************
View Indexes
******************/

 SELECT 
'View Index' AS PropertyLevel1Type
,SIX.name AS PropertyLevel1Name
,'View' AS PropertyLevel2Type
,VIW.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition 
FROM sys.indexes SIX
 JOIN sys.views VIW  ON
SIX.object_id = VIW.object_id 
JOIN sys.schemas SCH ON 
  VIW.schema_id = SCH.schema_id 
LEFT OUTER  JOIN (SELECT * FROM sys.extended_properties WHERE class_desc = N'INDEX') AS  SEP
 ON SIX.object_id = SEP.major_id 
 AND SIX.index_id = SEP.minor_id 
 
 UNION

/****************
Functions
*****************/

SELECT 
'Function' AS PropertyLevel1Type
,SOB.name AS PropertyLevel1Name
,'Schema' AS PropertyLevel2Type
,SCH.name AS PropertyLevel2Name
,'' AS PropertyLevel3Type
,'' AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition
FROM sys.objects SOB
JOIN sys.schemas SCH
ON SOB.schema_id = SCH.schema_id 
LEFT OUTER JOIN (SELECT * FROM sys.extended_properties  WHERE minor_id = 0) AS SEP
ON SEP.major_id = SOB.object_id 
WHERE SOB.type_desc LIKE N'%FUNCTION%' 

UNION

/****************
Function Parameters
******************/

 SELECT 
'Function Parameter' AS PropertyLevel1Type
,PRM.name AS PropertyLevel1Name
,'Function' AS PropertyLevel2Type
,OBJ.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition 
FROM sys.objects OBJ
  JOIN sys.schemas SCH ON 
  OBJ.schema_id = SCH.schema_id 
JOIN sys.parameters PRM ON 
PRM.object_id = obj.object_id 
LEFT OUTER JOIN (SELECT * FROM sys.extended_properties  WHERE class_desc = N'PARAMETER') AS SEP  ON 
SEP.major_id = PRM.object_id 
 AND SEP.minor_id = PRM.parameter_id 
WHERE OBJ.type IN ('FN', 'IF', 'TF') 

UNION
 
/****************
Procedure Parameters
******************/

 SELECT 
'Procedure Parameter' AS PropertyLevel1Type
,spa.name AS PropertyLevel1Name
,'Procedure' AS PropertyLevel2Type
,SPR.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition

FROM sys.procedures spr
 JOIN sys.schemas SCH
 ON SPR.schema_id = SCH.schema_id 
 JOIN sys.parameters spa
 ON spr.object_id = spa.object_id 
 LEFT OUTER JOIN 
(SELECT * FROM sys.extended_properties WHERE class_desc = N'PARAMETER') SEP
 ON SEP.major_id = SPR.object_id 
 AND SEP.minor_id = spa.parameter_id
 
 UNION

/****************
DDL Triggers
******************/

SELECT 
'DDL Trigger' AS PropertyLevel1Type
,TRG.name AS PropertyLevel1Name
,'' AS PropertyLevel2Type
,'' AS PropertyLevel2Name
,'' AS PropertyLevel3Type
,'' AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition 
FROM sys.extended_properties SEP
  RIGHT OUTER  JOIN sys.triggers TRG
 ON SEP.major_id = TRG.object_id
WHERE TRG.parent_class_desc = N'DATABASE'

UNION

/****************
Table Triggers
******************/

SELECT 
'Table Trigger' AS PropertyLevel1Type
,TRG.name AS PropertyLevel3Name
,'Table' AS PropertyLevel2Type
,TBL.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel1Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition 
FROM sys.tables TBL
  JOIN sys.triggers TRG
 ON TBL.object_id = TRG.parent_id 
  LEFT OUTER  JOIN sys.extended_properties SEP
 ON TRG.object_id = SEP.major_id 
   JOIN sys.schemas SCH
 ON TBL.schema_id = SCH.schema_id
 
 UNION
 
 /****************
View Triggers
******************/

 SELECT 
'View Trigger' AS PropertyLevel1Type
,TRG.name AS PropertyLevel1Name
,'View' AS PropertyLevel2Type
,VIW.name AS PropertyLevel2Name
,'Schema' AS PropertyLevel3Type
,SCH.name AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition
FROM sys.views VIW
  JOIN sys.triggers TRG
 ON VIW.object_id = TRG.parent_id 
  LEFT OUTER  JOIN sys.extended_properties SEP
 ON TRG.object_id = SEP.major_id 
  JOIN sys.schemas SCH
 ON VIW.schema_id = SCH.schema_id
 
 UNION
 
  /****************
PArtition Functions
******************/

SELECT 
'Partition Function' AS PropertyLevel1Type
,PFN.name AS PropertyLevel1Name
,'' AS PropertyLevel2Type
,'' AS PropertyLevel2Name
,'' AS PropertyLevel3Type
,'' AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition 
FROM sys.partition_functions PFN
 LEFT  OUTER  JOIN  sys.extended_properties SEP ON 
 SEP.major_id = PFN.function_id
 
 UNION

  /****************
PArtition Scheme
******************/

SELECT 
'Partition Scheme' AS PropertyLevel1Type
,PSC.name AS PropertyLevel1Name
,'' AS PropertyLevel2Type
,'' AS PropertyLevel2Name
,'' AS PropertyLevel3Type
,'' AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition
FROM sys.partition_schemes PSC
  LEFT OUTER  JOIN sys.extended_properties SEP
 ON SEP.major_id = PSC.function_id
 
 UNION
 
/****************
FileGroups
******************/
 
 SELECT 
'Filegroup' AS PropertyLevel1Type
,DSP.name AS PropertyLevel1Name
,'' AS PropertyLevel2Type
,'' AS PropertyLevel2Name
,'' AS PropertyLevel3Type
,'' AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition
FROM sys.data_spaces DSP
 LEFT OUTER JOIN 
 (SELECT * FROM  sys.extended_properties WHERE class_desc = 'DATASPACE') AS SEP
 ON SEP.major_id = DSP.data_space_id
 
 UNION

/****************
FileGroup and Logical File
******************/
 
SELECT 
'File' AS PropertyLevel1Type
,DBF.name AS PropertyLevel1Name
,'Filegroup' AS PropertyLevel2Type
,DSP.name AS PropertyLevel2Name
,'' AS PropertyLevel3Type
,'' AS PropertyLevel3Name
,SEP.name AS DescriptionType
,SEP.value AS DescriptionDefinition 
FROM sys.database_files DBF
 JOIN sys.data_spaces DSP
 ON DBF.data_space_id = DSP.data_space_id 
 LEFT OUTER JOIN (SELECT * FROM  sys.extended_properties WHERE class_desc = N'DATASPACE') AS SEP  ON 
 SEP.major_id = DSP.data_space_id

) AS t


GO
/****** Object:  View [metadata].[FileGroupSpace]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
View Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Space available and remaining in files and filegroups of database

User-Defined Functions, Views Referenced
------------------- 	
none
*/

CREATE VIEW [metadata].[FileGroupSpace]
--SELECT * FROM  [metadata].[FileGroupSpace]
--DROP VIEW  [metadata].[FileGroupSpace]

AS

SELECT 
b.groupname AS 'File Group', 
Name,    
[Filename],   
CONVERT (Decimal(15,2),ROUND(a.Size/128.000,2))      
[Currently Allocated Space (MB)],    
CONVERT (Decimal(15,2),   
ROUND(FILEPROPERTY(a.Name,'SpaceUsed')/128.000,2))        
AS [Space Used (MB)],   
CONVERT (Decimal(15,2),    
ROUND((a.Size-FILEPROPERTY(a.Name,'SpaceUsed'))/128.000,2))         
AS [Available Space (MB)] 

FROM dbo.sysfiles a (NOLOCK) 
JOIN sysfilegroups b (NOLOCK) ON a.groupid = b.groupid 


GO
/****** Object:  View [metadata].[FilegroupSpaceObjectIndexDetails]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/*
View Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Returns Filegroup Space Object Index Details

Parameters
------------------
none

Depends On
------------------
none
*/

CREATE VIEW [metadata].[FilegroupSpaceObjectIndexDetails]
--SELECT * FROM  [metadata].[FilegroupSpaceObjectIndexDetails]
--DROP VIEW  [metadata].[FilegroupSpaceObjectIndexDetails]

AS

SELECT 
[FilegroupName] = DS.name 
      ,[AllocationDesc] = AU.type_desc 
      ,[TotalSizeMB] = AU.total_pages / 128  
      ,[UsedSizeMB] = AU.used_pages / 128 
      ,[DataSizeMB] = AU.data_pages / 128 
      ,[SchemaName] = SCH.name 
      ,[ObjectType] = OBJ.type_desc     
      ,[ObjectName] = OBJ.name 
      ,[IndexType] = IDX.type_desc 
      ,[IndexName] = IDX.name 
		
FROM sys.data_spaces AS DS 
     INNER JOIN sys.allocation_units AS AU 
         ON DS.data_space_id = AU.data_space_id 
     INNER JOIN sys.partitions AS PA 
         ON (AU.type IN (1, 3)  
             AND AU.container_id = PA.hobt_id) 
            OR 
            (AU.type = 2 
             AND AU.container_id = PA.partition_id) 
     INNER JOIN sys.objects AS OBJ 
         ON PA.object_id = OBJ.object_id 
     INNER JOIN sys.schemas AS SCH 
         ON OBJ.schema_id = SCH.schema_id 
     LEFT JOIN sys.indexes AS IDX 

         ON PA.object_id = IDX.object_id 
            AND PA.index_id = IDX.index_id 
            

GO
/****** Object:  View [metadata].[IdentityColumns]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




/*
View Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Returns list of identity columns
Parameters
------------------
none

Depends On
------------------
none
*/

CREATE VIEW [metadata].[IdentityColumns]
--SELECT * FROM [metadata].[IdentityColumns]
--DROP VIEW  [metadata].[IdentityColumns]

AS

SELECT 
c.Table_Schema
, c.Table_Name
, c.Column_Name
FROM INFORMATION_SCHEMA.COLUMNS c
JOIN INFORMATION_SCHEMA.TABLES t ON
t.TABLE_NAME = c.TABLE_NAME
WHERE COLUMNPROPERTY(OBJECT_ID(c.table_schema+'.'+c.table_name), c.column_name,'IsIdentity')  = 1
AND t.TABLE_TYPE = 'BASE TABLE'



GO
/****** Object:  View [metadata].[IndexColumns]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
View Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Returns index details to the column level

Parameters
------------------
none

Depends On
------------------
none
*/

CREATE VIEW [metadata].[IndexColumns]
--SELECT * FROM [metadata].[IndexColumns]
--DROP VIEW [metadata].[IndexColumns]

AS

SELECT 
[Table_Schema] = s.name
,[Table_Name] = o.name
,[Column_Name] = c.name
,[Included_Column] = ic.is_included_column
,[Index_Name] = i.name
,[Column_DataType] = t.name
,[Column_Position_Index] = ic.key_ordinal

FROM sys.indexes i
JOIN sys.objects o ON 
O.object_id = I.object_id
JOIN sys.schemas s ON
s.schema_id = o.schema_id
JOIN sys.index_columns ic ON
ic.index_id = i.index_id
AND ic.object_id = i.object_id
JOIN sys.columns c ON
c.column_id = ic.column_id
AND c.object_id = o.object_id
JOIN sys.types t ON
T.system_type_id = c.system_type_id


GO
/****** Object:  View [metadata].[ViewSourceColumns]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
View Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: View source columns and tables

User-Defined Functions, Views Referenced
------------------- 	
none
*/

CREATE VIEW [metadata].[ViewSourceColumns] 
--DROP VIEW  [metadata].[ViewSourceColumns] 
AS

SELECT 
ViewSchema = v.TABLE_SCHEMA
,ViewName = v.TABLE_NAME
,ViewColumn = v.COLUMN_NAME
,TableSchema = cu.TABLE_SCHEMA
,TableName = cu.TABLE_NAME
,TableColumn = ep.value
 FROM INFORMATION_SCHEMA.COLUMNS v
 JOIN INFORMATION_SCHEMA.TABLES t ON
 t.TABLE_NAME = v.TABLE_NAME
 AND t.TABLE_SCHEMA = v.TABLE_SCHEMA
 LEFT OUTER JOIN SYS.EXTENDED_PROPERTIES ep ON
ep.major_id = OBJECT_ID(v.TABLE_SCHEMA+'.'+v.TABLE_NAME)
AND ep.minor_id = COLUMNPROPERTY(OBJECT_ID(v.TABLE_SCHEMA+'.'+v.TABLE_NAME)
,v.COLUMN_NAME,'ColumnId')
AND ep.name = 'column source'
LEFT OUTER JOIN INFORMATION_SCHEMA.VIEW_COLUMN_USAGE AS cu ON
cu.VIEW_NAME = v.TABLE_NAME
AND cu.VIEW_SCHEMA = v.TABLE_SCHEMA
AND cu.COLUMN_NAME = ep.value
WHERE t.TABLE_TYPE = 'view'


GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ncidx_DimDateChar_Filter_CalendarMonthNoChar_Inclusions]    Script Date: 25/02/2015 19:56:56 ******/
CREATE NONCLUSTERED INDEX [ncidx_DimDateChar_Filter_CalendarMonthNoChar_Inclusions] ON [import].[DimDateChar]
(
	[CalendarMonthNoChar] ASC
)
INCLUDE ( 	[DayOfWeekName],
	[DayOfMonthNo],
	[CalendarYear],
	[MonthOfYearName]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [IndexDemo]
GO
/****** Object:  StoredProcedure [admin].[pr_MaintenanceIndexStats]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Stored Procedure Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Updates indexes and statistics

Parameters
------------------
none

User-Defined Functions, Views Referenced
------------------- 	
none
*/

CREATE PROCEDURE [admin].[pr_MaintenanceIndexStats] 
--EXEC [admin].[pr_MaintenanceIndexStats] 
--DROP PROCEDURE [admin].[pr_MaintenanceIndexStats] 

AS

SET NOCOUNT ON

/**************************************************
Rebuild or ReOrganise Required Indexes
and then Update Remaining Statistics
***************************************************/

/*
1.0 Set Database 
*/
DECLARE @db SYSNAME = (SELECT DB_NAME())

/*
2.0 Get Required Information
*/
SELECT 
[Table Name] = sc.name+'.'+t.name
,[Index Type] = CAST(index_type_desc AS VARCHAR(20))
,[Index Name] =  I.Name
,[Avg % Fragmentation] = avg_fragmentation_in_percent
,[RecordCount] =  record_count
,[Pages Allocated] =  page_count
,[Avg % Page Space Used] = avg_page_space_used_in_percent
,[SQL] = CASE WHEN  
 avg_fragmentation_in_percent > 15 OR
avg_page_space_used_in_percent < 60 THEN 
'ALTER INDEX '+ISNULL(i.name,'ALL')+' ON '
+QUOTENAME(sc.name)+'.'+QUOTENAME(t.name)+' REBUILD'
 WHEN
 avg_fragmentation_in_percent BETWEEN 10 AND 15
OR avg_page_space_used_in_percent BETWEEN 60 AND 75 THEN 
'ALTER INDEX '+ISNULL(i.name,'ALL')+' ON '
+QUOTENAME(sc.name)+'.'+QUOTENAME(t.name)+' REORGANIZE'
ELSE '' END 
INTO #temp
--DROP TABLE #temp
--SELECT * FROM #temp
FROM 
sys.dm_db_index_physical_stats (DB_ID(@db),NULL,NULL,NULL,'DETAILED' ) S
LEFT OUTER JOIN sys.indexes I On (I.Object_ID = S.Object_ID and I.Index_ID = S.Index_ID)
LEFT OUTER JOIN sys.tables t On (t.Object_ID = S.Object_ID)
LEFT OUTER JOIN sys.schemas sc ON (sc.schema_id = t.schema_id)
AND S.INDEX_ID <> 0
AND CAST(avg_fragmentation_in_percent AS INT) > 0.15
ORDER BY avg_fragmentation_in_percent DESC

/*
3.0 Create Dynamic Loop for SQL Creation
*/
DECLARE @sql NVARCHAR(MAX)
SET @sql = ''
SELECT @sql = @sql + ISNULL(sql,'') FROM #temp 

/*
4.0 Execute SQL for Index Rebuild and Reorganisation
*/
EXEC SP_EXECUTESQL @sql

/*
5.0 Update Remaining Stats
*/
EXEC SP_UPDATESTATS

GO
/****** Object:  StoredProcedure [admin].[pr_SecurityAll]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
Stored Procedure Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Performs complete security refresh using all admin.pr_Security... procedures

Parameters
------------------
none

User-Defined Functions, Views Referenced
------------------- 	
none
*/

CREATE PROCEDURE [admin].[pr_SecurityAll] 
--DROP PROCEDURE [admin].[pr_SecurityAll] 
--EXEC [admin].[pr_SecurityAll] 

AS

SET NOCOUNT ON

/*
1.0 Performs Deny to PII Access
*/
EXEC [admin].[pr_SecurityDenyPII] 

/*
2.0 Grants Roles to Schema Access
*/

DECLARE @sql VARCHAR(MAX) = ''

SELECT 
@sql = @sql+'EXEC [admin].[pr_SecurityRoleGrant]  '''+s.name+''','''+u.name+''''+CHAR(10)
FROM sys.schemas s
JOIN sys.sysusers u ON 
u.name = s.name
JOIN sys.database_principals dp ON s.name = dp.name WHERE u.issqlrole = 1 AND s.principal_id = 1 AND s.name <> 'dbo' AND is_fixed_role = 0

PRINT @sql
EXEC(@SQL)


GO
/****** Object:  StoredProcedure [admin].[pr_SecurityDenyPII]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Stored Procedure Details
------------------
Creator				:  Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Denies access to Personal Identifiable Information (PII) columns to the DenyPII Role

Parameters
------------------
none

User-Defined Functions, Views Referenced
------------------- 	
none
*/

CREATE PROCEDURE [admin].[pr_SecurityDenyPII] 
--DROP PROCEDURE [admin].[pr_SecurityDenyPII] 
--EXEC [admin].[pr_SecurityDenyPII] 

AS

SET NOCOUNT ON

/*
1.0 Declare SQL Variable
*/
DECLARE @sql VARCHAR(MAX) = ''

/*
2.0 Generate DENY statement to DenyPII role from metadata.Documentation view
*/
--2.1 Deny on PII = Y
SELECT 
@sql = @sql+'DENY SELECT ON ['+PropertyLevel3Name+'].['+PropertyLevel2Name+']('+PropertyLevel1Name+')  TO DenyPII'+CHAR(10)
 FROM metadata.Documentation
WHERE DescriptionType = 'PII'
AND DescriptionDefinition = 'Y'
--2.2 Revoke Denied where currently denied and PII is now Y
SELECT 
@sql = @sql+'REVOKE SELECT ON ['+s.name+'].['+t.name+'] (['+c.name+']) TO [DenyPII]'+CHAR(10)
--permission_name, state_desc, type_desc, U.name, OBJECT_NAME(major_id) , c.name
FROM sys.database_permissions P 
JOIN sys.objects T ON P.major_id = T.object_id 
JOIN sysusers U ON U.uid = P.grantee_principal_id
JOIN sys.schemas s ON s.schema_id = t.schema_id
JOIN sys.columns c ON c.column_id = p.minor_id AND c.object_id = t.object_id
JOIN metadata.Documentation d ON 
d.PropertyLevel3Name = s.name 
AND d.PropertyLevel2Name = t.name
AND d.PropertyLevel1Name = c.name
WHERE u.name = 'denypii'
AND p.state_desc = 'DENY'
AND d.DescriptionType = 'PII'
AND d.DescriptionDefinition = 'N'

/*
3.0 Print and Execute
*/
PRINT @sql
EXEC(@sql)


GO
/****** Object:  StoredProcedure [admin].[pr_SecurityRoleGrant]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Stored Procedure Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Updates security for role specified to schema (view, select and execute permissions granted)

Parameters
------------------
@role				: Role to update
@schema				: Schema they will have permissions (view, select and execute)

User-Defined Functions, Views Referenced
------------------- 	
none
*/

CREATE PROCEDURE [admin].[pr_SecurityRoleGrant] 
@role VARCHAR(255), @schema VARCHAR(255)
--DROP PROCEDURE [admin].[pr_SecurityRoleGrant]  
--EXEC [admin].[pr_SecurityRoleGrant]  'IndexDemo','IndexDemo'

AS

SET NOCOUNT ON

/************************************************
1.0 Create Table
*************************************************/

DECLARE @table TABLE
(
[ID] INT IDENTITY,
[schema] VARCHAR(255),
[Object] VARCHAR(255),
[Type] VARCHAR(255)
)

/************************************************
2.0 Insert Objects into Table
*************************************************/

INSERT INTO @table
(
[schema],Object, type
)
SELECT 
[Schema] = table_schema
, [Object] = TABLE_NAME
, [Type] = 'table'
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = @schema
UNION
SELECT 
[Schema] = routine_schema
, ROUTINE_NAME, 
CASE WHEN data_type = 'table' THEN 'table' ELSE 'Procedure' END 
FROM INFORMATION_SCHEMA.ROUTINES 
WHERE ROUTINE_SCHEMA = @SCHEMA

/************************************************
3.0 Declare Variables
*************************************************/

DECLARE @sql NVARCHAR(MAX) = ''

/************************************************
4.0 Generate SQL
*************************************************/

SELECT 
@sql = @sql +ISNULL(' GRANT VIEW DEFINITION ON ['+[schema]+'].['+[object]+'] TO ['+@role+']'+CHAR(13)+ CASE 
WHEN Type = 'Table' THEN ' GRANT SELECT ON ['+[schema]+'].['+[object]+'] TO ['+@role+']'+CHAR(13)
WHEN Type = 'Procedure' THEN ' GRANT EXECUTE ON ['+[schema]+'].['+[object]+'] TO ['+@role+']'+CHAR(13)
END,'')
FROM @table

/************************************************
5.0 Grant Standard DB Permissions
*************************************************/

SET @sql = @sql+CHAR(13)+
'GRANT SHOWPLAN TO '+@role+CHAR(13)

/************************************************
6.0 Execute
*************************************************/
PRINT @sql
EXEC sp_executesql @sql

GO
/****** Object:  StoredProcedure [tools].[pr_PrintMax]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
Function Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Allows Printing of Varchar (max) dynamic variables
Parameters
------------------
@iinput				: Item to be printed

Depends On
------------------
none
*/

CREATE PROCEDURE [tools].[pr_PrintMax]
--DROP PROCEDURE [tools].[pr_PrintMax]
--EXEC [tools].[pr_PrintMax]
(
 @iInput NVARCHAR(MAX)
)
AS
BEGIN
 -- nothing we can do with null data
 IF (@iInput IS NULL) BEGIN
  RETURN;
 END;

 -- This procedure was created to properly print
 -- nvarchar(max) since the print statement can
 -- only handle NVARCHAR(4000), we break the
 -- input down into 4000 byte blocks and print
 -- upto the last linebreak before the 4000 byte cutoff
 DECLARE @ReversedData NVARCHAR(MAX)
  ,@LineBreakIndex INT
  ,@SearchLength INT;

 -- if the search length is less than the first occurance
 -- of a line break, the data will be printed with a line break
 -- at the SearchLength position even though there should not be
 -- a break in the data there.
 SET @SearchLength = 4000;

 -- only loop while the input is greater than the search length
 WHILE (LEN(@iInput) > @SearchLength) BEGIN
  -- obtain and reverse the input upto the search length
  SET @ReversedData = LEFT(@iInput, @SearchLength);
  SET @ReversedData = REVERSE(@ReversedData);

  -- determine the position of the first line break for this piece of data
  SET @LineBreakIndex = CHARINDEX(CHAR(10) + CHAR(13), @ReversedData);

  -- print the input only showing data upto the line break
  -- the original linebreak will not be displayed
  PRINT LEFT(@iInput, @SearchLength - @LineBreakIndex + 1);

  -- resize the input removing the data that was displayed and the line break.
  SET @iInput = RIGHT(@iInput, LEN(@iInput) - @SearchLength + @LineBreakIndex - 1);
 END;

 -- if there is any data remaining, print it
 IF (LEN(@iInput) > 0) BEGIN
  PRINT @iInput;
 END;
END;



GO
/****** Object:  DdlTrigger [tr_ddl_IndexDemo]    Script Date: 25/02/2015 19:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Trigger Details
------------------
Creator				: Richard Griffiths
Last Modified Date	: Feb 24 2015  4:04PM
Details				: Captures DDL Changes for IndexDemo Database

User-Defined Functions, SPS, Views Referenced
------------------- 	
none
*/

CREATE TRIGGER [tr_ddl_IndexDemo]
--DROP TRIGGER [tr_ddl_IndexDemo]

ON DATABASE

FOR DDL_DATABASE_LEVEL_EVENTS

AS

BEGIN   

SET NOCOUNT ON 
/*****************************************
Declare Variables
******************************************/  
DECLARE @data XML
DECLARE @cmd NVARCHAR(MAX)
DECLARE @dt NVARCHAR(24)
DECLARE @spid NVARCHAR(50)
DECLARE @login NVARCHAR(100)
DECLARE @host NVARCHAR(100)
DECLARE @object_name NVARCHAR(255)
DECLARE @object_type NVARCHAR(50)
DECLARE @cmd_type NVARCHAR(50)
DECLARE @schema NVARCHAR(20)
DECLARE @user NVARCHAR(100)
DECLARE @db NVARCHAR(100)
--DECLARE @object_id NVARCHAR(50)

/*****************************************
Capture Event Data
******************************************/
SET @data = EVENTDATA()
--Command
SET @cmd = @data.value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'NVARCHAR(1000)')
SET @cmd = LTRIM(RTRIM(REPLACE(@cmd,'','')))
--Date Actioned
SET @dt= @data.value('(/EVENT_INSTANCE/PostTime)[1]', 'NVARCHAR(24)')
--SPID
SET @spid = @data.value('(/EVENT_INSTANCE/SPID)[1]', 'nvarchar(6)')
--Login
SET @login= @data.value('(/EVENT_INSTANCE/LoginName)[1]','NVARCHAR(100)')
--Host
SET @host= HOST_NAME()
--Object Name
SET @object_name = @data.value('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(100)') 
--Object Type
SET @object_type = @data.value('(/EVENT_INSTANCE/ObjectType)[1]','nvarchar(100)') 
--Command Type
SET @cmd_type = @data.value('(/EVENT_INSTANCE/EventType)[1]','nvarchar(100)') 
--schema
SET @schema = @data.value('(/EVENT_INSTANCE/SchemaName)[1]','nvarchar(100)') 
--user
SET @user = @data.value('(/EVENT_INSTANCE/UserName)[1]','nvarchar(100)') 
--databse name
SET @db = @data.value('(/EVENT_INSTANCE/DatabaseName)[1]','nvarchar(100)') 
--databse name

INSERT INTO metadata.AuditDatabaseDDL
([dt] ,[db] ,[SchemaName] ,[ObjectType] ,[ObjectName] ,[ObjectID] 
,[Command],[CommandType] ,[LoginName] ,[UserName] ,[HostName] 
)
 VALUES
 (
 @dt ,@db ,@schema ,@object_type ,@object_name, OBJECT_ID(@schema+'.'+@object_name)
 ,@cmd ,@cmd_type ,@login ,@user,@host 
)

END


GO
ENABLE TRIGGER [tr_ddl_IndexDemo] ON DATABASE
GO
EXEC [IndexDemo].sys.sp_addextendedproperty @name=N'Overview', @value=N'Index demonstration' 
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the role that has rights on the tools schema' , @level0type=N'USER',@level0name=N'tools'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the role that has rights on the metadata schema' , @level0type=N'USER',@level0name=N'metadata'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the role that has rights on the import schema' , @level0type=N'USER',@level0name=N'import'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the role that has rights on the export schema' , @level0type=N'USER',@level0name=N'export'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the role that denies access to columns indentified as PII' , @level0type=N'USER',@level0name=N'DenyPII'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the role that has rights on the app schema. These objects intended to be available for applications.' , @level0type=N'USER',@level0name=N'app'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the role that has rights on the admin schema' , @level0type=N'USER',@level0name=N'admin'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the role that has rights on the acc schema. These are standard user accessible objects.' , @level0type=N'USER',@level0name=N'acc'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Updates indexes and statistics. This task is resource intensive' , @level0type=N'SCHEMA',@level0name=N'admin', @level1type=N'PROCEDURE',@level1name=N'pr_MaintenanceIndexStats'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Performs complete security refresh using all admin.pr_Security... procedures' , @level0type=N'SCHEMA',@level0name=N'admin', @level1type=N'PROCEDURE',@level1name=N'pr_SecurityAll'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Denies access to Personal Identifiable Information (PII) columns to the DenyPII Role' , @level0type=N'SCHEMA',@level0name=N'admin', @level1type=N'PROCEDURE',@level1name=N'pr_SecurityDenyPII'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Updates security for role specified to schema (view, select and execute permissions granted).' , @level0type=N'SCHEMA',@level0name=N'admin', @level1type=N'PROCEDURE',@level1name=N'pr_SecurityRoleGrant'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Role to grant schema access to.' , @level0type=N'SCHEMA',@level0name=N'admin', @level1type=N'PROCEDURE',@level1name=N'pr_SecurityRoleGrant', @level2type=N'PARAMETER',@level2name=N'@role'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Schema to grant role access to.' , @level0type=N'SCHEMA',@level0name=N'admin', @level1type=N'PROCEDURE',@level1name=N'pr_SecurityRoleGrant', @level2type=N'PARAMETER',@level2name=N'@schema'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Allows printing of larger string lengths then standard print' , @level0type=N'SCHEMA',@level0name=N'tools', @level1type=N'PROCEDURE',@level1name=N'pr_PrintMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'String to be printed' , @level0type=N'SCHEMA',@level0name=N'tools', @level1type=N'PROCEDURE',@level1name=N'pr_PrintMax', @level2type=N'PARAMETER',@level2name=N'@iInput'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Returns table of views with the source objects in a single line' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'FUNCTION',@level1name=N'fu_ViewTableSource'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Schema of table' , @level0type=N'SCHEMA',@level0name=N'tools', @level1type=N'FUNCTION',@level1name=N'fu_SelectList', @level2type=N'PARAMETER',@level2name=N'@schema'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Name of table' , @level0type=N'SCHEMA',@level0name=N'tools', @level1type=N'FUNCTION',@level1name=N'fu_SelectList', @level2type=N'PARAMETER',@level2name=N'@table'
GO
EXEC sys.sp_addextendedproperty @name=N'Category', @value=N'Tool' , @level0type=N'SCHEMA',@level0name=N'tools', @level1type=N'FUNCTION',@level1name=N'fu_SelectList'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Returns comma seperated string list of columns for a table' , @level0type=N'SCHEMA',@level0name=N'tools', @level1type=N'FUNCTION',@level1name=N'fu_SelectList'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'If populated then provides row count for that table or if blank or null returns table count for all tables in database' , @level0type=N'SCHEMA',@level0name=N'tools', @level1type=N'FUNCTION',@level1name=N'fu_TableCount', @level2type=N'PARAMETER',@level2name=N'@table'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Fast table counts for tables.' , @level0type=N'SCHEMA',@level0name=N'tools', @level1type=N'FUNCTION',@level1name=N'fu_TableCount'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Tracks any data definition changes in the database and inserts them into AuditDatabaseDDL table' , @level0type=N'TRIGGER',@level0name=N'tr_ddl_IndexDemo'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the acc schema to group acc objects. These are standard user accessible objects.' , @level0type=N'SCHEMA',@level0name=N'acc'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the admin schema to group admin objects' , @level0type=N'SCHEMA',@level0name=N'admin'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the app schema to group app objects. These are objects intended to be available for applications.' , @level0type=N'SCHEMA',@level0name=N'app'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the export schema to group objects that are in volved in exporting' , @level0type=N'SCHEMA',@level0name=N'export'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the import schema to group objects that are involved in importing' , @level0type=N'SCHEMA',@level0name=N'import'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the metadata schema to group metadata objects' , @level0type=N'SCHEMA',@level0name=N'metadata'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'This is the tools schema to group tools objects' , @level0type=N'SCHEMA',@level0name=N'tools'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Prmary key identity column for AuditDatabaseDDL table' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Date DDL change occured' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL', @level2type=N'COLUMN',@level2name=N'dt'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Database DDL change occured in' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL', @level2type=N'COLUMN',@level2name=N'db'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Schema DDL change occured in' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL', @level2type=N'COLUMN',@level2name=N'SchemaName'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Type of object the DDL change occured on' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL', @level2type=N'COLUMN',@level2name=N'ObjectType'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Name of object the DDL change occured on' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL', @level2type=N'COLUMN',@level2name=N'ObjectName'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'ID of object the DDL change occured on' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL', @level2type=N'COLUMN',@level2name=N'ObjectID'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'DDL Command executed' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL', @level2type=N'COLUMN',@level2name=N'Command'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Type of DDL Command executed' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL', @level2type=N'COLUMN',@level2name=N'CommandType'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Login of the DDL command executor' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL', @level2type=N'COLUMN',@level2name=N'LoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Username of the DDL command executor' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Computer from which DDL command was executed' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL', @level2type=N'COLUMN',@level2name=N'HostName'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Table holds data definition change audit populated from trigger tr_ddl' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Primary key index on id column of AuditDatabaseDDL table' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'TABLE',@level1name=N'AuditDatabaseDDL', @level2type=N'CONSTRAINT',@level2name=N'PK_AuditDatabaseDDL'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'The full path of the database object' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'Documentation', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Type of database object' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'Documentation', @level2type=N'COLUMN',@level2name=N'PropertyLevel1Type'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Name of database object' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'Documentation', @level2type=N'COLUMN',@level2name=N'PropertyLevel1Name'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Type of database object' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'Documentation', @level2type=N'COLUMN',@level2name=N'PropertyLevel2Type'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Name of database object' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'Documentation', @level2type=N'COLUMN',@level2name=N'PropertyLevel2Name'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Type of database object' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'Documentation', @level2type=N'COLUMN',@level2name=N'PropertyLevel3Type'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Name of database object' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'Documentation', @level2type=N'COLUMN',@level2name=N'PropertyLevel3Name'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'The type of metadata held' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'Documentation', @level2type=N'COLUMN',@level2name=N'DescriptionType'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'The value of the metadata held' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'Documentation', @level2type=N'COLUMN',@level2name=N'DescriptionDefinition'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Documentation for database sourced from extended properties' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'Documentation'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Name of database filegroup' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FileGroupSpace', @level2type=N'COLUMN',@level2name=N'File Group'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Logical name of file' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FileGroupSpace', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Physical path of file' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FileGroupSpace', @level2type=N'COLUMN',@level2name=N'Filename'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Space allocated to file' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FileGroupSpace', @level2type=N'COLUMN',@level2name=N'Currently Allocated Space (MB)'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Space used in file' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FileGroupSpace', @level2type=N'COLUMN',@level2name=N'Space Used (MB)'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Space available in file' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FileGroupSpace', @level2type=N'COLUMN',@level2name=N'Available Space (MB)'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Space available and remaining in files and filegroups of database' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FileGroupSpace'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Name of database filegroup' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FilegroupSpaceObjectIndexDetails', @level2type=N'COLUMN',@level2name=N'FilegroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'The description of the space allocation' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FilegroupSpaceObjectIndexDetails', @level2type=N'COLUMN',@level2name=N'AllocationDesc'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Total size in megabytes' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FilegroupSpaceObjectIndexDetails', @level2type=N'COLUMN',@level2name=N'TotalSizeMB'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Used size in megabytes' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FilegroupSpaceObjectIndexDetails', @level2type=N'COLUMN',@level2name=N'UsedSizeMB'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Data size in megabytes' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FilegroupSpaceObjectIndexDetails', @level2type=N'COLUMN',@level2name=N'DataSizeMB'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'The object schema name' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FilegroupSpaceObjectIndexDetails', @level2type=N'COLUMN',@level2name=N'SchemaName'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'The type of object' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FilegroupSpaceObjectIndexDetails', @level2type=N'COLUMN',@level2name=N'ObjectType'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'The name of the object' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FilegroupSpaceObjectIndexDetails', @level2type=N'COLUMN',@level2name=N'ObjectName'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'The type of index' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FilegroupSpaceObjectIndexDetails', @level2type=N'COLUMN',@level2name=N'IndexType'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'The name of the index' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FilegroupSpaceObjectIndexDetails', @level2type=N'COLUMN',@level2name=N'IndexName'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Space used by objects and their indexes on filegroups' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'FilegroupSpaceObjectIndexDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Returns list of identity columns' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'IdentityColumns'
GO
EXEC sys.sp_addextendedproperty @name=N'Overview', @value=N'Returns column indexes and additional index related metadata' , @level0type=N'SCHEMA',@level0name=N'metadata', @level1type=N'VIEW',@level1name=N'IndexColumns'
GO
USE [master]
GO
ALTER DATABASE [IndexDemo] SET  READ_WRITE 
GO
