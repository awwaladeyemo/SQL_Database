SET SEARCH_PATH TO sales_transactions

--ASSIGNMENT
--TASK 1 SELECT & FROM

SELECT *
FROM accounts;

SELECT *
FROM web_events;

--TASK 2 SELECT NEEDED COLUMNS
SELECT id, account_id, total_amt
FROM orders;

SELECT occurred_at, channel
FROM web_events;

--TASK 3 LIMIT CLAUSE
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;

--TASK 4 ORDER BY
SELECT id, occurred_at, total_amt
FROM orders
ORDER BY occurred_at
LIMIT 15;

SELECT id, total_qty, total_amt
FROM orders
ORDER BY total_qty
LIMIT 20;

--TASK 6 (NO TASK 5) WHERE CLAUSE
--who is the primary point of contact for Exxon Mobil and extract the website name
SELECT id, name, primary_poc, website
FROM accounts
WHERE name = 'Exxon Mobil';

--How many order transactions occurred where customers failed to purchase drinks?
SELECT *
FROM orders
WHERE drinks_amt = 0;

--How many customer transactions ordered for over 1000 Electronics products.
SELECT *
FROM orders
WHERE electronics_qty > 1000
ORDER BY electronics_qty;

--TASK 7 LIKE\ILIKE
--You have been tasked to get a company’s website that starts with “citi”.
--NO OUTPUT because no websites starts with city
SELECT name, website
FROM accounts
WHERE website ILIKE 'city%'

--primary_poc which has the text “her” after the first letter and ended with other characters.
SELECT id, name, primary_poc
FROM accounts
WHERE primary_poc ILIKE '_her%';

--TASK 8 IN OPERATOR
--where drinks ordered for was between 1 and 3 quantities
SELECT id, account_id, drinks_qty
FROM orders
WHERE drinks_qty IN ('1', '2', '3');

--highest quantity ordered by these account_id
--3011, 2401, and 2061 (Order By is required)?
SELECT account_id, total_qty
FROM orders
WHERE account_id IN ('3011', '2401', '2061')
ORDER BY total_qty DESC

--TASK 9 NOT OPERATOR (NOT SURE)
SELECT name, id
FROM accounts
WHERE name NOT LIKE 'A%'
ORDER BY name;

--TASK 10 AND OPERATOR
SELECT drinks_qty, electronics_qty, total_amt
FROM orders
WHERE drinks_qty < 100 AND electronics_qty > 1000 AND total_amt > 10000
ORDER BY total_amt;


SELECT id, name
FROM accounts
WHERE name ILIKE 'C%' AND name ILIKE '%s'
ORDER BY name;

--TASK 11
SELECT total_amt, occurred_at
FROM orders
WHERE occurred_at BETWEEN 2016-01-01 00:00:00 AND 2016-01-01 23:59:59
ORDER BY total_amt
LIMIT 5;

--TASK 12 OR OPERATOR
SELECT name, primary_poc
FROM accounts
WHERE name ILIKE 'C%' OR name ILIKE 'W' 
AND (primary_poc ILIKE '%ANA%' OR  primary_poc NOT LIKE 'ant');

SELECT id, account_id, drinks_qty, electronics_qty 
FROM orders
WHERE account_id = 1001 OR account_id = 2671 
AND (drinks_qty > 500 OR electronics_qty > 1000)

 --TASK 13 GROUP BY ANG HAVING CLAUSE
 --A
SELECT sales_rep_id, COUNT (name) 
FROM accounts
GROUP BY sales_rep_id
ORDER BY COUNT (sales_rep_id) DESC

--B
SELECT name, id
FROM sales_reps
WHERE id = 321970

SELECT account_id COUNT (channel)
FROM web_events
WHERE channel > 500
GROUP BY account_id
HAVING SUM(channel) > 500;


--TASK 14
SELECT *
FROM web_events
JOIN accounts
ON accounts.id = web_events.account_id;

SELECT accounts.name AS customer_name,
accounts.sales_rep_id,
sales_reps.name AS sales_rep_name
FROM sales_reps
JOIN accounts
ON sales_reps.id = accounts.sales_rep_id;


--TACK 15
SELECT region.name AS region, sales_reps.name AS sales_rep, accounts.name AS customer
FROM region
JOIN sales_reps
ON sales_reps.region_id = region.id
JOIN accounts
ON  sales_reps.id = accounts.sales_rep_id;

--TASK 16
SELECT orders.id AS order_id, region.name AS region_name,
accounts.name AS customer_name, orders.total_amt AS amt_paid
FROM region
JOIN sales_reps
ON sales_reps.region_id = region.id
JOIN accounts
ON  sales_reps.id = accounts.sales_rep_id
JOIN orders
ON accounts.id = orders.account_id

--NOT SURE
SELECT accounts.name, web_events.channel, COUNT(orders.id)
FROM accounts
JOIN web_events
ON accounts.id = web_events.account_id
JOIN orders
ON accounts.id = orders.account_id
GROUP BY accounts.name, web_events.channel
HAVING web_events.channel = 'direct' AND web_events.channel = 'facebook'

--TASK 18
SELECT SUM(total_amt)
FROM orders

SELECT account_id, total_qty
FROM orders
WHERE account_id = 2671 AND account_id = 2671

--TASK 19
SELECT MIN(total_qty) AS min_qty, MAX(total_qty) AS max_qty
FROM orders





