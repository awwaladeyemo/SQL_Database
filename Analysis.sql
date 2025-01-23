SET SEARCH_PATH TO sales_transactions;

SELECT channel, COUNT(occurred_at)
FROM web_events
GROUP BY channel

SELECT web_events.occurred_at AS Date, web_events.channel, accounts.name AS Account_Name
FROM accounts
JOIN web_events
ON accounts.id = web_events.account_id
ORDER BY web_events.occurred_at DESC
LIMIT 1

SELECT sales_reps.name, web_events.channel, COUNT(web_events.occurred_at)
FROM sales_reps
JOIN accounts
ON  sales_reps.id = accounts.sales_rep_id
JOIN web_events
ON accounts.id = web_events.account_id
GROUP BY sales_reps.name, web_events.channel
ORDER BY COUNT(web_events.occurred_at) DESC

SELECT region.name AS region_name, sales_reps.name AS sales_rep_name, orders.total_amt
FROM region
JOIN sales_reps
ON sales_reps.region_id = region.id
JOIN accounts
ON  sales_reps.id = accounts.sales_rep_id
JOIN orders
ON accounts.id = orders.account_id
WHERE orders.total_amt < 200000 AND region.name = 'Northeast'
ORDER BY orders.total_amt DESC

SELECT accounts.name, AVG(orders.drinks_amt) AS average_spent_on_drinks, 
AVG(orders.groceries_amt) AS average_spent_on_groceries,
AVG(orders.electronics_amt) AS average_spent_on_electronics
FROM accounts
JOIN orders
ON accounts.id = orders.account_id
GROUP BY accounts.name



