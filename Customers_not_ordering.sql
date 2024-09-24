/*Create table  Customersx (id int, name varchar(255))
Create table Ordersx (id int, customerId int)
-- Truncate table Customers
insert into Customersx (id, name) values ('1', 'Joe')
insert into Customersx (id, name) values ('2', 'Henry')
insert into Customersx (id, name) values ('3', 'Sam')
insert into Customersx (id, name) values ('4', 'Max')
-- Truncate table Orders
insert into Ordersx (id, customerId) values ('1', '3')
insert into Ordersx (id, customerId) values ('2', '1')*/

Select * from Customersx
Select * from ordersx

select c.id, c.name
from customersx c
left join
ordersx o
on c.id = o.customerid
where c.id not in (Select customerID from ordersx)

