USE [IndexDemo]
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE name = 'ncidx_FactTest_TestKey'
AND object_id = OBJECT_ID('import.FactTest'))
	DROP INDEX [ncidx_FactTest_TestKey] ON import.FactTest;

CREATE NONCLUSTERED INDEX [ncidx_FactTest_TestKey] ON [import].[FactTest]
([TestKey] ASC)
GO

