USE northwind;

-- =====================================================
-- 1. List product id, product name, and unit price
-- ordered in ascending order by price
-- =====================================================
SELECT ProductID, ProductName, UnitPrice
FROM products
ORDER BY UnitPrice ASC;


-- =====================================================
-- 2. Products with at least 100 units in stock
-- ordered in descending order by price
-- =====================================================
SELECT ProductID, ProductName, UnitPrice, UnitsInStock
FROM products
WHERE UnitsInStock >= 100
ORDER BY UnitPrice DESC;


-- =====================================================
-- 3. Same as #2, but if prices are equal,
-- order those by product name (ascending)
-- =====================================================
SELECT ProductID, ProductName, UnitPrice, UnitsInStock
FROM products
WHERE UnitsInStock >= 100
ORDER BY UnitPrice DESC, ProductName ASC;


-- =====================================================
-- 4. Total number of distinct customers who placed orders
-- =====================================================
SELECT COUNT(DISTINCT CustomerID) AS CustomerCount
FROM orders;


-- =====================================================
-- 5. Distinct customers per ship country
-- ordered by CustomerCount (largest to smallest)
-- =====================================================
SELECT ShipCountry,
       COUNT(DISTINCT CustomerID) AS CustomerCount
FROM orders
GROUP BY ShipCountry
ORDER BY CustomerCount DESC;


-- =====================================================
-- 6. Products with less than 25 units in stock
-- and at least 1 unit on order
-- ordered by UnitsOnOrder (desc), then ProductName
-- =====================================================
SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder
FROM products
WHERE UnitsInStock < 25
AND UnitsOnOrder > 0
AND Discontinued = 0
ORDER BY UnitsOnOrder DESC, ProductName ASC;


-- =====================================================
-- 7. Job titles with count of employees
-- =====================================================
SELECT Title,
       COUNT(*) AS EmployeeCount
FROM employees
GROUP BY Title
ORDER BY EmployeeCount DESC;


-- =====================================================
-- 8. Employees with salary between $2000 and $2500
-- ordered by job title
-- =====================================================
SELECT FirstName, LastName, Title, Salary
FROM employees
WHERE Salary BETWEEN 2000 AND 2500
ORDER BY Title ASC;