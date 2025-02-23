create database identity;
use identity;
create table login (username varchar(255), password varchar(255));
insert into login values('admin','muneeb');
select * from login;

create table refugee(Name varchar(255), Gender varchar(255), 
DOB varchar(255),Martial_Status varchar(255), Father_Name varchar(255), Father_ID varchar(255), Old_Address varchar(255),
Address varchar(255), City varchar(255), Orign varchar(255),
Education varchar(255), Job_Status varchar(255), Phone varchar(255),
Ref_ID varchar(255));

select * from refugee;