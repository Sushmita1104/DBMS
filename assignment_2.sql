create database db2;
use db2;
create table Account(Acc_no int,Branch_Name char(25),Balance double);
create table Branch(Branch_Name char(50),Branch_City char(10),Assets varchar(15));
create table Customer(Cust_Name char(20),Cust_Street varchar(15),Cust_City char(25));
create table Depositor(Cust_Name char(20),Acc_No int);
create table Loan(Loan_No int,Branch_Name char(25),Amount double);
create table Borrower(Cust_Name char(20),Loan_No int);
show tables;
drop table Branch;
insert into branch values("College Road", "Nashik", "aaa");
insert into branch values("Gangapur Road", "Nashik", "aaa");
insert into branch values("Indira Nagar", "Nashik", "aaa");
insert into branch values("Nashik Road", "Nashik", "aaa");
insert into branch values("Ravivar Karanja", "Nashik", "aaa");
insert into branch values("Sharanpur Road", "Nashik", "aaa");
select * from branch;

drop table Account;

insert into Account values(1001,"Gangapur Road",1010.55);
insert into Account values(1004,"Sharanpur Road",310.55);
insert into Account values(1022,"Gangapur Road",2400.88);
insert into Account values(1043,"Gangapur Road",23780.3);
insert into Account values(1057,"Ravivar Karanja",23260.6);
insert into Account values(1060,"Sharanpur Road",560.55);
insert into Account values(1066,"Sharanpur Road",11560.5);
insert into Account values(1290,"Ravivar Karanja",760.55);
insert into Account values(1330,"Indira Nagar",560.55);
insert into Account values(1400,"Gangapur Road",760.55);

select * from account;

drop table customer;

insert into Customer values("Ankita","Deolali Camp","Nasik");
insert into Customer values("Atharva","Gangapur Road","Nasik");
insert into Customer values("Durgesh","Pavan Nagar","Nasik");
insert into Customer values("Harsha","Canada Corner","Nasik");
insert into Customer values("Ojaswini","College Road","Nasik");
insert into Customer values("Sharvari","Golf club","Nasik");
insert into Customer values("Shreya","Indira Nagar","Nasik");
insert into Customer values("Uddesh","Amrutdham","Nasik");
insert into Customer values("Varun","Trimbak Road","Nasik");
insert into Customer values("Yashashree","Rane Nagar","Nasik");

select * from customer;

insert into Depositor values("Atharva",1001);
insert into Depositor values("Uddesh",1004);
insert into Depositor values("Sharvari",1060);
insert into Depositor values("Ankita",1290);
insert into Depositor values("Yashashree",1330);
insert into Depositor values("Ojaswini",1400);
insert into Depositor values("Durgesh",1022);
insert into Depositor values("Harsha",1043);
insert into Depositor values("Shreya",1057);
insert into Depositor values("Varun",1066);


insert into loan value ( 1 , "Gangapur Road", 1000);
insert into loan value ( 2 , "Sharanpur Road", 2000);
insert into loan value ( 3 ,"Ravivar Karanja", 2800);
insert into loan value ( 4 , "Gangapur Road", 10000);
insert into loan value (5 , "Ravivar Karanja", 5000);
insert into loan value (6 , "Gangapur Road", 2500);


insert into Borrower values( "Ankita", 3); 
insert into Borrower values( "Sharvari", 2 ) ;
insert into Borrower values( "Atharva", 1) ;
insert into Borrower values( "Harsha", 4 ) ;
insert into Borrower values( "Shreya", 5 ) ;
insert into Borrower values( "Ojaswini", 6 ) ;


drop table borrower;

#1--
select Branch_Name from Loan;	
#2--
select loan_no from loan where branch_name="Gangapur Road" and amount>1500;
#3--
select loan.loan_no , cust_name ,amount from loan,borrower where loan.loan_no=borrower.loan_no;
#4--
select loan.loan_no ,cust_name,amount from loan,borrower where loan.loan_no=borrower.loan_no and Branch_name="Gangapur Road" order by cust_name asc;

# 5. Find all customers who have an account or loan or both at bank.

select cust_name from borrower union select cust_name from depositor;

# 6. Find all customers who have both account and loan at bank.

select cust_name from borrower where cust_name in(select cust_name from depositor);

# 7. Find all customer who have account but no loan at the bank.

select cust_name from depositor where cust_name not in(select cust_name from borrower);

# 8. Find average account balance at Shivaji nagar branch.

select branch_name ,avg(balance) from account where branch_name="Gangapur Road";

# Find the average account balance at each branch

select branch_name,avg(balance) from account group by branch_name;

# 10. Find no. of depositors at each branch.

select branch_name , count(Account.acc_no) from depositor, account where depositor.acc_no=account.acc_no group by branch_name;

# 11. Find the branches where average account balance > 1000.

select branch_name, avg(balance) from account group by branch_name having avg(balance)>1000 ;

# 12. Find number of tuples in customer relation.

select count(*) from customer;

# 13. Calculate total loan amount given by bank.

select sum(amount) from loan;

# 14. Delete all loans with loan amount between 1300 and 1500.
select * from loan;
delete from loan where Amount>900 and Amount<2500;

# 15. Delete all tuples at every branch located in Sharanpur road.
select * from branch;
delete from branch where branch_name="Sharanpur road";

commit;