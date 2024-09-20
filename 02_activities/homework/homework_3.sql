-- AGGREGATE
/* 1. Write a query that determines how many times each vendor has rented a booth 
at the farmer’s market by counting the vendor booth assignments per vendor_id. */

SELECT DISTINCT v.vendor_id, v.vendor_name, count(vb.market_date)
FROM vendor as v

INNER JOIN vendor_booth_assignments as vb
	ON vb.vendor_id = v.vendor_id
GROUP BY vb.vendor_id

/* 2. The Farmer’s Market Customer Appreciation Committee wants to give a bumper 
sticker to everyone who has ever spent more than $2000 at the market. Write a query that generates a list 
of customers for them to give stickers to, sorted by last name, then first name. 

HINT: This query requires you to join two tables, use an aggregate function, and use the HAVING keyword. */

SELECT c.customer_last_name, c.customer_first_name
, SUM(quantity*cost_to_customer_per_qty) as cost
FROM customer as c

INNER JOIN customer_purchases as cp
	ON cp.customer_id = c.customer_id
GROUP BY c.customer_last_name, c.customer_first_name
HAVING cost > 2000
ORDER BY c.customer_last_name, c.customer_first_name


--Temp Table
/* 1. Insert the original vendor table into a temp.new_vendor and then add a 10th vendor: 
Thomass Superfood Store, a Fresh Focused store, owned by Thomas Rosenthal

HINT: This is two total queries -- first create the table from the original, then insert the new 10th vendor. 
When inserting the new vendor, you need to appropriately align the columns to be inserted 
(there are five columns to be inserted, I've given you the details, but not the syntax) 

-> To insert the new row use VALUES, specifying the value you want for each column:
VALUES(col1,col2,col3,col4,col5) 
*/

DROP TABLE IF EXISTS new_vendor;
CREATE TEMP TABLE new_vendor AS 
SELECT *
FROM vendor;

INSERT INTO new_vendor
VALUES(10,'Thomass Superfood Store','Fresh Focused','Thomas','Rosenthal');
SELECT * FROM new_vendor

-- Date
/*1. Get the customer_id, month, and year (in separate columns) of every purchase in the customer_purchases table.

HINT: you might need to search for strfrtime modifers sqlite on the web to know what the modifers for month 
and year are! */

SELECT customer_id
, strftime('%Y', market_date) as year
, strftime('%m', market_date) as month
FROM customer_purchases

/* 2. Using the previous query as a base, determine how much money each customer spent in April 2022. 
Remember that money spent is quantity*cost_to_customer_per_qty. 

HINTS: you will need to AGGREGATE, GROUP BY, and filter...
but remember, STRFTIME returns a STRING for your WHERE statement!! */

SELECT customer_id, sum(quantity*cost_to_customer_per_qty)
,strftime('%Y', market_date) as year
,strftime('%m', market_date) as month
FROM customer_purchases
WHERE 
year = '2022' AND month = '04'
GROUP BY customer_id