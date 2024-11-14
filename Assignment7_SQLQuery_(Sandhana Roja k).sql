use Assignment

create table programmers(
    pname  varchar(20) PRIMARY KEY,
	dob  date,
	doj  date,
	gender varchar(1),
	prof1 varchar(20),
	prof2 varchar(20),
	salary  int
);

--insert into programmers values
insert into programmers values
('anand', '1966-04-12','1992-04-21','m','pascal','basic',3200),
('altaf', '1964-07-02','1990-11-13','m','clipper','cobol',2800),
('juliana','1960-01-31','1990-04-21','f','cobol','dbase',3000),
('kamala', '1968-10-30','1992-01-02','f','c','dbase',2900),
('mary', '1970-06-24','1991-02-01','f','cpp','oracle', 4500),
('nelson', '1985-09-11','1989-10-11','m','cobol','dbase',2500),
('pattrick','1965-11-10','1990-04-21','m','pascal','clipper',2800),
('qadir', '1965-08-31','1991-04-21','m','assembly', 'c',3000),
('ramesh', '1967-05-03','1991-02-28','m','pascal','dbase',3200),
('rebecca', '1967-01-01','1990-01-01','f','basic','cobol',2500),
('remitha ', '1970-04-19','1993-04-20','f','c','assembly',3600),
('revathi','1969-12-02','1992-01-02','f', 'pascal','basic',3700),
('vijaya','1965-12-14','1992-05-02','f','foxpro','c',3500);

select* from programmers;

create table softwares(
    pname  varchar(20),
	title varchar(20),
	developin varchar(20),
	scost int,
	dcost int,
	sold int,
    FOREIGN KEY(pname) REFERENCES programmer(pname) ,
);

insert into softwares values
('mary','readme','cpp',300,1200,84),
('anand', 'parachutes','basic', 399.95,6000, 43),
('anand', 'videotitling','pascal', 7500, 16000, 9),
('juliana', 'inventory','cobol', 3000, 3500, 0),
('kamala', 'payrollpkg','dbase', 9000, 20000, 7),
('mary', 'financialacct','oracle', 18000, 85000, 4),	
('mary', 'codegenerator','c', 4500, 20000, 23),
('pattrick', 'readme','cpp', 300, 1200, 84),	
('qadir', 'bombsaway','assembly', 750, 3000, 11),	
('qadir', 'vaccines','c', 1900, 3100, 21),
('ramesh', 'hotelmgmt','dbase', 13000, 35000, 4),	
('ramesh', 'deadlee','pascal', 599.95, 4500, 73),	
('remitha', 'pcutilities','c', 725, 5000, 51),
('remitha', 'tsrhelppkg','assembly', 2500, 6000, 7),
('revathi', 'hotelmgmt','pascal', 1100, 75000, 2),
('vijaya', 'tsreditor','c', 900, 700, 6);

select* from softwares;

create table study(
    spname  varchar(20),
	institute varchar(20),
	course varchar(20),
	coursefee int ,
	constraint fk_pname 
    FOREIGN KEY(spname) REFERENCES programmers(pname)
);

insert into study values
('anand', 'sabhari', 'pgdca', 4500),
('altaf', 'coit', 'dca', 7200),
('juliana', 'bdps', 'mca', 22000),
('kamala', 'pragathi', 'dca', 5000),
('mary', 'sabhari', 'pgdca', 4500),
('nelson', 'pragathi', 'dap', 4500),
('pattrick', 'pragathi', 'dcap', 6200),
('qadir', 'apple', 'hdca', 14000),
('ramesh', 'sabhari', 'pgdca', 4500),
('rebecca', 'brilliant', 'dcap', 11000),
('remitha ', 'bdps', 'dcs', 6000),
('revathi', 'sabhari', 'dap', 5000),
('vijaya', 'bdps', 'dca', 48000);

select* from study;
select* from softwares;
select* from programmers;

--1. Find out the selling cost average for packages developed in Pascal.
select avg(scost)as average_scost_pascal from softwares where developin ='pascal';

--2. Display the names and ages of all programmers.
select pname,datediff(year,dob,getdate())as age from programmers;

--3. Display the names of those who have done the DAP Course.
select spname as DAP_done from study where course='DAP';

--4. Display the names and date of birth of all programmers born in January.
select pname,dob from programmers 
where dob like '_____01___';


--5. What is the highest number of copies sold by a package?
select max(sold) as highest_num_of_copies_sold 
from softwares;


--6. Display lowest course fee.
select min(coursefee)as lowest_coursefee from study;
--or
select course,coursefee as lowest_coursefee from study
where coursefee=(select min(coursefee)from study);

--7. How many programmers have done the PGDCA Course?
select count( spname ) from study
where course = 'PGDCA';

--8. How much revenue has been earned through sales of packages developed in C?
select sum(sold) as revenue_by_devinC from softwares 
where developin='c';

--9. Display the details of the software developed by Ramesh.
select [title], [developin], [scost], [dcost], [sold] from softwares 
where pname='ramesh';


--10. How many programmers studied at Sabhari?
select count(spname)as studied_@sabhari from study
where institute='sabhari';


--11. Display details of packages whose sales crossed the 2000 mark.
select*from softwares 
where(sold*scost)>2000;

--12. Display the details of packages for which development costs have been recovered.
select * from softwares where (sold*scost)>=dcost;


--13. What is the cost of the costliest software development in Basic?
select max(dcost)as costliest_software from softwares ;

--14. How many packages have been developed in dBase?
select count(developin)from softwares
where developin='dbase';

--15. How many programmers studied in Pragathi?
select count(spname)as studied_in_Pragathi from study where institute='Pragathi';

--16. How many programmers paid 5000 to 10000 for their course?
select count(spname) from study where coursefee between 5000 and 10000;

--17. What is the average course fee?
select avg(coursefee)from study;

--18. Display the details of the programmers knowing C.
select* from softwares where developin='c';

--19. How many programmers know either COBOL or Pascal?
select count(pname)from softwares 
where developin like 'cobol' or developin like 'pascal';

--20. How many programmers don’t know Pascal and C?
select count(pname) from softwares
where developin='pascal' and developin='c';

--21. How old is the oldest male programmer?-

create view age_male 
as
(
select *,datediff(year,dob,getdate())as age_male_programmer 
from programmers 
where gender='m'
);
select max(age_male_programmer)as oldes_male_programmer from age_male;

--22. What is the average age of female programmers?
create view age_female
as
(
select*,datediff(year,dob,getdate())as age_female_programmer
from programmers
where gender='f'
)
select avg(age_female_programmer)as avg_age_female from age_female;

--23. Calculate the experience in years for each programmer and display with their names in descending order.
select * ,datediff(year,doj,getdate())as year_experience from programmers 
order by pname desc;


--24. Who are the programmers who celebrate their birthdays during the current month?
select pname as cele_bdy_current from programmers 
where dob like '_____08___';

--25. How many female programmers are there?
select count(pname)as total_female from programmers where gender='f';


--26. What are the languages studied by male programmers?
select prof1,prof2 from programmers where gender='m';

--27. What is the average salary?
select avg(salary)from programmers;

--28. How many people draw a salary between 2000 to 4000?
select count(pname) from programmers where salary between 2000 and 4000;

--29. Display the details of those who don’t know Clipper, COBOL or Pascal.
select * from programmers where prof1<>'clipper' and prof1<>'cobol' 
and prof1<>'pascal' and prof1<>'clipper' and prof1<>'cobol' and prof1<>'pascal';

--30. Display the cost of packages developed by each programmer.
select pname,sum(scost) from softwares group by pname;


--31. Display the sales value of the packages developed by each programmer.
select pname,sum(scost*sold) from softwares group by pname;

--32. Display the number of packages sold by each programmer.
select pname,sum(sold)from softwares group by pname;

--33. Display the sales cost of the packages developed by each programmer language wise.
select developin as language_wise ,sum(scost*sold) as sales_cost_of_package
from software group by developin;

--34. Display each language name with the average development cost,average selling cost and average price per copy.
select developin,avg(dcost)as avg_developmentcost ,avg(scost)as avg_sellingcost,avg(scost)as avg_ppcopy
from softwares group by developin;


--35. Display each programmer’s name and the costliest and cheapest packages developed by him or her.
select pname,max(scost)as costliest,min(scost)as cheapest from softwares group by pname;


--36. Display each institute’s name with the number of courses and the average cost per course
select institute,count(course),avg(coursefee) from study group by  institute;


--37. Display each institute’s name with the number of students.
select institute,count(spname) from study group by institute;


--38. Display names of male and female programmers along with their gender.
select pname,gender from programmers;


--39. Display the name of programmers and their packages.
select pname,salary from programmers;


--40. Display the number of packages in each language except C and C++.
select count(title)as num_of_package from softwares where developin <>'c' and developin <>'c++';


--41. Display the number of packages in each language for which development cost is less than 1000.
select count(title) from softwares where dcost<1000;


--42. Display the average difference between SCOST and DCOST for each package.
select title ,avg(dcost-scost)from softwares group by title;


--43. Display the total SCOST, DCOST and the amount to be recovered for
--      each programmer whose cost has not yet been recovered.
select pname,sum(scost*sold)as Total_scost,sum(dcost)as Total_dcost,sum((sold*scost)-dcost)as recovered 
from softwares group by pname 
having sum(dcost)>sum(sold*scost);


--44. Display the highest, lowest and average salaries for those earning more than 2000.
select max(salary),min(salary),avg(salary) from programmers 
where salary>2000;


--45. Who is the highest paid C programmer?
select * from programmers where salary=(select max(salary) from programmers
where prof1 like 'c' or prof2 like 'c');


--46. Who is the highest paid female COBOL programmer?
select* from programmers where gender like 'f' and salary=(select Max(Salary)from programmers 
where prof1 like 'cobol'or prof2 like 'cobol');


--47. Display the names of the highest paid programmers for each language.
--select pname from programmers where salary=(select max(salary)from programmers) order by prof1 and prof2);
create view salary_eachlang ---create v-table (prof1+prof2=prof)
as
(select pname ,salary,prof1 as prof from programmers
union
select pname,salary,prof2 from programmers);

with cte as                 ---cte for rank salary
(
select pname,prof,salary,
rank()over (partition by prof order by salary desc)as salaryrank
from salary_eachlang
)
select * from cte where salaryrank='1';



----48. Who is the least experienced programmer?
with cte1 as
(
select pname,datediff(month,doj,getdate())as expe from programmer
)
select min(expe)as least_exp_month from cte1 ;
select * from cte1 where expe=365;

--49. Who is the most experienced male programmer knowing PASCAL?

SELECT TOP 1 * FROM programmers where prof1='pascal'or prof2='pascal' 
ORDER BY doj ASC;



--50. Which language is known by only one programmer?
-----select* from programmers;
create view pro_lang
as
select [pname], [dob], [doj], [gender], [prof1],  [salary] from programmers      
union
select [pname], [dob], [doj], [gender], [prof2],  [salary] from programmers;

select prof1 from pro_lang group by prof1 
having count(distinct pname)=1;

select * from pro_lang where prof1='cpp'or prof1='foxpro' or prof1='oracle' ;

----or
select prof1 from programmers
group by prof1 
having count(prof1)=1 and prof1 not in (select prof2 from programmers)
union
select prof2 from programmers 
group by prof2 
having  count(prof2)=1 and prof2 not in (select prof1 from programmers);


--51. Who is the above programmer referred in 50?

select * from pro_lang where prof1='cpp'or prof1='foxpro' or prof1='oracle' ;



--52. Who is the youngest programmer knowing dBase?

select top 1* from pro_lang 
where prof1 like 'dbase'
order by dob desc;


--53. Which female programmer earning more than 3000 does not know C,C++, Oracle or dBase?

select * from programmers 
where gender='f' and
prof1<>'oracle' and prof1<>'dbase' and prof1<>'c' and
prof2<>'oracle' and prof2<>'dbase' and prof2<>'c' 
and salary>3000;



--54. Which institute has the most number of students?

select max(institute) from study;

--or

with inst_row as
(
select institute,
row_number()over (partition by institute order by institute)as inst_rank
from study
)
select institute as most_no_student from inst_row where inst_rank>3;


--55. What is the costliest course?
select course as costliest_course 
from study 
where coursefee=(select max(coursefee)from study);

------select* from study

--56. Which course has been done by the most number of students?
with course1 as
(
select course,
row_number() over (partition by course order by course) as course_rank
from study
)
select course as most_studied_course from course1 
where course_rank=(select max(course_rank)from course1); 

--57. Which institute conducts the costliest course?
select institute,course from study where coursefee=(select max(coursefee) from study);


--58. Display the name of the institute and the course which has below average course fee.
select institute ,course from study 
where coursefee<(select avg(coursefee) from study);


--59. Display the names of the courses whose fees are within 1000 (+ or -) of the average fee.
select course from study 
where coursefee< (select avg(coursefee)+1000 from study)
and coursefee >(select avg(coursefee)-1000 from study);


--60. Which package has the highest development cost?
select title,dcost from softwares
where dcost=(select max(dcost)from softwares);


--61. Which course has below average number of students?
-----------------select course from study---select * from study
create view no_of_student
as
select course,count(spname)as no_of_student from study group by course;

select* from no_of_student;
select course from no_of_student 
where no_of_student<=(select avg(no_of_student)from no_of_student);


--62. Which package has the lowest selling cost?
select title,scost from softwares
where scost=(select min(scost) from softwares);



--63. Who developed the package that has sold the least number of copies?
select title,sold  from softwares where sold=(select min(sold)from softwares);
--or
select *  from softwares where sold=(select min(sold)from softwares);


--64. Which language has been used to develop the package which has the highest sales amount?
-----select * from softwares;
select * from softwares where scost=(select max(scost)from softwares);

--65. How many copies of the package that has the least difference between 
--development and selling cost were sold?
select * from softwares where (dcost-scost)=(select min(dcost-scost)from softwares);


--66. Which is the costliest package developed in Pascal?
select * from softwares
where   
dcost=(select max(dcost) from softwares where developin ='pascal');




--67. Which language was used to develop the most number of packages?
select developin from softwares 
group by developin
having
developin=(select max(developin) from softwares);



--68. Which programmer has developed the highest number of packages?
select pname from softwares
group by pname
having 
pname=(select max(pname) from softwares);



------------------------------with ctes as
------------------------------(
------------------------------select pname,count(title)as count_title from softwares group by pname
------------------------------)
------------------------------select pname ,count_title from ctes where count_title=(select max(count_title)from ctes);


--69. Who is the author of the costliest package?
select * from softwares where dcost=(select max(dcost)from softwares)


--70. Display the names of the packages which have sold less than the
--average number of copies.
select title from softwares 
where sold<(select avg(sold)from softwares);


--71. Who are the authors of the packages which have recovered more than
--double the development cost?
select pname from softwares where (scost*sold)>(2*dcost);


--72. Display the programmer names and the cheapest packages developed
--by them in each language.
select pname , title  from softwares 
where dcost in 
(select min(dcost) from softwares group by developin);



--73. Display the language used by each programmer to develop the highest
--selling and lowest selling package.
with cte_max as
(
select  pname ,developin as highest_selling from softwares --order by pname
where scost=(select max(scost)from softwares)
)
, cte_min as
(
select  pname ,developin as lowest_selling from softwares --order by pname
where scost=(select min(scost)from softwares)
)

select pname,highest_selling from cte_max 
union all
select pname,lowest_selling from cte_min;



--74. Who is the youngest male programmer born in 1965?
with pro_1965 as
(
select pname,dob ,datediff(day,dob,'1965-12-31')as daysdiff from programmers 
where gender='m' and dob between '1965-01-01' and '1965-12-31'
)
select pname as youngest_male_pro@1965 from pro_1965
where daysdiff=(select min(daysdiff)from pro_1965);


------select* from programmers;


--75. Who is the oldest female programmer who joined in 1992?
with old_f_pro@1992 as
(
select pname ,age_female_programmer ,doj from age_female
where 
doj between '1992-01-01' and '1992-12-31'
)
select pname,age_female_programmer from old_f_pro@1992
where age_female_programmer=(select max(age_female_programmer)from old_f_pro@1992);


--76. In which year was the most number of programmers born?
create view no_of_pers_@bornyear as
select year(dob)as year ,count(pname)no_of_person from programmers group by year(dob);

select year,no_of_person from no_of_pers_@bornyear
where no_of_person=(select max(no_of_person)from no_of_pers_@bornyear)


--77. In which month did the most number of programmers join?
with cte_mon as
(
select month(doj)as joining_month ,count(pname)no_of_pro from programmers group by month(doj)
)
select joining_month,no_of_pro from cte_mon where no_of_pro=(select max(no_of_pro)from cte_mon);



--78. In which language are most of the programmer’s proficient?
with cte_lang as
(
select developin,count(developin)as lang from softwares group by developin
)
select * from cte_lang where lang=(select max(lang)from cte_lang);

----select * from softwares;

--79. Who are the male programmers earning below the average salary of
--female programmers?
----select* from programmers;

select pname,salary from programmers where gender='m' and 
salary <(select avg(salary)from programmers where gender='f')


--80. Who are the female programmers earning more than the highest paid?
--------------------select* from programmers
select pname,salary from programmers 
where gender='f' and salary>(select max(salary)from programmers where gender='m')



--81. Which language has been stated as the proficiency by most of the
--programmers?
--------select * from softwares
with prof_lang as
(
select developin,count(developin)as count_lang from softwares group by developin
)
select developin as porficient_lang from prof_lang 
where count_lang=(select max(count_lang)from prof_lang);


--82. Display the details of those who are drawing the same salary.
select * from programmers 
where salary in (select salary from programmers group by salary having count(salary)>1)
order by salary;



--83. Display the details of the software developed by the male programmers
--earning more than 3000.
with pro_male as
(
select pname as p_male,salary from programmers where gender='m'
)
select * from softwares s inner join pro_male pm
on s.pname=pm.p_male
where salary>3000;

--------select * from softwares

--84. Display the details of the packages developed in Pascal by the female
--programmers.
select distinct * from programmers p,softwares s 
where p.pname=s.pname and gender='f' and developin='pascal';


--85. Display the details of the programmers who joined before 1990.
select * from programmers where year(doj)<1990;


--86. Display the details of the software developed in C by the female
--programmers at Pragathi.
select * from softwares s , programmers p , study st 
where  s.pname = p.pname and s.pname= st.spname and
gender='f' and developin='c'and institute='pragathi';


----select * from softwares s, programmers p where s.pname=p.pname and gender ='f'
----select* from study

--87. Display the number of packages, number of copies sold and sales value
--of each programmer institute wise.


------------select institute,pname,title,sold,(scost*sold) from softwares s,study st 
------------where s.pname=st.spname order by institute;

select institute,count(title)as no_of_packages,
count(sold)as no_of_copiessold,
sum(scost*sold)as sales_value from softwares s,study st where s.pname=st.spname
group by institute;

----------select* from softwares
----------select* from study

--88. Display the details of the software developed in dBase by male
--programmers who belong to the institute in which the most number of
--programmers studied.
select title,institute,gender from softwares s,study st ,programmers p 
where s.pname=st.spname and s.pname=p.pname and
gender='m' and developin='dbase'and institute=(select max(institute)from study);

--------------------select institute,count(institute)from study
--------------------group by institute

--89. Display the details of the software developed by the male programmers
--born before 1965 and female programmers born after 1975.
create view prog_b_year
as
select developin,gender,year(dob) as born_year from softwares s,programmers p where s.pname=p.pname 

select developin from prog_b_year where gender='m'and born_year<1965;
select developin from prog_b_year where gender='f'and born_year>1975;

--------------select* from  prog_b_year


--90. Display the details of the software that has been developed in the
--language which is neither the first nor the second proficiency of the
--programmers.
--------select *from softwares;

select title,developin as top_2 from softwares where developin in
(select top 2 developin  from softwares)



--91. Display the details of the software developed by the male students at
--Sabhari.
select title ,developin from softwares s,study st,programmers p 
where s.pname=st.spname and s.pname=p.pname and gender='m' and institute='sabhari';


--92. Display the names of the programmers who have not developed any
--packages.
select pname from programmers where pname not in(select pname from softwares)


--93. What is the total cost of the software developed by the programmers of
--Apple?
----------select * from study
with cte_total_apple as
(
select pname,title,developin,dcost from softwares s,study st where s.pname=st.spname
and institute='apple'
)
select sum(dcost)as Total_cost_by_apple from cte_total_apple;



--94. Who are the programmers who joined on the same day?
select a.pname ,a.doj from programmers a ,programmers b
where a.doj=b.doj and a.pname<>b.pname
order by doj;


--95. Who are the programmers who have the same Prof2?
select distinct a.pname ,a.prof2 from programmers a,programmers b 
where a.prof2=b.prof2 and a.pname<>b.pname;

----------select* from programmers

--96. Display the total sales value of the software institute wise.

select institute,sum(scost*sold)as total_salevalue  from softwares s,study st
where s.pname=st.spname group by institute;



--97. In which institute does the person who developed the costliest package
--study?
select spname,institute,dcost ,title,developin from study st,softwares s 
where st.spname=s.pname and dcost=(select max(dcost)from softwares);


--98. Which language listed in Prof1, Prof2 has not been used to develop any
--package?

------select* from softwares
------select* from [dbo].[pro_lang]-->(view table)

select distinct prof1 from pro_lang p where p.prof1 not in (select developin from softwares)


--99. How much does the person who developed the highest selling package
--earn and what course did he/she undergo?

select course,salary from softwares s,study st ,programmers p 
where s.pname=st.spname and s.pname=p.pname and
(scost*sold)=(select max(scost*sold)from softwares);

--100. What is the average salary for those whose software sales is more than
--50,000?
select avg(salary)as avg_salary from programmers p,softwares s where p.pname=s.pname and 
(scost*sold)>50000;


--101. How many packages were developed by students who studied in
--institutes that charge the lowest course fee?
select pname,count(title)as no_of_packages from softwares s,study st where s.pname=st.spname and
coursefee=(select min(coursefee)from study) group by pname


--102. How many packages were developed by the person who developed the
--cheapest package? Where did he/she study?
select institute,count(title)as no_of_packages from softwares s,study st
where s.pname=st.spname  and
dcost=(select min(dcost)from softwares)
group by institute;

------select* from softwares
------select* from study
--103. How many packages were developed by female programmers earning
--more than the highest paid male programmer?
select count(title)as no_of_packages from softwares s,programmers p where s.pname=p.pname and
gender='f' and salary>(select max(salary)from programmers p where gender='m')


--104. How many packages are developed by the most experienced
--programmers from BDPS?
select count(title)as no_of_pack from softwares s,programmers p,study st 
where s.pname=p.pname and s.pname=st.spname and
doj=(select max(doj)from programmers p)and institute='bdps';


--105. List the programmers (from the software table) and the institutes they
--studied at.
select distinct pname,institute from softwares s,study st 
where s.pname=st.spname order by pname;

--106. List each PROF with the number of programmers having that PROF
--and the number of the packages in that PROF.

create view profit as     ---create view table
select pname,title,((scost*sold)-dcost)as profit from softwares
where (scost*sold)>dcost ;
------select *  from profit ;
select pname,sum(profit)as PROFIT,
count(title)as no_of_packages from profit
group by pname;


--107. List the programmer names (from the programmer table) and the
--number of packages each has developed
select p.pname,count(s.developin)as no_of_packages from programmers p,softwares s
where p.pname=s.pname group by p.pname;




*****************
--Sandhanaroja K