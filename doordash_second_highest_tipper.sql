-- For fun, lets rank the generous tippers

-- Orders table, customer table

-- tip percent customer wise (rank it). join with customer table

with cte_tips as (
Select
cust_id, (sum(tips)/ sum(order_amount - discount)) * 100.0 as tip_pc
from
Orders_dd
group by cust_id),

cte_tip_rank as 
(
Select 
cust_id , tip_pc ,dense_rank() over (order by tip_pc desc) as dr
from
cte_tips)

Select 
c.name, concat(ctr.tip_pc,'%') as tip_pc
from Customers_dd as c
left join
cte_tip_rank as ctr
on
c.id = ctr.cust_id
where dr = 2


