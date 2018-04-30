USE [IndexDemo]
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_DimDate_Filter_CalendarMonthNo'
AND object_id = OBJECT_ID('import.DimDate'))
	DROP INDEX [ncidx_DimDate_Filter_CalendarMonthNo] ON import.DimDate;

	IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_FactTest_DateKey'
AND object_id = OBJECT_ID('import.FactTest'))
	DROP INDEX [ncidx_FactTest_DateKey] ON import.[FactTest];

	IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_FactTest_TestKey'
AND object_id = OBJECT_ID('import.FactTest'))
	DROP INDEX [ncidx_FactTest_TestKey] ON import.FactTest;

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_DimTest_Filter_TestValueCategory'
AND object_id = OBJECT_ID('import.DimTest'))
	DROP INDEX [ncidx_DimTest_Filter_TestValueCategory] ON import.DimTest;






