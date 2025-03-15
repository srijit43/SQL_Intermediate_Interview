-- Rolling Total Revenue Per Restaurant

-- tables to use: Orders_dd , restuarants_dd

-- we shall write a cte with window function sum to calculate rolling average
-- we shall do a join with restaurant to grab names

SELECT 
    o.restaurant_id, 
    r.restro_name AS restaurant_name,  -- Fix column name
    o.order_time, 
    (o.order_amount - o.discount) AS total_order_amount,  -- Avoid alias confusion
    SUM(o.order_amount - o.discount) OVER (
        PARTITION BY o.restaurant_id 
        ORDER BY o.order_time 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
FROM Orders_dd o
JOIN Restaurants_dd r ON o.restaurant_id = r.id
ORDER BY o.restaurant_id, o.order_time;






with cte as (
select
restaurant_id, (order_amount - discount) as revenue,
sum(order_amount - discount) over (PARTITION BY restaurant_id 
        ORDER BY order_time 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as cummulative_revenue
from
orders_dd)

Select
c.restaurant_id, r.restro_name, c.revenue, c.cummulative_revenue
from
Restaurants_dd as r
left join
cte as c
on
r.id = c.restaurant_id


