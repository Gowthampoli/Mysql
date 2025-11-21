mysql -uroot -proot
system cls;
show databases;

CREATE DATABASE data;
USE data;

DROP DATABASE data;

DROP TABLE employees;

DELETE FROM employees;

SHOW TABLES;
 
CREATE TABLES employees (
    eid int,
    ename varchar(32),
    esal int, /* OR */ esal decimal(10,2), /* OR */ esal float(7,2),
    age int
);

DESCRIBE employees; /* OR */ DESC employees;

INSERT INTO employees VALUES (101, 'Rahul', 45000.45), (102, 'Sonia', 55000.55), (103, 'Priya', 65000.65);
INSERT INTO employees (eid,ename,esal)VALUES (104, 'Mahesh', 25000.25), (105, 'gowtham', 85000.95), (106, 'Modi', 95000.65);

SELECT * FROM employees;

ALTER TABLE employees MODIFY column esal decimal(7,2);

ALTER TABLE employees ADD column age int;

UPDATE employees SET age = 30 WHERE eid = 101;

UPDATE employees SET ename="Rahul Gandhi" WHERE eid = 101;

UPDATE employees SET age = 100000;

DELETE FROM employees; 

DELETE FROM employees WhERE eid=106;

=================================
CLASS-3

DROP DATABASE data;

CREATE TABLE employees (eid int, ename varchar(32), esal float(10,2), age int, location varchar(32));

INSERT INTO employees VALUES(101,'Rahul',45000.45,48,'Delhi'),(102,'Soniya',55000.55,58,'New Delhi'),(103,'Priya',35000.35,40,'Bihar');

DROP TABLE employees;

1.UNIQUE --> Duplicate not allowed
              but NULL VALUES are allowed

2.NOT NULL -->null values not allowed 
			  but duplicates allowed

CREATE TABLE employees (eid int UNIQUE KEY , ename varchar(32) NOT NULL, esal float(10,2), age int, location varchar(32));
INSERT INTO employees VALUES(101,'Rahul',45000.45,48,'Delhi'),(102,'Soniya',55000.55,58,'New Delhi'),(103,'Priya',35000.35,40,'Bihar');
INSERT INTO employees (ename,esal,age,location) VALUES('Mahesh',25000.25,38,'Mumbai'),('Gowtham',85000.95,28,'Chennai'),('Modi',95000.65,68,'Gujarat');

3.DEFAULT --> if no value is provided then default value will be assigned

CREATE TABLE employees (eid int UNIQUE KEY , ename varchar(32) NOT NULL, esal float(10,2), age int, location varchar(32) DEFAULT 'Bangalore');
INSERT INTO employees (eid,ename,age,location) VALUES(101,'Rahul',48,'mumbai'),(102,'Soniya',58),('Priya',40);

4.CHECK --> to put condition on values
CREATE TABLE employees (eid int UNIQUE KEY , ename varchar(32) NOT NULL, esal float(10,2) CHECK (esal>30000), age int CHECK (age>18), location varchar(32) DEFAULT 'Bangalore');
INSERT INTO employees (eid,ename,esal,age,location) VALUES(101,'Rahul',5000.45,48,'mumbai'),(102,'Soniya',55000.55,58,'patna'),(103,'Priya',25000.35,40,'mumbai');

===================================
class 4

CREATE TABLE orders(order_id int UNIQUE KEY,detailes varchar(32) NOT NULL, Amount float(10,2) CHECK(Amount>500),Status varchar(32) DEFAULT "Open", PRIMARY KEY(order_id));
INSERT INTO orders VALUES(201,'order1',1500.50,'Open'),(202,'order2',2500.75,'Closed'),(203,'order3',3500.25);
INSERT INTO orders (order_id,detailes,Amount) VALUES(204,'order4',4500.55),(205,'order5',500.65);

ALTER TABLE orders ADD PRIMARY KEY(order_id);
INSERT INTO orders (detailes,Amount) VALUES('order6',6500.85);
DELETE FROM orders WHERE order_id=204;
DELETE FROM orders WHERE order_id=205;
INSERT INTO orders (order_id,detailes,Amount) VALUES(204,'order4',6500.85);


CREATE DATABASE server;
CREATE TABLE customer (customer_id int, Name varchar(32) NOT NULL, Gender varchar(10) NOT NULL, location varchar(32) DEFAULT "Bangalore",PRIMARY KEY(customer_id));
INSERT INTO customer VALUES (101,'Rahul','Male','Delhi'),(102,'Soniya','Female','New Delhi'),(103,'Priya','Female','Mumbai'),(104,'Modi','Male','Gujarat');

CREATE TABLE orders (order_id int PRIMARY KEY,detailes varchar(32) NOT NULL, Amount float NOT NULL, customer_id int, Status varchar(32) DEFAULT "open",FOREIGN KEY(customer_id) REFERENCES customer(customer_id));
INSERT INTO orders VALUES(1001,'MP1',350,101,'closed'),(1002,'Lenovo Mouse',450,102,'closed');
INSERT INTO orders (order_id,detailes,Amount,customer_id) VALUES (1003,'Lenovo Laptop',65000,102),(1004,'MP2',1050,101),(1005,'Mobile',22000,104),(1006,'MP1',350,104),(1007,'Iphone 17 pro',120000,104);
UPDATE orders SET Status='inprogress' WHERE ORDER_ID=1003;
UPDATE orders SET Status='inprogress' WHERE ORDER_ID=1005;
UPDATE orders SET Status='inprogress' WHERE ORDER_ID=1007;

=====================================
class5
SELECT Name,Gender FROM customer;
SELECT customer_id as eid,Name as eid,LOCATION AS Location FROM customer;
SELECT * FROM customer,orders;
SELECT * FROM customer WHERE location ="Mumbai";
SELECT *FROM customer WHERE amount<1000;

-----------------------
ASSINMENT

create table employees(eid INT, fname VARCHAR(32), lname VARCHAR(32), city VARCHAR(32), esal INT, age INT, PRIMARY KEY(eid));

insert into employees values
(101,'Rahul','Gandhi','Wayanad',45000,52),
(102,'Sonia','Gandhi','New Delhi',55000,75),
(103,'Priyanka','Gandhi','Nodia',65000,45),
(104,'Modi','Narendra','New Delhi',75000,69),
(105,'Rajni','Kanth','Chennai',85000,65),
(106,'Vijay','Setupathi','Chennai',95000,47),
(107,'Nayana','Tara','Chennai',25000,40),
(108,'Alia','Bhut','Mumbai',45000,31),
(109,'Mahesh','Bhut','Mumbai',15000,68),
(110,'Sonam','Kapoor','Mumbai',30000,27),
(111,'Anil','Kapoor','Mumbai',38000,40),
(112,'Raj','Kapoor','Mumbai',18000,78),
(113,'Vishnu','Manchu','Hyderabad',10000,40),
(114,'Manoj','Manchu','Hyderabad',12000,35);

INSERT INTO employees (eid,fname,lname,city,age) values(115,'Mohan','Manchu','Hyderabad',70);

1. Write a query to fetch employee whose last name is same.
SELECT * FROM employees WHERE lname LIKE '%J';

2. Write a query to fetch whose age is grater then 70.
SELECT *FROM employees WHERE esal>70;

3. Write a query to fetch employee with same city.
SELECT COUNT(city) from employees;

==========================================
class6

CREATE TABLE employee(eid int, ename varchar(32) NOT NULL, esal float CHECK(ESAL>15000), loc varchar(32) DEFAULT"Bangalore", PRIMARY KEY(eid,ename));

CREATE TABLE bunit(b_id int, name varchar(32) NOT NULL, email varchar(32) NOT NULL, PRIMARY KEY(B_ID));
INSERT INTO bunit VALUES(1001,'COLT','info@colt.com'),
(1002,'CIPLA','info@cipla.com'),
(1003,'AIRTEL_DM','info@airtel.com');

CREATE TABLE employees(eid int, ename varchar(32) NOT NULL, esal float NOT NULL, gender varchar(32) NOT NULL, bu_id int, loc varchar(32) DEFAULT"Bangalore", PRIMARY KEY(eid),FOREIGN KEY(bu_id) REFERENCES bunit(b_id));

INSERT INTO employees VALUES
(101,'Rahul',45000.45,'Male',1002,'Wayanad'),
(102,'Sonia',55000.45,'Female',1001,'Wayanad'),
(103,'Priyanka',55000.45,'Female',1001,'New Delhi'),
(104,'Modi',65000.45,'Male',1003,'Wayanad'),
(105,'Amith',75000.45,'Male',1003,'New Delhi'),
(106,'Rajni',85000.45,'Male',1003,'Wayanad'),
(107,'Vijay',95000.45,'Male',1003,'New Delhi'),
(108,'Roopa',45000.45,'Female',1001,'Wayanad'),
(109,'Nandini',55000.45,'Female',1001,'New Delhi'),
(1010,'Pooja',65000.45,'Female',1001,'Wayanad');

SELECT e.ename as "Employee Name",
e.esal as "Salary",
b.Name as "Business Unit Name" 
FROM employees e, bunit b 
WHERE e.bu_id = b.b_id;



==========================================
class6

CREATE TABLE emp(eid int, 
ename varchar(32) NOT NULL);

DESC emp;

ALTER TABLE emp add column esal int;
ALTER TABLE emp MODIFY column esal float;
ALTER TABLE emp DROP column esal;
ALTER TABLE emp add PRIMARY KEY(eid);
ALTER TABLE emp DROP PRIMARY KEY;