--1. Orders in a specific city

SELECT order_id, amount_inr, category, city     
from orders
WHERE city = 'Hyderabad';


--2. List of every distinct category in orders table
SELECT distinct category
from products;


--3. The 5 highest-value orders by amount_inr
SELECT order_id, amount_inr, category, city
from orders
order by amount_inr desc
limit 5;


--4. renameing of an aggregate section
select 
  count(order_id) as total_orders,
  sum(amount_inr) as total_revenue
from orders;


--5. Orders whose payment_mode is in a 2-mode list
select *
from orders
where payment_mode in ('UPI', 'Cash on Delivery');


--6. a. BETWEEN (Orders with amount_inr within the range)
SELECT * 
FROM orders
WHERE amount_inr BETWEEN 100 AND 300;

--6. b. NOT BETWEEN (Orders with amount_inr not between the range)
SELECT * 
FROM orders
WHERE amount_inr NOT BETWEEN 100 AND 300;


--7. Orders with no rating recorded having null
SELECT * 
FROM orders
WHERE rating IS NULL;
