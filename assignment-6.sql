create database db6;
use db6;

create table stud_marks(roll_no int primary key, name char(10),total_marks int);
insert into stud_marks values(101,'abc', 933);
insert into stud_marks values(102,'xyz', 356);
insert into stud_marks values(103,'mnk', 450);
insert into stud_marks values(104,'pqr', 675);
insert into stud_marks values(105,'snk', 1300);
insert into stud_marks values(106,'jnk', 250);

select * from stud_marks;

create table result (roll_no int, name char(30), class char(20));

delimiter //
create procedure proc_grade(in marks int, out class char(10))
begin
if marks<=1500 and marks>=990 then set class='DIST';
end if;
if marks<=989 and marks>=900 then set class='FC';
end if;
if marks<=899 and marks>=825 then set class='HSC';
end if;
if marks<=824 and marks>=750 then set class='SC';
end if;
if marks<=749 and marks>=650 then set class='PC';
end if;
if marks < 650 then set class='fail';
end if;
end ;

delimiter //
create function find_result(roll_in int) returns int deterministic
begin
declare fmarks int;
declare grade char(10);
declare stud_name char(10);
select stud_marks.total_marks,stud_marks.name into fmarks, stud_name from
stud_marks where stud_marks.roll_no=roll_in;
call proc_grade(fmarks,@grade);
insert into result values(roll_in,stud_name, @grade);
return roll_in; 
end;

select find_result(104);

select * from result;

select find_result (101);

select find_result (106);

select find_result (104);

select * from result;