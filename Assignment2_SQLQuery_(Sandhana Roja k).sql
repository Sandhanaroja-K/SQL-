create database Assignment;
use Assignment;

----Assignment-2
---1. Create a customer table which comprises of these columns: ‘customer_id’,
‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’
create table customer_table 
(
 customer_id int not null,
 first_name varchar(50),
 last_name varchar(50),
 email varchar(100),
 address varchar(250),
 city varchar(15),
 state varchar(15),
 zip int not null
);

---2.Insert 5 new records into the table
insert into customer_table values
(101,'Aravind','Kumar','aravindkumar101@yahoo.com','3rd Floor, 576, J S S Road, Chira Bazar, Kalbadevi','Mumbai','Maharastra', 400002),
(102,'Sarah','pillai','sara2012@gmail.com','no.165,main Market,Sarojini Nagar','Delhi',' Delhi', 110023),
(103,'Gokul','kandasamy','gokulkanda@gmail.com','no.165, Kamala Nagar Market, Sarojini Nagar', 'Delhi',' Delhi', 110023),
(104,'Gowtham','raj','gowraj09@gmail.com','no.40, peterson street','San jose','California', 94089),
(105,'Sandy','peter','sandypeter878@yahoo.com','11-4-106/7, Red Hills','Hyderabad',' Andhra pradesh', 500004);
---3. Select only the ‘first_name’ and ‘last_name’ columns from the customertable
select first_name,last_name from customer_table;

---4. Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’
select [customer_id],[first_name],[last_name],[email],[address] ,[city],[state],[zip]from customer_table 
where first_name like 'G%' and city='san jose';

---5.Select those records where Email has only ‘gmail'
select[customer_id],[first_name],[last_name],[email],[address] ,[city],[state],[zip]from customer_table 
where email like '%%@gmail.com';

---6.Select those records where the ‘last_name’ doesn't end with “A”
select[customer_id],[first_name],[last_name],[email],[address] ,[city],[state],[zip]from customer_table 
where last_name not like '%%a';