USE [IndexDemo]
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_DimDate_Filter_CalendarMonthNo'
AND object_id = OBJECT_ID('import.DimDate'))
	DROP INDEX [ncidx_DimDate_Filter_CalendarMonthNo] ON import.DimDate;

CREATE NONCLUSTERED INDEX [ncidx_DimDate_Filter_CalendarMonthNo] ON [import].[DimDate]
([CalendarMonthNo] ASC)
INCLUDE ( 	[DayOfWeekName],[DayOfMonthNo],[MonthOfYearName],[CalendarYear]) 
GO


