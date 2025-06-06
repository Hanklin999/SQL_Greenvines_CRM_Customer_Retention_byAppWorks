-- Query 2: Calculate YoY difference in return rate by channel
WITH return_rates AS (
  SELECT
    nc.FirstTransactionYear AS Year,
    nc.FirstChannel AS Channel,
    COUNT(DISTINCT nc.CustomerId) AS TotalNewCustomers,
    COUNT(DISTINCT o.CustomerId) AS ReturningCustomers,
    ROUND(COUNT(DISTINCT o.CustomerId) * 1.0 / COUNT(DISTINCT nc.CustomerId), 2) AS ReturnRate
  FROM Customers nc
  LEFT JOIN Orders o
    ON nc.CustomerId = o.CustomerId
    AND o.TransactionYear = nc.FirstTransactionYear
    AND o.TransactionDate > nc.FirstTransactionDate
  WHERE nc.FirstTransactionYear IN (2021, 2022)
  GROUP BY nc.FirstTransactionYear, nc.FirstChannel
),
pivoted AS (
  SELECT
    Channel,
    MAX(CASE WHEN Year = 2021 THEN ReturnRate END) AS ReturnRate_2021,
    MAX(CASE WHEN Year = 2022 THEN ReturnRate END) AS ReturnRate_2022
  FROM return_rates
  GROUP BY Channel
)
SELECT *,
  ROUND(ReturnRate_2022 - ReturnRate_2021, 2) AS YoY_Change
FROM pivoted
ORDER BY YoY_Change;
