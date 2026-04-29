/* Name: Teodoro Jimmy Juarez
Category/Vendor of Choice: Moet Hennessy
Instructions: Copy and paste the below questions into your script.
Below each question, write your response, including relevant SQL queries.
Make sure the questions and plain-language answers are commented out!
*/
SELECT * FROM sales;
-- SELECT, Filtering & Sorting
-- 1. Create a list of all transactions for your chosen vendor that took place in
-- the last quarter of 2014, sorted by the total sale amount from highest to lowest.
SELECT DISTINCT vendor, total, date AS time_stamp
FROM sales
WHERE vendor
ILIKE '%hennessy%'
AND date BETWEEN '2014-10-01' AND '2014-12-31'
ORDER BY total DESC;
-- (Strength: Identifying high-volume peak periods).
-- 2. Which transactions for your had a bottle quantity greater than 12?
-- Display the date, store number, item description, and total amount.
SELECT date, store, description, total, bottle_qty
FROM sales
WHERE bottle_qty > 12
-- (Strength: Identifying bulk buyers or wholesale-style transactions).
-- 3. Find all products in the products_table whose item_description contains a specific
-- keyword (e.g., 'Limited', 'Spiced'). What categories do they belong to?
-- (Opportunity: Identifying niche product variants).

SELECT COUNT(*) AS items_count, category_name AS category, item_description AS description
FROM products
WHERE item_description 
ILIKE ANY(ARRAY['%Limited%','%Spiced%','%Premium%'])
GROUP BY category_name;
-- Aggregation
-- 4. What is the total sales revenue and the average bottle price (btl_price) for
-- your chosen [Category/Vendor]?
-- (Strength/Baseline: Establishing the financial footprint).
-- 5. How many transactions were recorded for each specific item description within your
-- chosen [Category]? Which specific product is the most frequently purchased?
-- (Strength: Identifying your "hero" product).
-- 6. Which store generated the highest total revenue for your [Category/Vendor]?
-- Which generated the lowest (but still greater than zero)?
-- (Strength vs. Weakness: Identifying your best and worst retail partners).
-- 7. What is the total revenue for every vendor within your chosen [Category],

-- sorted from highest to lowest?
-- (Threat: Identifying your top competitors in that space).
-- 8. Which stores had total sales revenue for your [Category/Vendor] exceeding $2,000?
-- (Hint: Use HAVING to filter aggregated store totals).
-- (Strength: Pinpointing high-performing retail locations).
-- Joins
-- 9. Find all sales records where the category_name is either your chosen category
-- or a closely related competitor category (e.g., 'VODKA 80 PROOF' vs 'IMPORTED VODKA').
-- (Threat: Comparing performance against direct substitutes).
-- 10. List all transactions where the state bottle cost was between $10 and $20 for
-- your [Category/Vendor].
-- (Opportunity: Analyzing performance in the "mid-tier" price bracket).
-- 11. Write a query that displays each store's total sales for your [Category/Vendor]
-- along with the store's name and address from the stores_table.
-- (Strength: Mapping your physical sales footprint).
-- 12. For each sale in your [Category], display the transaction date, total amount,
-- and the population of the county where the sale occurred by joining with counties_table.
-- (Opportunity: Correlating sales volume with population density)