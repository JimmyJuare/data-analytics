USE northwind;

-- =====================================================
-- 1. Product id, name, price, and category name
-- ordered by category, then product name
-- =====================================================
SELECT p.ProductID, p.ProductName, p.UnitPrice, c.CategoryName
FROM products p
JOIN categories c ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName ASC, p.ProductName ASC;


-- =====================================================
-- 2. Products > $75 with supplier name
-- ordered by product name
-- =====================================================
SELECT p.ProductID, p.ProductName, p.UnitPrice, s.CompanyName AS SupplierName
FROM products p
JOIN suppliers s ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice > 75
ORDER BY p.ProductName ASC;


-- =====================================================
-- 3. Product id, name, price, category, supplier
-- ordered by product name
-- =====================================================
SELECT p.ProductID, p.ProductName, p.UnitPrice,
       c.CategoryName,
       s.CompanyName AS SupplierName
FROM products p
JOIN categories c ON p.CategoryID = c.CategoryID
JOIN suppliers s ON p.SupplierID = s.SupplierID
ORDER BY p.ProductName ASC;


-- =====================================================
-- 4. Orders shipped to Germany with shipper name
-- alias shipper as 'Shipper'
-- =====================================================
SELECT o.OrderID,
       o.ShipName,
       o.ShipAddress,
       sh.CompanyName AS Shipper
FROM orders o
JOIN shippers sh ON o.ShipVia = sh.ShipperID
WHERE o.ShipCountry = 'Germany'
ORDER BY Shipper ASC, o.ShipName ASC;


-- =====================================================
-- 5. Count of orders per ship name (Germany only)
-- =====================================================
SELECT o.ShipName,
       COUNT(*) AS OrderCount,
       sh.CompanyName AS Shipper
FROM orders o
JOIN shippers sh ON o.ShipVia = sh.ShipperID
WHERE o.ShipCountry = 'Germany'
GROUP BY o.ShipName, sh.CompanyName
ORDER BY OrderCount DESC;


-- =====================================================
-- 6. Orders that included "Sasquatch Ale"
-- (requires joining 3 tables)
-- =====================================================
SELECT o.OrderID,
       o.OrderDate,
       o.ShipName,
       o.ShipAddress
FROM orders o
JOIN `order details` od ON o.OrderID = od.OrderID
JOIN products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Sasquatch Ale'
ORDER BY o.OrderDate;