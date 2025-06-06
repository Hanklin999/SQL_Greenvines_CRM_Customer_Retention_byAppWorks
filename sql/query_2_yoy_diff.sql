-- Query 2: Calculate YoY difference in return rate by channel
WITH base AS (
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
SELECT 
    b1.channel_name,
    b1.return_rate AS rate_2021,
    b2.return_rate AS rate_2022,
    ROUND(b2.return_rate - b1.return_rate, 2) AS yoy_diff
FROM base b1
JOIN base b2 ON b1.channel_name = b2.channel_name
WHERE b1.order_year = 2021 AND b2.order_year = 2022;
