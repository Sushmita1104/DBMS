create database db7;
use db7;

create table stud_marks (name char(50), total_marks int, roll int );
insert stud_marks values ('P', 900, 1);
insert stud_marks values ('R', 1400, 2), ('S', 1000,3 ), ('T', 850, 4), ('Q',750, 5);

create table result (roll int, name char(50), class char(20) );

delimiter //
CREATE PROCEDURE grade2()
BEGIN
DECLARE rolln INT;
DECLARE stu_name CHAR(50);
DECLARE marks INT;
DECLARE done INT DEFAULT FALSE;
DECLARE cur1 CURSOR FOR SELECT roll,name,total_marks FROM stud_marks;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN cur1;
read_loop: LOOP
FETCH cur1 INTO rolln,stu_name,marks;
IF done THEN
LEAVE read_loop;
END IF;
IF (marks >= 990 AND marks <= 1500) THEN
INSERT INTO result values(rolln, stu_name, 'DISTINCTION');
ELSEIF (marks >= 900 AND marks <= 989) THEN
INSERT INTO result values(rolln,stu_name,'FIRST CLASS');
ELSEIF (marks >=825 AND marks <=899) THEN
INSERT INTO result values(rolln,stu_name,'SECOND CLASS');
ELSE
INSERT INTO result values(rolln,stu_name,'FAIL');
END IF;
END LOOP;
CLOSE cur1;
END;

select * from stud_marks ;
select * from result ;
call grade2;

select * from result;