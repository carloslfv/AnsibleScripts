
USE [SUSDB]
GO
CREATE NONCLUSTERED INDEX IX_tbDeployment
ON [dbo].[tbDeployment] ([ActionID])
INCLUDE ([RevisionID],[TargetGroupID])
GO


USE [SUSDB]
GO
CREATE NONCLUSTERED INDEX IX_tbRevisionInCategory
ON [dbo].[tbRevisionInCategory] ([CategoryID],[Expanded])

GO

USE [SUSDB]
GO
CREATE NONCLUSTERED INDEX IX_tbDeadDeployment
ON [dbo].[tbDeadDeployment] ([TargetGroupTypeID],[LastChangeNumber])
INCLUDE ([RevisionID],[TargetGroupID])
GO