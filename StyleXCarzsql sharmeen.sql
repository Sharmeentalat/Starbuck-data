-- Creating data base named stylexcarz_db
create database stylexcarz_db;
use stylexcarz_db;

-- creating three tables
-- table 1. salesperson
create table salespersons(
salesperson_id varchar(100) not null,
salesperson_name varchar (200) not null,
salesperson_city varchar(200) not null,
commission_rate int not null);
insert into salespersons(salesperson_id,salesperson_name,salesperson_city,commission_rate)values
('1001','William','London',12),
('1002','Liam','San Jose',13),
('1003','Axelrod','New York',10),
('1004','James','London',11),
('1005','Fran','London',26),
('1007','Oliver','Barcelona',15),
('1008','John','London',0),
('1009','Charles','Florida',0);

-- Task 2
-- ensuring salesperson id setting with primary key constraints
Alter table salespersons Add primary key (salesperson_id);


-- table 2. customer
create table customers(
customer_id varchar(100) not null,
c_firstname varchar(200) not null,
c_lastnamee varchar(200) not null,
c_city varchar(200) not null,
c_rating int not null);
insert into customers(customer_id,c_firstname,c_lastnamee,c_city,c_rating)values
('2001','	Hoffman','	Anny','	London'	,100),
('2002','	Giovanni','	Jenny','	Rome',	200),
('2003','	Liu','	Williams','	San Jose',	100),
('2004','	Grass','	Harry','	Berlin',	300),
('2005','	Clemens','	John','	London',	200),
('2006','	Cisneros','	Fanny','	San Jose',	200),
('2007','	Pereira','	Jonathan','	Rome',	300);

-- Task 2
-- ensuring customer id setting with primary key constraints
Alter table customers Add primary key (customer_id);


-- table 3. orders
create table orders(
order_id varchar(100) not null,
amount int not null,
orderdate date not null,
salespersonid int not null,
customerid int not null);
insert into orders(order_id,amount,orderdate,salespersonid,customerid)values
(3001, 123, '2021-02-01', 1009, 2007),
(3002, 100, '2021-07-30', 1001, 2007),
(3003, 187, '2021-10-02', 1001, 2001),
(3005, 201, '2021-10-09', 1003, 2003),
(3007, 167, '2021-04-02', 1004, 2002),
(3008, 189, '2021-03-06', 1002, 2002),
(3009, 145, '2021-10-10', 1009, 2005),
(3010, 200, '2021-02-23', 1007, 2007),
(3011, 100, '2021-09-18', 1001, 2004);

-- Task 2
-- ensuring orders id setting with primary key constraints
Alter table orders Add primary key (order_id);

-- Task 4
-- updating the commission rate salespersons to 15% who have commission rate between 0 and 13.
set sql_safe_updates=not null;
UPDATE salespersons
SET commission_rate = 15
WHERE commission_rate between 0 and 13;

 -- Task 5
 -- Creating a clone of data
 create table orders_bkp  select * from orders;
 
 -- Task 6
 -- creating a clone table 
 create table orders_placed_history select * from orders;
 
 -- deleting records of the orders 3005 and 3008 from orders table
 delete from orders where order_id ='3005' or order_id ='3008';
 
-- incresing customers rating by 50
UPDATE customers
SET c_rating = c_rating + 50
where customer_id in(
select customer_id
having count(*)>2
);