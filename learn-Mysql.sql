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

