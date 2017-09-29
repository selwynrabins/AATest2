/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4206)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2016
    Target Database Engine Edition : Microsoft SQL Server Express Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [medbillit]
GO

/****** Object:  Table [dbo].[NDC]    Script Date: 9/1/2017 11:30:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NDC](
	[ID] [int] IDENTITY(101,1) NOT NULL,
	[Clientid] [int] NULL,
	[MRNum] [nvarchar](30) NULL,
	[FilledDate] [datetime] NULL,
	[NDC] [nchar](15) NULL,
	[UnitPrice] [numeric](18, 2) NULL,
	[UnitCount] [numeric](18, 0) NULL,
	[MeasurementUnit] [nchar](10) NULL,
	[PrescriptionNumber] [nchar](20) NULL,
	[RptYear]  AS (datepart(year,[FilledDate])),
	[RptMonth]  AS (datepart(month,[FilledDate])),
	[Submitted] [bit] NULL,
	[SubmitDate] [datetime] NULL,
	[ServiceDate]  AS (CONVERT([char](8),[FilledDate],(112))),
	[Not_Included] [bit] NULL,
 CONSTRAINT [PK_NDC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[NDC] ADD  CONSTRAINT [DF_NDC_Submitted]  DEFAULT ((0)) FOR [Submitted]
GO

ALTER TABLE [dbo].[NDC] ADD  CONSTRAINT [DF_NDC_Not_Included]  DEFAULT ((0)) FOR [Not_Included]
GO

