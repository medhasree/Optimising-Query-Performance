USE [denver_crime]
GO

/****** Object:  Table [dbo].[crime]    Script Date: 4/28/2019 11:25:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[crime](
	[_INCIDENT_ID_] [nvarchar](50) NOT NULL,
	[_OFFENSE_ID_] [nvarchar](50) NOT NULL,
	[_OFFENSE_CODE_] [nvarchar](50) NOT NULL,
	[_OFFENSE_CODE_EXTENSION_] [nvarchar](50) NOT NULL,
	[_OFFENSE_TYPE_ID_] [nvarchar](50) NOT NULL,
	[_OFFENSE_CATEGORY_ID_] [nvarchar](50) NOT NULL,
	[_FIRST_OCCURRENCE_DATE_] [varchar](50) NOT NULL,
	[_LAST_OCCURRENCE_DATE_] [nvarchar](50) NOT NULL,
	[_REPORTED_DATE_] [nvarchar](50) NOT NULL,
	[_INCIDENT_ADDRESS_] [nvarchar](50) NOT NULL,
	[_GEO_X_] [nvarchar](50) NOT NULL,
	[_GEO_Y_] [nvarchar](50) NOT NULL,
	[_GEO_LON_] [nvarchar](50) NOT NULL,
	[_GEO_LAT_] [nvarchar](50) NOT NULL,
	[_DISTRICT_ID_] [nvarchar](50) NOT NULL,
	[_PRECINCT_ID_] [nvarchar](50) NOT NULL,
	[_NEIGHBORHOOD_ID_] [nvarchar](50) NOT NULL,
	[_IS_CRIME_] [nvarchar](50) NOT NULL,
	[_IS_TRAFFIC_] [nvarchar](50) NOT NULL
)ON PS_OccurenceDate(_FIRST_OCCURRENCE_DATE_)
GO

USE [denver_crime]
GO

/****** Object:  PartitionFunction [PF_OccurenceDate]    Script Date: 4/28/2019 11:28:24 PM ******/
CREATE PARTITION FUNCTION [PF_OccurenceDate](varchar(50)) AS RANGE LEFT FOR VALUES (N'2016', N'2017', N'2018')
GO


USE [denver_crime]
GO

/****** Object:  PartitionScheme [PS_OccurenceDate]    Script Date: 4/28/2019 11:27:51 PM ******/
CREATE PARTITION SCHEME [PS_OccurenceDate] AS PARTITION [PF_OccurenceDate] TO ([FG_2015], [FG_2016], [FG_2017], [PRIMARY])
GO


