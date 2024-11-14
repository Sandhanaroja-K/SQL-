use[Assignment]

---Transaction,View,Exceptional handling

--1.Create a view named ‘customer_san_jose’ which comprises of only those
--   customers who are from San Jose
create view customer_san_jose as
select* from customer_table 
where city='san jose';

select* from customer_san_jose;

  
--2. Inside a transaction, update the first name of the customer to Francis  where the last name is Jordan:
begin try
     begin transaction
	 update customer_table set first_name='Francis' where last_name='jordan'
	 commit transaction
	 print'Transaction committed'
end try
begin catch
     rollback transaction
	 print'Transaction rollbacked'
end catch
--   a. Rollback the transaction
begin try
     begin transaction
	 update customer_table set first_name='Francis' where last_name=123
	 commit transaction
	 print'Transaction committed'
end try
begin catch
     rollback transaction
	 print'Transaction rollbacked'
end catch

--   b. Set the first name of customer to Alex, where the last name is Jordan
begin try
     begin transaction
	 update customer_table set first_name='Alex' where last_name='jordan'
	 commit transaction
	 print'Transaction committed'
end try
begin catch
      rollback transaction
	  print'transaction rollbacked'
end catch;

select* from customer_table;
--3. Inside a TRY... CATCH block, divide 100 with 0, print the default error message. 
begin try
     begin transaction
	 declare @num int
	 set @num=100/0
	 commit transaction
	 print'Transaction committed'
end try
begin catch
     rollback transaction
	 print error_message()
end catch;
--4. Create a transaction to insert a new record to Orders table and save it.

begin transaction 
insert into Orders values
(6,	'2023-08-31',	350.75	,106),
(7,	'2023-08-29',	470.50	,107),
(8,	'2023-08-28',	425.00	,108)
save transaction modified_orders;

 
 select* from orders; 
 
