use [Assignment]

select* from Orders;

--1.Use the inbuilt functions and find the minimum, maximum and average amount from the orders table
select
    min(amount)as minimum_amount,
	max(amount)as maximum_amount,
	avg(amount)as average_amount 
from Orders;

--2.Create a user-defined function which will multiply the given number with 10
create function multiply_by_ten (@number int)
returns int
as
begin
    return @number*10
end;

select dbo. multiply_by_ten(3)as multiplied_by_ten; ---Returns 30


---3.Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and print the corresponding value.

select 
    case
	  when 100<200 then  'Less than 200'
	  when 100>200 then 'Greater than 200'
	  when 100=200 then 'Equal to 200'
end as result;


--4. Using a case statement, find the status of the amount. Set the status of the
-----amount as high amount, low amount or medium amount based upon the
-----condition.
select * from Orders;
select customer_id,amount,
    case 
	  when amount<100 then 'Low amount'
	  when amount between 100 and 200 then 'Medium amount'
	  when amount>200 then 'High amount'
end as Result
from Orders;

---5. Create a user-defined function, to fetch the amount greater than then giveninput.

create function fetches(@input_amount decimal(10,2))
returns table
as
return
(
   select customer_id,amount from Orders
   where amount>@input_amount
);
select* from dbo.fetches(100);