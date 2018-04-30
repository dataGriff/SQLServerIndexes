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


