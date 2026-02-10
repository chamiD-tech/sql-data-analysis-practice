-- 01_basic_queries.sql
-- Demonstrate basic SQL querying

-- View all records
SELECT *
FROM retail_sales;

-- Select specific columns
SELECT OrderID, Product, Category, Region
FROM retail_sales;

-- Filter records by category
SELECT *
FROM retail_sales
WHERE Category = 'Electronics';

-- Filter records by region and sort by price
SELECT *
FROM retail_sales
WHERE Region = 'West'
ORDER BY UnitPrice DESC;

-- Limit results
SELECT *
FROM retail_sales
ORDER BY OrderDate
LIMIT 5;
