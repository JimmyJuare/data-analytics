/* Name: Teodoro Jimmy Juarez
Category/Vendor of Choice: Moet Hennessy
Instructions: Copy and paste the below questions into your script.
Below each question, write your response, including relevant SQL queries.
Make sure the questions and plain-language answers are commented out!
*/

-- SELECT, Filtering & Sorting
-- 1. Create a list of all transactions for your chosen vendor that took place in
-- the last quarter of 2014, sorted by the total sale amount from highest to lowest.
SELECT DISTINCT 
	vendor, 
	total, 
	date AS time_stamp
FROM 
	sales
WHERE 
	vendor ILIKE '%hennessy%'
AND 
	date BETWEEN '2014-10-01' AND '2014-12-31'
ORDER BY 
	total DESC;
-- (Strength: Identifying high-volume peak periods).
-- 2. Which transactions for your had a bottle quantity greater than 12?
-- Display the date, store number, item description, and total amount.
SELECT 
	date, 
	store, 
	description, 
	total, 
	bottle_qty
FROM
	sales
WHERE
	bottle_qty > 12
-- (Strength: Identifying bulk buyers or wholesale-style transactions).
-- 3. Find all products in the products_table whose item_description contains a specific
-- keyword (e.g., 'Limited', 'Spiced'). What categories do they belong to?
-- (Opportunity: Identifying niche product variants).

SELECT COUNT(*) AS items_count,
	category_name AS category,
	item_description AS description
FROM 
	products
WHERE 
	item_description ILIKE ANY(ARRAY['%Limited%','%Spiced%','%Premium%'])
GROUP BY 
	category_name, item_description;
-- Aggregation
-- 4. What is the total sales revenue and the average bottle price (btl_price) for
-- your chosen Vendor?
SELECT 
	SUM(total) AS sum_total,
	ROUND(AVG(btl_price::NUMERIC)) AS avg_price
FROM 
	sales
WHERE 
	vendor ILIKE '%hennessy%'
-- (Strength/Baseline: Establishing the financial footprint).
-- 5. How many transactions were recorded for each specific item description within your
-- chosen Vendor?
SELECT
	COUNT(*) count_of_trans_per_dscrptn, 
	item_description, 
	vendor_name
FROM 
	products
WHERE	
	vendor_name ILIKE '%hennessy%'
GROUP BY 
	item_description,
	vendor_name
ORDER BY 
count_of_trans_per_dscrptn DESC;
-- Which specific product is the most frequently purchased?
--answer: Hennessy Vs Congnac and Belvedere Vodka were both purchased most frequently

-- (Strength: Identifying your "hero" product).

-- 6. Which store generated the highest total revenue for your Vendor?
SELECT DISTINCT 
	store AS store_id,
	SUM(total)::money AS highest_revenue
FROM 
	sales
WHERE 
	vendor ILIKE '%hennessy%'
GROUP BY 
	store
ORDER BY 
	highest_revenue DESC LIMIT 1;
-- Which generated the lowest (but still greater than zero)?
SELECT DISTINCT 
	store AS store_id, 
	SUM(total)::money AS lowest_revenue
FROM 
	sales
WHERE 
	vendor ILIKE '%hennessy%'
GROUP BY 
	store	
ORDER BY 
	lowest_revenue ASC LIMIT 1;
-- (Strength vs. Weakness: Identifying your best and worst retail partners).
--my best retail store partner is store_id 4829 and my worst is store_id 4525
--==================================================================================================
-- 7. What is the total revenue for every vendor within your chosen [Category],
-- sorted from highest to lowest?
/*
note: Since I got a vendor[Moet Hennessy] and not a category I am going to assume you 
want me to actually give the total revenue for every CATEGORY within my given vendor, 
unless you want me to choose a category from the sales table and then give total revenue
related to every vendor in that regard, I'll just do both just in cast.
*/

/* first part of the problem based on given vendor in relation to this question:
7a - What is the total revenue for every Category within your given Vendor,
sorted from highest to lowest?
*/
SELECT 
category_name AS category,
SUM(total)::money AS sum_per_cat
FROM 
	sales 
WHERE 
	vendor ILIKE '%hennessy%'
GROUP BY 
	category_name
ORDER BY
	sum_per_cat DESC;

/*
7b - What is the total revenue for every vendor within your chosen [Category],
     sorted from highest to lowest?

I choose the IMPORTED VODKA - MISC category for this exercise

*/
SELECT
	vendor, 
	category_name, 
	SUM(total) AS sum_per_vendor 
FROM 
	sales 
WHERE 
	category_name = 'IMPORTED VODKA - MISC'
GROUP BY 
	category_name, vendor
ORDER BY 
	um_per_vendor DESC;

-- (Threat: Identifying your top competitors in that space).

-- my top competitor would be Western Spirits Beverage Co. LLC as they are only a couple thousand
--above my given vendor.
--===================================================================================================
-- 8. Which stores had total sales revenue for your [Category/Vendor] exceeding $2,000?
-- (Hint: Use HAVING to filter aggregated store totals).
SELECT 
	store, 
	SUM(total)::money AS rev_exceeding_2000
FROM 
	sales
WHERE 
	vendor ILIKE '%hennessy%'
GROUP BY 
	store
HAVING 
	SUM(total) > 2000
ORDER BY 
	rev_exceeding_2000 ASC;
--change ASC to DESC to DESC to find the highest store
-- (Strength: Pinpointing high-performing retail locations).
--the highest paying store is store number is 4829

-- Joins
-- 9. Find all sales records where the category_name is either your chosen category
-- or a closely related competitor category (e.g., 'VODKA 80 PROOF' vs 'IMPORTED VODKA').
-- (Threat: Comparing performance against direct substitutes).
--I choose the FLAVORED VODKA
/* 
my thought process immediately went to a 'search engine mindset' of finding
all categories related to vodka as it would make it easier to see whats closest to
my chosen category, but then I thought it over and realized this problem wants
a more narrowed down search for the closely related categories that doesnt just consist
of all the other categories that have a keyword related to my category, like 
the keyword 'vodka' for ex. but rather a closely related competitor category, so I need to 
manually query a specific set of categories that I feel match the category of my 
choosing in terms of its implicite competitors, therfore I must use an IN statement,
or I can even use an ANY(ARRAY[]) expression. I chose to do both for the practice, 
although the most practical in this scenario would be to use the IN statement.
*/

--practical way
SELECT 
	category_name, 
	vendor 
FROM 
	sales 
WHERE 
	category_name 
		IN('FLAVORED VODKA',
		   'VODKA 80 PROOF',
		   'IMPORTED VODKA')
--impractical way
SELECT 
	category_name, 
	vendor 
FROM 
	sales 
WHERE 
	category_name ILIKE ANY(ARRAY['FLAVORED VODKA','VODKA 80 PROOF', 'IMPORTED VODKA'])
GROUP BY 
	category_name, 
	vendor;
-- 10. List all transactions where the state bottle cost was between $10 and $20 for
-- your [Category/Vendor].
SELECT
	state_btl_cost,
	store
FROM
	sales
WHERE state_btl_cost < 20::money AND state_btl_cost > 10::money
ORDER BY state_btl_cost ASC;
-- (Opportunity: Analyzing performance in the "mid-tier" price bracket)

-- 11. Write a query that displays each store's total sales for your [Category/Vendor]
-- along with the store's name and address from the stores_table.
SELECT
st.name,
st.store_address,
SUM(sl.total)::money AS total_sales
FROM stores st JOIN sales sl ON sl.store = st.store
WHERE sl.vendor ILIKE '%hennessy%'
GROUP BY st.name, st.store_address;


-- (Strength: Mapping your physical sales footprint).
-- 12. For each sale in your Vendor, display the transaction date, total amount,
-- and the population of the county where the sale occurred by joining with counties_table.
SELECT
	sl.date,
	sl.total,
	ct.population,
	ct.county
FROM 
	sales sl JOIN counties ct ON sl.county = ct.county
GROUP BY 
	sl.date, sl.total,ct.population, ct.county;
-- (Opportunity: Correlating sales volume with population density)