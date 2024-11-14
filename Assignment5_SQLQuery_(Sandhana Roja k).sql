use[Assignment]

--1. Arrange the ‘Orders’ dataset in decreasing order of amount
select * from Orders order by  amount desc;


--2. Create a table with the name ‘Employee_details1’ consisting of these
--columns: ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table with
--the name ‘Employee_details2’ consisting of the same columns as the first
--table.

create table Employee_details1
(Emp_id int primary key,
 Emp_name varchar(50),
 Emp_salary decimal(10,2));

create table Employee_details2
(Emp_id int primary key,
 Emp_name varchar(50),
 Emp_salary decimal(10,2));

 -- Inserting values into Employee_details1
insert into Employee_details1 (Emp_id, Emp_name, Emp_salary)
values
    (1, 'John Doe', 50000.00),
    (2, 'Alice Johnson', 55000.00),
    (3, 'Michael Smith', 60000.00),
    (4, 'Emily Brown', 52000.00),
    (5, 'David Lee', 58000.00);


-- Inserting values into Employee_details2
insert into Employee_details2 (Emp_id, Emp_name, Emp_salary)
values
    (1, 'Jane Smith', 60000.00),
    (2, 'Robert Williams', 62000.00),
    (3, 'Linda Davis', 55000.00),
    (4, 'Daniel Wilson', 58000.00),
    (5, 'Jennifer Miller', 59000.00);

 
select*from Employee_details1;
select*from Employee_details2;

 --3.Apply the UNION operator on these two tables
 select Emp_id, Emp_name, Emp_salary from Employee_details1
 union
 select Emp_id, Emp_name, Emp_salary from Employee_details2;
  
--4. Apply the INTERSECT operator on these two tables
 select Emp_id, Emp_name, Emp_salary from Employee_details1
 intersect
 select Emp_id, Emp_name, Emp_salary from Employee_details2;

--5. Apply the EXCEPT operator on these two tables
 select Emp_id, Emp_name, Emp_salary from Employee_details1
 except
 select Emp_id, Emp_name, Emp_salary from Employee_details2;

