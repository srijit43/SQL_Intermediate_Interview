-- most recent hire

CREATE TABLE hiring_table (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    hiring_date DATE
);

-- Insert 10 records
INSERT INTO hiring_table (emp_id, name, salary, hiring_date)
VALUES
(1, 'John Doe', 55000.00, '2022-05-10'),
(2, 'Jane Smith', 62000.00, '2021-11-15'),
(3, 'Michael Johnson', 58000.00, '2023-02-20'),
(4, 'Emily Davis', 49500.00, '2020-09-30'),
(5, 'David Wilson', 75000.00, '2019-12-12'),
(6, 'Sarah Brown', 68000.00, '2022-03-01'),
(7, 'James Taylor', 72000.00, '2021-08-22'),
(8, 'Patricia Anderson', 51000.00, '2023-06-05'),
(9, 'Robert Moore', 48000.00, '2020-04-18'),

-- select * from hiring_table

Select emp_id, name, salary, datediff(year,hiring_date, getdate()) as dif
from hiring_table
where 
datediff(year,hiring_date, getdate()) between 1 and 3
