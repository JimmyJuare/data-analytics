use northwind;

USE northwind;

USE northwind;

SELECT 
    'Categories' AS Table_Name, COUNT(*) AS Record_Count FROM Categories
UNION ALL
SELECT 'CustomerCustomerDemo', COUNT(*) FROM `CustomerCustomerDemo`
UNION ALL
SELECT 'CustomerDemographics', COUNT(*) FROM `CustomerDemographics`
UNION ALL
SELECT 'Customers', COUNT(*) FROM Customers
UNION ALL
SELECT 'Employees', COUNT(*) FROM Employees
UNION ALL
SELECT 'EmployeeTerritories', COUNT(*) FROM `EmployeeTerritories`
UNION ALL
SELECT 'Order Details', COUNT(*) FROM `Order Details`
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL
SELECT 'Products', COUNT(*) FROM Products
UNION ALL
SELECT 'Region', COUNT(*) FROM Region
UNION ALL
SELECT 'Shippers', COUNT(*) FROM Shippers
UNION ALL
SELECT 'Suppliers', COUNT(*) FROM Suppliers
UNION ALL
SELECT 'Territories', COUNT(*) FROM Territories
ORDER BY Table_Name;

-- question 3:

/*
- **Categories:** One product category (e.g., Beverages, Condiments).
- **CustomerCustomerDemo:** One link between a specific customer and a specific demographic profile.
- **CustomerDemographics:** One type of customer demographic (e.g., “Retail”, “Wholesale”, “VIP”).
- **Customers:** One individual customer or company that places orders.
- **Employees:** One employee who works for the company.
- **EmployeeTerritories:** One assignment of an employee to a specific sales territory.
- **Order Details:** One line item on an order—one product on one order, with quantity, price, etc.
- **Orders:** One order placed by a customer (the overall order, not the individual items).
- **Products:** One product that can be ordered.
- **Region:** One sales region (e.g., “North”, “West”).
- **Shippers:** One shipping company used to deliver orders.
- **Suppliers:** One supplier that provides products.
- **Territories:** One sales territory within a region.

*/