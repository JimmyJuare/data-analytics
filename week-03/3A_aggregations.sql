USE northwind;

-- =====================================================
-- 1. Cheapest item price, then product name
-- =====================================================

-- Cheapest price
SELECT MIN(UnitPrice) AS CheapestPrice
FROM products;

-- Product(s) with that price
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice = (
    SELECT MIN(UnitPrice)
    FROM products
);


-- =====================================================
-- 2. Average price of all items (rounded to cents)
-- =====================================================
SELECT ROUND(AVG(UnitPrice), 2) AS AveragePrice
FROM products;


-- =====================================================
-- 3. Most expensive item price, then product + supplier
-- =====================================================

-- Highest price
SELECT MAX(UnitPrice) AS HighestPrice
FROM products;

-- Product(s) with that price + supplier
SELECT p.ProductName, p.UnitPrice, s.CompanyName AS SupplierName
FROM products p
JOIN suppliers s ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice = (
    SELECT MAX(UnitPrice)
    FROM products
);


-- =====================================================
-- 4. Total monthly payroll
-- =====================================================
SELECT SUM(Salary) AS TotalMonthlyPayroll
FROM employees;


-- =====================================================
-- 5. Highest and lowest salaries (amounts only)
-- =====================================================
SELECT MAX(Salary) AS HighestSalary,
       MIN(Salary) AS LowestSalary
FROM employees;


-- =====================================================
-- 6. Supplier name, supplier ID, and number of items supplied
-- =====================================================
SELECT s.SupplierID,
       s.CompanyName AS SupplierName,
       COUNT(p.ProductID) AS ProductCount
FROM suppliers s
JOIN products p ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.CompanyName
ORDER BY ProductCount DESC;


-- =====================================================
-- 7. Category names with average product price
-- =====================================================
SELECT c.CategoryName,
       ROUND(AVG(p.UnitPrice), 2) AS AvgPrice
FROM categories c
JOIN products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY AvgPrice DESC;


-- =====================================================
-- 8. Suppliers providing at least 5 items
-- =====================================================
SELECT s.CompanyName AS SupplierName,
       COUNT(p.ProductID) AS ProductCount
FROM suppliers s
JOIN products p ON s.SupplierID = p.SupplierID
GROUP BY s.CompanyName
HAVING COUNT(p.ProductID) >= 5
ORDER BY ProductCount DESC;


-- =====================================================
-- 9. Inventory value (only products in stock)
-- =====================================================
SELECT ProductID,
       ProductName,
       UnitPrice * UnitsInStock AS InventoryValue
FROM products
WHERE UnitsInStock > 0
ORDER BY InventoryValue DESC, ProductName ASC;