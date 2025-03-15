-- Customers who spent above average

-- Orders_dd, customers_dd

-- Find the average and use a cte, then find customers who spent more than average, join the list with the customers

WITH Avg_Total AS (
    SELECT AVG(total_amount) AS avg_spent FROM Orders_dd
)
SELECT 
    o.cust_id, 
    c.name AS customer_name, 
    SUM(o.total_amount) AS total_spent
FROM Orders_dd o
JOIN Customers_dd c ON o.cust_id = c.id
GROUP BY o.cust_id, c.name
HAVING SUM(o.total_amount) > (SELECT avg_spent FROM Avg_Total)
ORDER BY total_spent DESC;