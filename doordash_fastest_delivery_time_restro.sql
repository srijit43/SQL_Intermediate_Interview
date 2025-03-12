-- Rank orders by delivery time within each restaurant.

-- For this we need orders table and restaurant table

-- Approach

-- 1. create a cte to rank orders based on delivery time
-- 2. left join to get restaurant name

with rank_del as (
Select
order_id,restaurant_id, datediff(minute, order_time, delivered_time) as delivery_time,
dense_rank() over (partition by restaurant_id order by datediff(minute, order_time, delivered_time)) as dr
from
orders_dd

)

Select 
r.restro_name, c.order_id, c.delivery_time
from
restaurants_dd as r
left join
rank_del as c
on
r.id = c.restaurant_id
where dr = 1
order by c.delivery_time