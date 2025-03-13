-- Dasher Efficiency: Fastest Avg. Delivery Time per Order (Min 3 Orders)

-- Orders table, dashers table

-- Filter order/dasher >= 3 and avg time
-- then find who it is

with cte_dasher_speed as (
Select
dasher_id, count(*) as orders_delivered,
avg(datediff(minute, order_time, delivered_time)) as avg_delivery_speed
from
orders_dd
group by dasher_id
having count(*) >=3),

cte_rank as (
Select
d.dasher_name, c.orders_delivered, c.avg_delivery_speed,
dense_rank() over ( order by c.avg_delivery_speed) as dr
from
Dashers_dd as d
inner join
cte_dasher_speed as c
on
d.id = c.dasher_id)

Select * from cte_rank where dr = 2