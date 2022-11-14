create database db5;
use db5;

create table borrower(roll int,name char(20),dateofissue date,nameofbook char(15),status char(5));
create table fine(roll int, date date,amt int);

insert into borrower values(1,"teena","2022-10-25","toc","i");
insert into borrower values(2,"jay","2022-09-15","dbms","i");
insert into borrower values(3,"anu","2022-11-01","cn","i");

delimiter //
create procedure calculatefine(in roll int,in nameofbook char(15))
begin
declare currentdate date;
declare noofdays int;
declare doi date;
declare fineamt int;
declare flag int;
set flag=0;
set currentdate=curdate();
select dateofissue into doi from borrower where borrower.roll=roll and borrower.nameofbook=nameofbook;
select datediff(currentdate,doi) into noofdays;
select noofdays;
if noofdays>=15 and noofdays<=30 then set fineamt=(5*noofdays);
set flag=1;
else if noofdays>30 then set fineamt=(10*noofdays);
set flag=2;
end if;
end if;

if flag=1 then insert into fine values(roll,currentdate,fineamt);
else if flag=2 then insert into fine values(roll,currentdate,fineamt);
end if;
end if;

update borrower set borrower.status="r" where borrower.nameofbook=nameofbook;
end;

drop procedure calculatefine;

call calculatefine("1","toc");
call calculatefine("2","dbms");
call calculatefine("3","cn");

select * from fine;
select * from borrower;