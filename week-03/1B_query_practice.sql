USE northwind;

-- =====================================================
-- 1. List the product id, product name, and unit price
-- =====================================================
SELECT ProductID, ProductName, UnitPrice
FROM products;


-- =====================================================
-- 2. Products with a unit price of $7.50 or less
-- =====================================================
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice <= 7.50;


-- =====================================================
-- 3. Products with no stock but have units on backorder
-- (Derived using UnitsInStock and UnitsOnOrder)
-- =====================================================
SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder
FROM products
WHERE UnitsInStock = 0
AND UnitsOnOrder > 0
AND Discontinued = 0;


-- =====================================================
-- 4. Categories + Seafood Products
-- =====================================================

-- Step 1: Identify how category is stored
SELECT ProductName, CategoryID
FROM products;

-- Step 2: View all categories
SELECT *
FROM categories;

-- Step 3: Find Seafood category ID
SELECT CategoryID, CategoryName
FROM categories
WHERE CategoryName = 'Seafood';

-- Step 4: List all seafood products (JOIN version)
SELECT p.ProductName
FROM products p
JOIN categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Seafood';


-- =====================================================
-- 5. Suppliers + Tokyo Traders
-- =====================================================

-- Step 1: See how products link to suppliers
SELECT ProductName, SupplierID
FROM products;

-- Step 2: View all suppliers
SELECT *
FROM suppliers;

-- Step 3: Find SupplierID for Tokyo Traders
SELECT SupplierID
FROM suppliers
WHERE CompanyName = 'Tokyo Traders';

-- Step 4: List all products from Tokyo Traders (JOIN version)
SELECT p.ProductName
FROM products p
JOIN suppliers s ON p.SupplierID = s.SupplierID
WHERE s.CompanyName = 'Tokyo Traders';


-- =====================================================
-- 6. Employees
-- =====================================================

-- Total number of employees
SELECT COUNT(*) AS TotalEmployees
FROM employees;

-- Employees with "manager" in their title
SELECT FirstName, LastName, Title
FROM employees
WHERE Title LIKE '%manager%';