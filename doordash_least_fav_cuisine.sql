-- most seldom ordered cuisine

-- for this we need orders table and restaurant table

-- Approach

-- find restro_id and count orders from restaurant
-- join with restaurant table and find the cuisine

with most_ordered as (
Select
restaurant_id , count(*) as order_count
from
orders_dd
group by restaurant_id
)

Select top 1
r.restro_name, r.cuisine_type, c.order_count
from
restaurants_dd as r
left join
most_ordered as c
on
r.id = c.restaurant_id
order by order_count 

