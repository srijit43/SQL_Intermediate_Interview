-- dasher with the fastest average delivery time
-- for this we will need dasher table and order table

-- approach

-- find average delivery time of dasher
-- do a left join ( why left join because I need all dashers even those who have not done a delivery)

with avg_delivery_time as (
Select
dasher_id, avg(datediff(minute, order_time, delivered_time)) as avg_del_time
from
orders_dd
group by dasher_id
)

Select
d.id, d.dasher_name, c.avg_del_time
from dashers_dd as d
left join
avg_delivery_time as c
on
d.id = c.dasher_id
order by c.avg_del_time