USE [IndexDemo]
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_FactTest_DateKey'
AND object_id = OBJECT_ID('import.FactTest'))
	DROP INDEX [ncidx_FactTest_DateKey] ON import.FactTest;

CREATE NONCLUSTERED INDEX [ncidx_FactTest_DateKey] ON [import].[FactTest]
([DateKey] ASC)
INCLUDE ( 	[CountTest],[AmountTest])
GO


