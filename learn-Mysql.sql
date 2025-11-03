mysql -uroot -proot
system cls;
show databases;

CREATE DATABASE data;
USE data;

SHOW TABLES;

CREATE TABLES employees (
    eid int,
    ename varchar(32),
    esal int
);

DESCRIBE employees; /* OR */ DESC employees;

INSERT INTO employees VALUES (101, 'Rahul', 45000.45), (102, 'Sonia', 55000.55), (103, 'Priya', 65000.65);

SELECT * FROM employees;

UPDATE employees SET esal = 70000.00 WHERE eid = 102;