/* Query to create and fill tables */

-- table creation

CREATE TABLE Restaurants_dd (
    id INT,
    restro_name varchar(100),
    cuisine_type VARCHAR(50)
);

CREATE TABLE Customers_dd (
    id INT,
    customer_name VARCHAR(100),
    flag_loyalty_member BIT
);

CREATE TABLE Dashers_dd (
    id INT,
    dasher_name VARCHAR(100)
);

-- drop table if exists orders_dd;
CREATE TABLE Orders_dd (
    order_id INT,
    restaurant_id INT,
    cust_id INT,
    dasher_id INT,
    order_time DATETIME,
    delivered_time DATETIME,
);


-- values inserted

-- Insert data into Restaurants
INSERT INTO Restaurants_dd (id, restro_name, cuisine_type) VALUES
(1, 'Pizza Palace', 'Italian'),
(2, 'Sushi World', 'Japanese'),
(3, 'Taco Town', 'Mexican'),
(4, 'Burger Haven', 'American');

INSERT INTO Customers_dd (id, name, flag_loyalty_member) VALUES
(1, 'Alice Johnson', 1),
(2, 'Bob Smith', 0),
(3, 'Charlie Lee', 1),
(4, 'David Kim', 0);


-- Insert data into Dashers
INSERT INTO Dashers_dd (id, dasher_name) VALUES
(1, 'Eve Brown'),
(2, 'Frank White'),
(3, 'Grace Green');


-- Insert data into Orders
INSERT INTO Orders_dd (order_id, restaurant_id, cust_id, dasher_id, order_time, delivered_time) VALUES
(1, 1, 1, 1, '2024-03-10 12:00:00', '2024-03-10 12:18:00'),
(2, 2, 2, 2, '2024-03-10 12:15:00', '2024-03-10 12:42:00'),
(3, 3, 3, 1, '2024-03-10 12:30:00', '2024-03-10 13:10:00'),
(4, 4, 4, 3, '2024-03-10 13:00:00', '2024-03-10 13:27:00'),
(5, 1, 2, 2, '2024-03-10 13:15:00', '2024-03-10 13:35:00'),
(6, 3, 4, 1, '2024-03-10 13:30:00', '2024-03-10 14:05:00'),
(7, 2, 3, 3, '2024-03-10 14:00:00', '2024-03-10 14:20:00'),
(8, 4, 1, 2, '2024-03-10 14:15:00', '2024-03-10 14:50:00'),
(9, 1, 3, 1, '2024-03-10 14:30:00', '2024-03-10 15:08:00'),
(10, 2, 4, 3, '2024-03-10 15:00:00', '2024-03-10 15:40:00'),
(11, 3, 2, 2, '2024-03-10 15:30:00', '2024-03-10 15:55:00'),
(12, 4, 1, 1, '2024-03-10 16:00:00', '2024-03-10 16:33:00');

