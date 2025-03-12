-- Find average delivery time for each resaurant

-- For this we need restaurants table and orders table, lets see them

Select top 5 * from restaurants_dd
Select top 5 * from orders_dd

-- we need to find avg delivery time ( cte)
-- fetch restro_name (join)

with avg_delivery_time as (

Select
restaurant_id, avg(datediff(minute, order_time, delivered_time)) as avg_del_time
from
orders_dd
group by restaurant_id
)

Select
r.id, r.restro_name, c.avg_del_time
from restaurants_dd as r
left join
avg_delivery_time as c
on
r.id = c.restaurant_id
order by c.avg_del_time