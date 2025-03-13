-- dasher with best average tip percentage

-- orders table, dasher table

-- get total_tip / total_amount of the order per dasher
-- join with dasher table to get name

with cte as (
Select
dasher_id, (sum(tips)/sum(total_amount) * 100.0) as tip_percentage
from
orders_dd
group by dasher_id)

Select
d.dasher_name, concat(c.tip_percentage,'%') as tip_percent
from
Dashers_dd as d
left join
cte as c
on
d.id = c.dasher_id
order by c.tip_percentage desc