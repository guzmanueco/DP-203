-- Lab - Surrogate keys for dimension tables

-- First let's ensure we have the tables defined in the SQL pool
-- Let's do this for one dimension table

-- First drop the table if you have it in place

DROP TABLE [dbo].[DimProduct]

CREATE TABLE [dbo].[DimProduct](
	[ProductSK] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductModelID] [int] NOT NULL,
	[ProductSubcategoryID] [int] NOT NULL,
	[ProductName] varchar(50) NOT NULL,
	[SafetyStockLevel] [smallint] NOT NULL,
	[ProductModelName] varchar(50) NULL,
	[ProductSubCategoryName] varchar(50) NULL
)

-- Guzman's comment: note that if the table is distributed in different distributions in Syanpse, 
-- the ProductSK will increment according to the number of distributions instead of being autoincremental from 1


