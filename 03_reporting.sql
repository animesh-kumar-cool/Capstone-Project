--TASK -5
    --a.

        SELECT p.product_id,
            p.product_name,
            count(o.order_id) as total_order_per_product,
            SUM(o.amount_inr) as total_Delivered_revenue,
            CASE 
                WHEN SUM(o.amount_inr) >= 3000 THEN 'High' 
                WHEN SUM(o.amount_inr) >= 1000 THEN 'Medium' 
                ELSE 'Low' 
            END as orders_category
        from orders as o
        left join products as p
            on o.product_id = p.product_id
        where o.status = 'Delivered'
        group by p.product_name;




    --b.
        SELECT p.category,
            strftime('%Y-%m', order_date) as month,
            COUNT(o.order_id) as order_count,
            sum(o.amount_inr) as total_revenue,
            round(avg(o.amount_inr), 2) as avg_revenue
        from orders as o
        LEFT JOIN products as p
            ON o.product_id = p.product_id
        where status = 'Delivered'
        group by p.category, month
        order by p.category, month;



    --c.
        SELECT 
            ct.category,
            ct.target_revenue_inr,
            SUM(o.amount_inr) AS total_revenue,
            ct.target_revenue_inr - SUM(o.amount_inr) AS variance,
            ROUND(((SUM(o.amount_inr) - ct.target_revenue_inr) * 100.0) / ct.target_revenue_inr, 2) AS percentage_variance,
            CASE 
                WHEN SUM(o.amount_inr) >= ct.target_revenue_inr THEN 'Above Target'
                WHEN ((SUM(o.amount_inr) - ct.target_revenue_inr) * 100.0) / ct.target_revenue_inr >= -15.0 THEN 'Below Target - Watch'
                ELSE 'Below Target - Critical'
            END AS status
        FROM category_targets ct
        JOIN products p ON ct.category = p.category
        JOIN orders o ON p.product_id = o.product_id
        WHERE o.status = 'Delivered'
        GROUP BY ct.category, ct.target_revenue_inr;
