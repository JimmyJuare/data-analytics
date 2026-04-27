USE northwind;

-- =====================================================
-- 1. Product name(s) of the most expensive products
-- =====================================================
SELECT ProductName
FROM products
WHERE UnitPrice = (
    SELECT MAX(UnitPrice)
    FROM products
);


-- =====================================================
-- 2. Product name(s) and categories of the least expensive products
-- =====================================================
SELECT p.ProductName, c.CategoryName
FROM products p
JOIN categories c ON p.CategoryID = c.CategoryID
WHERE p.UnitPrice = (
    SELECT MIN(UnitPrice)
    FROM products
);


-- =====================================================
-- 3. Orders shipped via "Federal Shipping"
-- =====================================================
SELECT OrderID, ShipName, ShipAddress
FROM orders
WHERE ShipVia = (
    SELECT ShipperID
    FROM shippers
    WHERE CompanyName = 'Federal Shipping'
);


-- =====================================================
-- 4. Order IDs that included "Sasquatch Ale"
-- =====================================================
SELECT DISTINCT OrderID
FROM `order details`
WHERE ProductID = (
    SELECT ProductID
    FROM products
    WHERE ProductName = 'Sasquatch Ale'
);


-- =====================================================
-- 5. Employee who sold order 10266
-- =====================================================
SELECT FirstName, LastName
FROM employees
WHERE EmployeeID = (
    SELECT EmployeeID
    FROM orders
    WHERE OrderID = 10266
);


-- =====================================================
-- 6. Customer who bought order 10266
-- =====================================================
SELECT CompanyName AS CustomerName
FROM customers
WHERE CustomerID = (
    SELECT CustomerID
    FROM orders
    WHERE OrderID = 10266
);