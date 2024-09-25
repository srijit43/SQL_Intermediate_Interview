Create table EmployeesHR
(
 EmployeeID int primary key identity,
 EmployeeName nvarchar(50),
 ManagerID int foreign key references EmployeesHR(EmployeeID)
)
GO

Insert into EmployeesHR values ('John', NULL)
Insert into EmployeesHR values ('Mark', NULL)
Insert into EmployeesHR values ('Steve', NULL)
Insert into EmployeesHR values ('Tom', NULL)
Insert into EmployeesHR values ('Lara', NULL)
Insert into EmployeesHR values ('Simon', NULL)
Insert into EmployeesHR values ('David', NULL)
Insert into EmployeesHR values ('Ben', NULL)
Insert into EmployeesHR values ('Stacy', NULL)
Insert into EmployeesHR values ('Sam', NULL)
GO

Update EmployeesHR Set ManagerID = 8 Where EmployeeName IN ('Mark', 'Steve', 'Lara')
Update EmployeesHR Set ManagerID = 2 Where EmployeeName IN ('Stacy', 'Simon')
Update EmployeesHR Set ManagerID = 3 Where EmployeeName IN ('Tom')
Update EmployeesHR Set ManagerID = 5 Where EmployeeName IN ('John', 'Sam')
Update EmployeesHR Set ManagerID = 4 Where EmployeeName IN ('David')
GO

-- Here is the SQL that does the job
Declare @ID int ;
Set @ID = 7;

WITH EmployeeCTE AS
(
 Select EmployeeId, EmployeeName, ManagerID
 From EmployeesHR
 Where EmployeeId = @ID
 
 UNION ALL
 
 Select EmployeesHR.EmployeeId , EmployeesHR.EmployeeName, EmployeesHR.ManagerID
 From EmployeesHR
 JOIN EmployeeCTE
 ON EmployeesHR.EmployeeId = EmployeeCTE.ManagerID
)

Select E1.EmployeeName, ISNULL(E2.EmployeeName, 'No Boss') as ManagerName
From EmployeeCTE E1
LEFT Join EmployeeCTE E2
ON E1.ManagerID = E2.EmployeeId