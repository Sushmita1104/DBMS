create database db8;
use db8;

create table borrower (rollin int, name varchar(30), dateofissue date,nameofbook varchar(30), status char(10));

insert borrower values (101, 'abc', '2017-07-16', 'dbms', 'r'), (102,
'abc1', '2017-07-16', 'cn', 'i'), (103,'abc3', '2017-07-18', 'toc', 'i'), (104, 'abc4', '2017-07-20',
'ds', 'i'), (105, 'abc5', '2017-07-23', 'daa', 'r'), (106, 'nisha', '2017-08-10', 'splm', 'r' );

create table library_audit(rollin int, name char(10), dateofissue date,nameofbook char(10), status char, ts timestamp);

# After INSERT Trigger
delimiter //
create trigger after_insert after insert on borrower for each row
begin insert into library_audit values(new.rollin, new.name, new.dateofissue,
new.nameofbook, new.status, current_timestamp);
end;

select * from borrower;
drop trigger after_insert;

select * from library_audit;

 insert into borrower values(107,'ada','2017-08-10','dbms','i');
 
select * from borrower;
select * from library_audit;

-- After DELETE Trigger

Delimiter //
create trigger after_delete after delete on borrower for each row
begin
insert into library_audit values(old.rollin, old.name, old.dateofissue,
old.nameofbook, old.status, current_timestamp());
end ;

delete from borrower where rollin = 105;

select * from borrower;

select * from library_audit;

-- After UPDATE Trigger

Delimiter //
create trigger after_update after update on borrower for each row
begin
insert into library_audit values(new.rollin, new.name, new.dateofissue,
new.nameofbook, new.status, current_timestamp());
end ;

 update borrower set status='r' where borrower.rollin=104
 
 select * from library_audit;
 

