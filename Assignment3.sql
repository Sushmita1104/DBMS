create database db3;
use db3;
create table employee(empname varchar(100) not null primary key ,street varchar(50),city varchar(20));
create table company(companyname varchar(100) primary key,city varchar(20));
create table manager(empname varchar(100),foreign key(empname) references employee(empname), manager varchar(50));
create table works(empname varchar(100),companyname varchar(100),salary int(11));

show tables;
show databases;
drop table works;
drop table works;
desc works;
drop database db3;

insert into employee values('Amy Baker','Sixth Street','Pennsylvania');
insert into employee values('Daniff Hernandez','Oak Street','New York');
insert into employee values('Janet King','Elm Street','Illinois');
insert into employee values('Jayne Horton','Ceder Street','New York');
insert into employee values('Jayne Horton','Ceder Street','New York');
insert into employee values('Mia Brown','Park Street','Florida');
insert into employee values('Nan Singh','Fifth Street','Ohio');
insert into employee values('Renee Becker','View Street','Florida');
insert into employee values('Smith Leighann','Sixth Street','New York');
insert into employee values('William LaRotonda','Pine Street','Ohio');

select * from works;

insert into manager values("Amy Baker","Elisa Bramante");
insert into manager values("William LaRotonda","Michael Albert");
insert into manager values("Renee Becker","Elijiah Gray");
insert into manager values("Nan Singh","Amy Dunn");
insert into manager values("Janet King","Kelley Spirea");
insert into manager values("Mia Brown","David Stanley");
insert into manager values("Smith Leighann","John Harison");


insert into company values("AmerisourcBergen","Pennsylvania");
insert into company values("Discover Finances","Illinois");
insert into company values("NextEra energy","Florida");
insert into company values("Penske Automotive groups","New York");
insert into company values("PepsiCo","New York");
insert into company values("Progressive","Ohio");
insert into company values("US Foods","Illinois");


insert into works values("Amy Baker","AmerisourcBergen",120000);
insert into works values("William LaRotonda","Progressiv",150000);
insert into works values("Smith Leighann"," PepsiCo",120000);
insert into works values("Daniff Hernandez"," Penske Automotive groups",140000);
insert into works values("Janet King ","US Foods",125000 );
insert into works values("Jayne Horton","Penske Automotive groups",205000 );
insert into works values("Mia Brown","NextEra energy",105000);
insert into works values("Nan Singh","Progressiv",255000);
insert into works values("Renee Becker","NextEra energy",145000);




alter table works add foreign key(empname) references employee(empname);

#Questions

#1. Find the names of all employees who work for NextEra energy

Select empname from works Where companyname="NextEra energy";

#2. Find the names and cities of residence of all employees who work for Progressive.

select * from employee where empname in(select empname from works where companyname="Progressiv");

# 3. Find the names, street addresses, and cities of residence of all employees who work for Progressive and earn more than $10,000.

select * from employee where empname in(select empname from works where companyname="Progressiv" and salary>10000);

select employee.empname, street, city from employee, works where
employee.empname=works.empname and works.companyname="Progressiv" and
works.salary>10000;

#4. Find all employees in the database who live in the same cities as the companies for which they work.

select employee.empname from employee,company where employee.city=company.city group by empname;

#5.Find all employees in the database who live in the same cities and on the same streets as do their managers.

Select E1.empname
From employee as E1, employee as E2, manager as M
Where E1.empname=M.empname and
E2.empname=M.manager and E1.street=E2.street and E1.city=E2.city;

# 6. Find all employees in the database who do not work for First Bank Corporation.

select empname from works where companyname<>"Progressiv";

#7. Find all employees in the database who earn more than each employee of Penske Automotive groups

select empname from works where salary>(select max(salary) from works where companyname="Penske Automotive groups");

# 8. Assume that the companies may be located in several cities. Find all companies loacted in every city in which Pepsico is located.

select companyname from company where company.city in(select company.city from company where companyname="Pepsico");

# 9. Find all employees who earn more than the average salary of all employees of their company.

select empname
from works as t where salary >
(select avg(salary) from works as s
where t.companyname = s.companyname);

# 10. Find the company that has the most employees.

select companyname from works group by companyname having count(distinct
empname)>=all ( select count(distinct empname) from works group by
companyname);

#11.Find the company that has the smallest payroll.

select companyname from works group by companyname having sum(salary)<=all(select sum(salary) from works group by companyname);

#12.Find those companies whose employees earn a higher salary, on average, than the average salary at NextEra energy.

select companyname from works group by companyname having
avg(salary)>(select avg(salary) from works where companyname="NextEra energy");