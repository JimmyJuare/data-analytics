# northwind_review.md

## Column CustomerID  
Table Customers  

### 1. What does a value in this column represent What values might you see here
Each value represents a unique identifier assigned to a customer in the Northwind database.  
You might see values like `ALFKI`, `BONAP`, or `TOMSP` — short alphanumeric codes that identify each customer record.

### 2. Is this column a part of the primary key to this table
Yes. `CustomerID` is the primary key for the Customers table.  
It uniquely distinguishes each customer and ensures no duplicates exist.

### 3. Is this column a part of a foreign key that points to a record in another table
Yes, indirectly. Other tables such as Orders reference `CustomerID` as a foreign key to link each order to the customer who placed it.

### 4. Would this column be valuable to bring into our Power BI Model  
Yes. It’s essential for establishing relationships between tables (e.g., Customers ↔ Orders).  
Even though it’s not used for direct analysis, it’s critical for connecting data correctly.

### 5. Do you believe this column is appropriately named for Data Analysis purposes  
Yes. The name `CustomerID` clearly conveys its purpose — identifying customers.

### 6. If not, what might be a more appropriate name  
Not applicable — the current name is already clear and standard.

### 7. What might be the data type and format for this column in a Power BI Model  
Data Type TextString  
Format Typically a 5‑character alphanumeric code (e.g., `ALFKI`).

### 8. Can you think of any calculations where this column data might be used  
While not used in numeric calculations, it’s vital for relationships and lookups — for example  
- Counting distinct customers `DISTINCTCOUNT(CustomerID)`  
- Joining with Orders to calculate total sales per customer.  
- Filtering or grouping visualizations by customer.

---

