--a. INNER JOIN
        SELECT p.category,
            COUNT(o.order_id) AS total_orders_per_category,
            SUM(o.amount_inr) AS total_revenue,
            AVG(o.amount_inr) AS avg_revenue
        FROM orders AS o
        INNER JOIN products AS p 
            ON o.product_id = p.product_id
        WHERE o.status = 'Delivered'
        GROUP BY p.category
        HAVING total_revenue > 10000;

    

    --b. LEFT JOIN
        SELECT p.product_id,
            p.product_name, 
            COUNT(o.order_id) AS total_orders_per_product
        FROM products AS p
        LEFT JOIN orders AS o
            on o.product_id = p.product_id
        GROUP BY p.product_name, p.product_id
        ORDER BY total_orders_per_product ASC;
