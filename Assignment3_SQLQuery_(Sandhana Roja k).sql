use assignment;

--1. Create an ‘Orders’ table which comprises of these columns: ‘order_id’,‘order_date’, ‘amount’, ‘customer_id’.
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    customer_id INT
);

--2 Insert 5 new record
INSERT INTO Orders (order_id, order_date, amount, customer_id)
VALUES
    (1, '2023-08-28', 150.00, 101),
    (2, '2023-08-27', 75.50, 102),
    (3, '2023-08-26', 200.25, 103),
    (4, '2023-08-25', 50.00, 104),
    (5, '2023-08-24', 300.75, 105);

--3.Make an inner join on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column.
select * from customer_table c inner join Orders o on c.customer_id=o.customer_id;

--4.Make left and right joins on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ 
select * from customer_table c left join   Orders o on c.customer_id=o.customer_id ;
select * from customer_table c right join   Orders o on c.customer_id=o.customer_id ;

--5.Make a full outer join on ‘Customer’ and ‘Orders’ table on the ‘customer_id’ column
select * from customer_table c full outer join orders o on c.customer_id=o.customer_id ;

--6.Update the ‘Orders’ table and set the amount to be 100 where‘customer_id’ is 3
update Orders set amount=100 where customer_id=103;

select* from Orders;