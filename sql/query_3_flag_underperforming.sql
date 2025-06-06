-- Query 3: Flag underperforming channels based on return rate threshold
WITH rate_table AS (
    SELECT
        ch.channel_name,
        EXTRACT(YEAR FROM o.order_date) AS order_year,
        ROUND(COUNT(DISTINCT CASE WHEN rn > 1 THEN o.order_id END) * 1.0 / 
              COUNT(DISTINCT o.order_id), 2) AS return_rate
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
        FROM orders
    ) o
    JOIN customers c ON o.customer_id = c.customer_id
    JOIN channels ch ON c.acquisition_channel_id = ch.channel_id
    GROUP BY 1, 2
)
SELECT *,
       CASE 
           WHEN return_rate < 0.30 THEN 'Underperforming'
           WHEN return_rate < 0.35 THEN 'Moderate'
           ELSE 'Strong'
       END AS performance_tier
FROM rate_table;
