-- Creating a database which named Techmac_db.
create database Techmac_db;
use Techmac_db;

-- Creating three tables of the three startup in one database

-- Table 1 Techhyve_Employess
create table Techhyve_Employees(
Employees_id int,
First_name varchar(200),
Last_name varchar(200),
Gender enum('male','female','other'),
Age int);

-- Solving task 3,adding a new column and named ProficiencyLevel
Alter table Techhyve_Employees
add ProficiencyLevel int;

-- Solving task (4) 1).Alter the Employees_id column with primay key constraints
Alter table Techhyve_Employees Add primary key (Employees_id);

-- 2). Alter the proficiencyLevel column with check constraints and set the defoult value between 1 and 5
alter table Techhyve_Employees  modify ProficiencyLevel int check (ProficiencyLevel between 1 and 5);

-- 3). Modifying age column and structure with check constraint age should be between 21 to 55.
alter table Techhyve_Employees modify Age int check (Age between 21 and 55);

-- Modify Employee_id data type int to varchar.
Alter table Techhyve_Employees modify column Employees_id varchar(100);
alter table Techhyve_Employees alter ProficiencyLevel set default 1;

-- inserting data values in table 1
insert into techhyve_Employees(Employees_id,First_Name,Last_Name,Gender,Age,ProficiencyLevel)values
('TH0001','Eli','Evans','Male',26,1),
('TH0002','Carlos','Simmons','Male',32,2),
('TH0003','Kathie','Bryant','Female',25,1),
('TH0004','Joey','Hughes','Male',41,4),
('TH0005','Alice','Matthews','Female',52,4);

-- task 6) Creating clone table and named
create table techhyve_Employees_bkp  select * from techhyve_Employees;

-- task 7) Deleting the record of employees with code TH0003 and TH0003. 
delete from techhyve_Employees where Employees_id ='TH0003' or Employees_id ='TH0003';
truncate table techhyve_Employees;

-- Table 2 Techcloud_Employees
create table Techcloud_Employees(
Employees_id int,
First_name varchar(200),
Last_name varchar(200),
Gender  enum('male','female','other'),
Age int);

-- Solving task 3,adding a new column and named ProficiencyLevel
Alter table Techcloud_Employees
add ProficiencyLevel int;

-- Solving task (4) 1).Alter the Employees_id column with primay key constraints
Alter table Techcloud_Employees Add primary key (Employees_id);

-- 2). Alter the proficiencyLevel column with check constraints and set the defoult value between 1 and 5
alter table Techcloud_Employees  modify ProficiencyLevel int check (ProficiencyLevel between 1 and 5);

-- 3). Modifying age column and structure with check constraints age should be between 21 to 55.
alter table  Techcloud_Employees  modify Age int check (Age between 21 and 55);

-- Modify Employee_id data type int to varchar.
Alter table Techcloud_Employees modify column Employees_id varchar(100);
alter table Techcloud_Employees alter ProficiencyLevel set default 1;

-- inserting data values in table 2
insert into Techcloud_Employees(Employees_id,First_Name,Last_Name,Gender,Age,ProficiencyLevel)values
('TC0001','Teresa','Bryant','Female',39,2),
('TC0002','Alexis','Patterson','Male',48,5),
('TC0003','Rose','Bell','Female',42,3),
('TC0004','Gemma','Watkins','Female',44,3),
('TC0005','Kingston','Martinez','Male',29,2);

-- task 6) Creating clone table and named
create table Techcloud_Employees_bkp  select * from Techcloud_Employees;

delete from techhyve_Employees where Employees_id ='TC0003' or Employees_id ='TC0003';
truncate table Techcloud_Employees;

-- Table 3 Techsoft_Employees
Create table Techsoft_Employees(
Employees_id int,
First_name varchar(200),
Last_name varchar(200),
Gender enum('male','female','other'),
Age int);


-- Solving task 3,adding a new column and named ProficiencyLevel
Alter table Techsoft_Employees
add ProficiencyLevel int; 

-- Solving task (4) 1).Alter the Employees_id column with primay key constraints
Alter table Techsoft_Employees Add primary key (Employees_id);

-- 2). Alter the proficiencyLevel column with check constraints and set the defoult value between 1 and 5
alter table  Techsoft_Employees  modify ProficiencyLevel int check (ProficiencyLevel between 1 and 5);

-- 3). Modifying age column and structure with check constraints age should be between 21 to 55.
alter table  Techsoft_Employees  modify Age int check (Age between 21 and 55);

-- Modify Employee_id data type int to varchar.
Alter table  Techsoft_Employees modify column Employees_id varchar(100);
alter table  Techsoft_Employees alter ProficiencyLevel set default 1;

-- inserting data values in table 3
insert into Techsoft_Employees(Employees_id,First_Name,Last_Name,Gender,Age,ProficiencyLevel)values
('TS0002','Harold','Simmons','Male',54,4),
('TS0003','Juliana','Sanders','Female',36,2),
('TS0004','Paul','Ward','Male',29,2),
('TS0005','Nicole','Bryant','Female',30,2);

-- task 6) Creating clone table and named
create table Techsoft_Employees_bkp  select * from Techsoft_Employees;
-- task 7) Deleting the record of employees with code TC0001 and TC0004. 
delete from Techsoft_Employees where Employees_id ='TC0001' or Employees_id ='TC0004';

-- Merging records from two tables and storing into new table
create table techhyvecloud_employees like techhyve_employees;
insert into techhyvecloud_employees(Employees_id,First_Name,Last_Name,Gender,Age,ProficiencyLevel)
select Employees_id,First_Name,Last_Name,Gender,Age,ProficiencyLevel from Techhyve_Employees 
union
select  Employees_id,First_Name,Last_Name,Gender,Age,ProficiencyLevel from Techcloud_Employees;
truncate table Techsoft_Employees;