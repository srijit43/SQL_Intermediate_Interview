/* Write a query to calculate the total claim amount per policy type and the average claim amount per policy type for all approved claims. */

-- step 1: Find the table ( Policies table)
-- step 2: total and average group by policy type

Select
policy_type, sum(premium_amount) as total_amount, avg(premium_amount) as avg_amount
from
policies_pl
group by policy_type

/* Rank Customers by Total Claim Amount */

-- Step 1: join customer table and claims get customerId, name and amount
-- Step 2: Rank the totals by order

With cte as 
(
Select
cu.customer_id, cu.name, cl.claim_amount
from
customers_pl as cu
left join
claims_pl as cl
on
cu.customer_id = cl.customer_id
),

cte2 as (
Select 
customer_id, name, sum(claim_amount) as sum_amount
from cte
group by customer_id, name
)

Select 
customer_id, name, dense_rank() over (order by sum_amount desc) as dr
from cte2