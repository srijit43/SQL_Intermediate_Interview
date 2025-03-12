-- total revenue per restaurant

-- order_amount - discount = restro_revenue
-- total_amount - discount = cust_cost
-- tips = dasher

with restro_rev as (
Select 
restaurant_id, sum(order_amount - discount) as total_revenue
from
orders_dd 
group by 
restaurant_id)

Select
r.id, r.restro_name, c.total_revenue
from
Restaurants_dd as r
left join
restro_rev as c
on 
r.id = c.restaurant_id
order by c.total_revenue desc


