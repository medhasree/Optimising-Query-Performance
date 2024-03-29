USE [denver_crime]
GO

/****** Object:  Table [dbo].[offense_codes]    Script Date: 4/29/2019 12:05:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[offense_codes](
	[_OFFENSE_CODE_] [nvarchar](50) NOT NULL,
	[_OFFENSE_CODE_EXTENSION_] [nvarchar](50) NOT NULL,
	[_OFFENSE_TYPE_ID_] [nvarchar](50) NOT NULL,
	[_OFFENSE_TYPE_NAME_] [nvarchar](100) NOT NULL,
	[_OFFENSE_CATEGORY_ID_] [nvarchar](50) NOT NULL,
	[_OFFENSE_CATEGORY_NAME_] [nvarchar](50) NOT NULL,
	[_IS_CRIME_] [nvarchar](50) NOT NULL,
	[_IS_TRAFFIC_] [nvarchar](50) NOT NULL
)
GO




USE [denver_crime]
GO
BEGIN TRANSACTION
CREATE PARTITION FUNCTION [PF_Offense_Code](nvarchar(50)) AS RANGE LEFT FOR VALUES (N'2500', N'5000', N'7500', N'10000')


CREATE PARTITION SCHEME [PS_Offense_Code] AS PARTITION [PF_Offense_Code] TO ([FG_2500], [FG_5000], [FG_7500], [FG_10000], [PRIMARY])




SET ANSI_PADDING ON

CREATE CLUSTERED INDEX [ClusteredIndex_on_PS_Offense_Code_636920930253677510] ON [dbo].[offense_codes]
(
	[_OFFENSE_CODE_]
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PS_Offense_Code]([_OFFENSE_CODE_])


--DROP INDEX [ClusteredIndex_on_PS_Offense_Code_636920930253677510] ON [dbo].[offense_codes]






COMMIT TRANSACTION


