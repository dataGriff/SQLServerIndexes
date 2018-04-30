USE [IndexDemo]
GO

ALTER TABLE [import].[FactTest] DROP CONSTRAINT [FK_FactTest_DimDate]
GO

USE [IndexDemo]
GO

ALTER TABLE [import].[FactTest] DROP CONSTRAINT [FK_FactTest_DimTest]
GO




