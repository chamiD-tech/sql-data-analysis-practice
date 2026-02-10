-- 02_aggregations.sql
-- Demonstrate aggregation and grouping for analysis

-- Total revenue per order
SELECT
    OrderID,
    SUM(Quantity * UnitPrice) AS OrderRevenue
FROM retail_sales
GROUP BY OrderID;

-- Revenue by product category
SELECT
    Category,
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM retail_sales
GROUP BY Category
ORDER BY TotalRevenue DESC;

-- Average unit price by category
SELECT
    Category,
    AVG(UnitPrice) AS AvgUnitPrice
FROM retail_sales
GROUP BY Category;

-- Total quantity sold by region
SELECT
    Region,
    SUM(Quantity) AS TotalUnitsSold
FROM retail_sales
GROUP BY Region
ORDER BY TotalUnitsSold DESC;

-- Categories with revenue above 500
SELECT
    Category,
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM retail_sales
GROUP BY Category
HAVING SUM(Quantity * UnitPrice) > 500;
