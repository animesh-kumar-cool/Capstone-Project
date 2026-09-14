--Table Row Counts Check

SELECT count(*) as toatl_orders
from orders;

SELECT count(*) as toatl_products
from products;

SELECT count(*) as total_customers
from customers;

SELECT count(*) as total_category_targets
from category_targets;

--Orders Status

SELECT status, count(*) as total_orders_status
from orders
group by status;
