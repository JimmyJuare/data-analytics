/*
a) In the schema panel, expand the table for actor and then expand Columns. What
information is included in this table?

all of the tables:
[actors, saddress, category, city, country, customer, film, film_customer, film_category,
 film_text, inventory, language, payment, retal, staff, store]
 
b) Now expand the table for film and then expand Columns. What information is
included in this table?
[film_id, title, description, release_year, language_id, original_language_id, rental duration, 
rental_rate, length, length, replacement_cost, rating, special_feature, last_update]


c) Which other table in sakila contains columns for both actor_id and film_id?
the film_actor table has both actor_id and film_id
d) Right-click on rental and choose the menu option for Select Rows. Notice that
this opens a new query window. Look at the query results to determine what
information you can find in the rental table. What does this table include? Is this
information easy to read, or hard to read? Why?

it includes:
rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
it is easy to read as it is pretty descriptive and it tells us what is

e) Perform the same steps for the inventory table. What does this table include?
inventory_id, film_id, store_id, last_update

f) Based on what you have learned so far, which tables do you need to use in order to
understand the names of all films that were rented on a specific date? How are
these tables related to each other? Answer with an explanation in full sentences.

To understand the names of all films that were rented on a specific date, I would need to use the following tables:

rental
inventory
film

These three tables are related to each other by:
The rental table contains the rental date (rental_date) and the inventory_id of the item that was rented.
However, it does not store the film name directly. To get the actual film title, I first need 
to link the rental table to the inventory table using the inventory_id. The inventory table 
tells me which film_id corresponds to that inventory item. Then, I use the film_id to join 
with the film table, which contains the title (and other details) of the film.
In summary:
rental → (via inventory_id) → inventory → (via film_id) → film
By joining these three tables together on their common keys (inventory_id and film_id), I can 
retrieve the names (titles) of all films that were rented on any specific date.
*/