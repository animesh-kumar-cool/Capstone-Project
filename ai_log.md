RCTCF Promt #1

Role        -   You are an Expert of SQL guiding me as junior to perform activity in SQL project.
Context     -   I have two tables, orders and products in which orders table has columns order_id, order_date, customer_name, city, product_id, quantity, amount_inr, payment_mode, status, rating present and products table has columns product_id, product_name, category, supplier
Task        -   Give the SQL Query to determine total orders, total generated profit value and its average value for each product category that have generated more than 10000 revenue for delivered orders only.
Constraints -   Only SELECT, FROM, JOIN, WHERE, GROUP BY, HAVING, LIMIT. No subqueries or advanced approaches
Format      -   SQL only, then a line-by-line plain-English explanation


From above promt i have got below SQL code:- 

SELECT
    p.category,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS average_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category
HAVING SUM(o.amount_inr) > 10000;


In the above code all the cluse are in proper place and in sequence, aggration and alis are also meaning full, filtered in status for Delivered orders only and generated more than 10000 are in HAVING. And grouped by with category.

Got the Below result that is correct as per our need. 

╭──────────────────────┬──────────────────────┬───────────────┬────────────────────╮
│       category       │ total_orders_per_... │ total_revenue │    avg_revenue     │
╞══════════════════════╪══════════════════════╪═══════════════╪════════════════════╡
│ Bakery               │                   67 │         15410 │              230.0 │
│ Dairy & Eggs         │                   66 │         14090 │             213.48 │
│ Household Essentials │                   79 │         21715 │             274.87 │
╰──────────────────────┴──────────────────────┴───────────────┴────────────────────╯




RCTCF PROMT #2
Role 		-	You are an expert of python, guiding me as a junior to perform data analyst’s projects.
Context 	- 	I have an ordered data frame having column name amount_inr and status. In amount_inr has not the null value.
Task 		-	For status = ‘Delivered’ want to compute Q1 (25th percentile) and Q3 (75th percentile) and apart from that also compute IQR = Q3 - Q1, and the upper fence Q3 + 1.5*IQR for orders data frame. also Capped the values above the upper fence
Constraints	- 	use only orders data frame, .quantile() for computing percentiles and .clip(upper=...) to cap the values above the upper fence. Don’t give advanced python code.
Format	    -	python pandas code only, then a line-by-line plain-English explanation.

From above promt i have got below python pandas code:-

In the above code all the code are in sequence whatever given in Constraints sections

Got the Below result that is correct as per our need

Q1: 90.0, Q3: 280.0, IQR: 190.0
Upper Fence: 565.0
The total Capped count is 16 outlier values at 565.0

