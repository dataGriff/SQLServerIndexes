USE [IndexDemo]
GO

ALTER TABLE [import].[FactTest]  WITH CHECK ADD  CONSTRAINT [FK_FactTest_DimDate] FOREIGN KEY([DateKey])
REFERENCES [import].[DimDate] ([DateKey])
GO

ALTER TABLE [import].[FactTest] CHECK CONSTRAINT [FK_FactTest_DimDate]
GO


USE [IndexDemo]
GO

ALTER TABLE [import].[FactTest]  WITH CHECK ADD  CONSTRAINT [FK_FactTest_DimTest] FOREIGN KEY([TestKey])
REFERENCES [import].[DimTest] ([TestKey])
GO

ALTER TABLE [import].[FactTest] CHECK CONSTRAINT [FK_FactTest_DimTest]
GO

