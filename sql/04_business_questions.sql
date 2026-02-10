-- 04_business_questions.sql
-- Answer practical business questions using SQL

-- 1. Which product categories generate the highest total revenue?
SELECT
    Category,
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM retail_sales
GROUP BY Category
ORDER BY TotalRevenue DESC;

-- 2. Which regions perform best in terms of revenue?
SELECT
    Region,
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM retail_sales
GROUP BY Region
ORDER BY TotalRevenue DESC;

-- 3. Who are the top 3 customers by total revenue?
SELECT
    c.CustomerName,
    SUM(rs.Quantity * rs.UnitPrice) AS TotalRevenue
FROM retail_sales rs
INNER JOIN customers c
    ON rs.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalRevenue DESC
LIMIT 3;

-- 4. What is the average order value by customer segment?
SELECT
    c.CustomerSegment,
    AVG(rs.Quantity * rs.UnitPrice) AS AvgOrderValue
FROM retail_sales rs
INNER JOIN customers c
    ON rs.CustomerID = c.CustomerID
GROUP BY c.CustomerSegment
ORDER BY AvgOrderValue DESC;

-- 5. Which products sell the most units?
SELECT
    Product,
    SUM(Quantity) AS TotalUnitsSold
FROM retail_sales
GROUP BY Product
ORDER BY TotalUnitsSold DESC;
