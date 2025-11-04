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

