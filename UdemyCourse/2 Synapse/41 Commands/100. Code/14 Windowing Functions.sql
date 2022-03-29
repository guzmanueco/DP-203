-- Lab - Windowing Functions

SELECT
ROW_NUMBER() OVER(PARTITION BY [ProductID] ORDER BY [OrderQty]) AS "Row Number",
[ProductID],[CustomerID],[OrderQty],[UnitPrice]
FROM [dbo].[SalesFact]
ORDER BY [ProductID]

SELECT
ROW_NUMBER() OVER(PARTITION BY [ProductID] ORDER BY [OrderQty]) AS "Row Number",
[ProductID],[CustomerID],[OrderQty],
SUM([OrderQty]) OVER(PARTITION BY [ProductID]) AS TotalOrderQty,
[UnitPrice]
FROM [dbo].[SalesFact]
ORDER BY [ProductID]


-- Guzman's Example of how to filter based on ROW_COUNT
-- We need to make a subquery because normally aliases are not allowed in WHERE Clauses

SELECT * FROM
(SELECT 
ROW_NUMBER() OVER(PARTITION BY [ProductID] ORDER BY [OrderQty]) AS "Row Number",
[ProductID],[CustomerID],[OrderQty],
SUM([OrderQty]) OVER(PARTITION BY [ProductID]) AS TotalOrderQty,
SUM([UnitPrice]) OVER(PARTITION BY [ProductID]) AS TotalPrice,
[UnitPrice]
FROM [dbo].[SalesFact]) as innerTable
WHERE "Row Number"=1
ORDER BY [ProductID]