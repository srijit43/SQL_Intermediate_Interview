/*Create table Employeeskv
(
 ID int primary key identity,
 FirstName nvarchar(50),
 LastName nvarchar(50),
 Gender nvarchar(50),
 Salary int
)
GO

Insert into Employeeskv values ('Ben', 'Hoskins', 'Male', 70000)
Insert into Employeeskv values ('Mark', 'Hastings', 'Male', 60000)
Insert into Employeeskv values ('Steve', 'Pound', 'Male', 45000)
Insert into Employeeskv values ('Ben', 'Hoskins', 'Male', 70000)
Insert into Employeeskv values ('Philip', 'Hastings', 'Male', 45000)
Insert into Employeeskv values ('Mary', 'Lambeth', 'Female', 30000)
Insert into Employeeskv values ('Valarie', 'Vikings', 'Female', 35000)
Insert into Employeeskv values ('John', 'Stanmore', 'Male', 80000)*/

-- select highest salary
 
Select max(salary) from employeeskv
where salary not in (Select max(salary) from employeeskv)


-- select third highest salary without CTE

Select top 1 salary as third_highest_salary from
(Select distinct top 3 Salary
from Employeeskv 
order by salary desc)result
order by salary

-- using CTE and window function

with cte as(
Select *,
DENSE_RANK() over(order by salary desc) as dr
from Employeeskv)

Select * from cte where dr = 3

-- 
