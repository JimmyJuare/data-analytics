/*
a) What is the name of the table that holds the items Northwind sells?
Products table
b) What is the name of the table that holds the types/categories of the items
Northwind sells?
products table
5. Create a SELECT statement to retrieve all columns from the employees table.
*/
SELECT * FROM employees;
/*
a) Who is the Northwind employee whose name makes it look like she’s a bird?
Include the answer as a comment underneath the SELECT statement.

margaret peacock

6. Create a SELECT statement to retrieve all columns from the products table.

*/

SELECT * FROM products;

/*
a) How many records does your query return? Using the toolbar options at the top of
the query pane, how can you change your query to retrieve only 10 rows? Include
the answer as a comment underneath the SELECT statement.

I only recieved 77 records and I can change that by clicking limit to ten rows

7. Create another SELECT statement to retrieve all columns from the categories table.
*/
SELECT * FROM categories;
/*
c) What is the category id of seafood? Include a comment in your script to answer
this.

the Id number for seafood is 8

8. Create a final SELECT statement to retrieve the top 50 records from orders, including
only the OrderID, OrderDate, ShipName, and ShipCountry columns.

*/

SELECT 
    OrderID,
    OrderDate,
    ShipName,
    ShipCountry
FROM Orders
LIMIT 50;