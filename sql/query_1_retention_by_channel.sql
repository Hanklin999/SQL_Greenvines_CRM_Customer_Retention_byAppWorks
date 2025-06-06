-- Query 1: Calculate retention rate by channel and year
SELECT
    c.acquisition_channel_id,
    ch.channel_name,
    EXTRACT(YEAR FROM o.order_date) AS order_year,
    COUNT(DISTINCT CASE WHEN rn = 1 THEN o.order_id END) AS first_orders,
    COUNT(DISTINCT CASE WHEN rn > 1 THEN o.order_id END) AS returning_orders,
    ROUND(COUNT(DISTINCT CASE WHEN rn > 1 THEN o.order_id END) * 1.0 / 
          COUNT(DISTINCT o.order_id), 2) AS return_rate
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM orders
) o
JOIN customers c ON o.customer_id = c.customer_id
JOIN channels ch ON c.acquisition_channel_id = ch.channel_id
GROUP BY 1, 2, 3;
