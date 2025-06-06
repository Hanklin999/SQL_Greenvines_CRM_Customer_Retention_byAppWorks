-- Query 1: Calculate retention rate by channel and year
WITH new_customers AS (
  SELECT
    CustomerId,
    FirstTransactionDate,
    FirstTransactionYear,
    FirstChannel
  FROM Customers
  WHERE FirstTransactionYear IN (2021, 2022)
),
return_stats AS (
  SELECT
    nc.FirstTransactionYear AS Year,
    nc.FirstChannel AS Channel,
    COUNT(DISTINCT nc.CustomerId) AS TotalNewCustomers,
    COUNT(DISTINCT o.CustomerId) AS ReturningCustomers,
    ROUND(COUNT(DISTINCT o.CustomerId) * 1.0 / COUNT(DISTINCT nc.CustomerId), 2) AS ReturnRate
  FROM new_customers nc
  LEFT JOIN Orders o
    ON nc.CustomerId = o.CustomerId
    AND o.TransactionYear = nc.FirstTransactionYear
    AND o.TransactionDate > nc.FirstTransactionDate
  GROUP BY nc.FirstTransactionYear, nc.FirstChannel
)
SELECT *
FROM return_stats
ORDER BY Year, ReturnRate DESC;
