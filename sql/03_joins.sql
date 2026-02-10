-- 03_joins.sql
-- Demonstrate joining sales and customer data

-- View sales with customer details
SELECT
    rs.OrderID,
    rs.Product,
    rs.Category,
    rs.Region,
    rs.Quantity,
    rs.UnitPrice,
    (rs.Quantity * rs.UnitPrice) AS Revenue,
    c.CustomerName,
    c.CustomerSegment
FROM retail_sales rs
INNER JOIN customers c
    ON rs.CustomerID = c.CustomerID;

-- Revenue by customer segment
SELECT
    c.CustomerSegment,
    SUM(rs.Quantity * rs.UnitPrice) AS TotalRevenue
FROM retail_sales rs
INNER JOIN customers c
    ON rs.CustomerID = c.CustomerID
GROUP BY c.CustomerSegment
ORDER BY TotalRevenue DESC;

-- Number of orders per customer
SELECT
    c.CustomerName,
    COUNT(rs.OrderID) AS NumberOfOrders
FROM customers c
LEFT JOIN retail_sales rs
    ON c.CustomerID = rs.CustomerID
GROUP BY c.CustomerName
ORDER BY NumberOfOrders DESC;
