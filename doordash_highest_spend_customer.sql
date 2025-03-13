-- top 3 highest spending customers after discounts

-- for this we need orders table, customers table

-- 1. find the highest spent for each customer
-- 2. perform a join to get customer name

with spend_cte as (
Select 
cust_id, sum(total_amount - discount) as final_total
from
orders_dd
group by cust_id)

Select top 3
c.name, s.final_total
from
Customers_dd as c
left join
spend_cte as s
on
c.id = s.cust_id
order by s.final_total desc