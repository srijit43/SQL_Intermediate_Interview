-- Find loyalty customers with highest number of orders

-- okay so tables needed are customers, orders

-- approach

-- 1. find orders per customer
-- 2. return the name of cust whose flag = 1

with cte as (
Select 
cust_id, count(order_id) as no_of_orders
from 
orders_dd
group by cust_id
)

Select top 1
cs.id, cs.name, ct.no_of_orders
from
customers_dd as cs
left join 
cte as ct
on
cs.id = ct.cust_id
where cs.flag_loyalty_member = 1
order by 
ct.no_of_orders desc

