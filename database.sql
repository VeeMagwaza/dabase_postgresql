# dabase_postgresql

postgres=# CREATE DATABASE Umuzi;
umuzi=# create table Customers (
umuzi(# CustomerID bigserial not null primary key,
umuzi(# FirstName varchar(50) not null,
umuzi(# LastName varchar(50) not null,
umuzi(# Gender varchar(7) not null,
umuzi(# Address varchar(200) not null,
umuzi(# Phone BIGINT not null,
umuzi(# Email varchar(100),
umuzi(# City varchar(20) not null,
umuzi(# Country varchar(50) );
CREATE TABLE
umuzi=#

umuzi=# \d
                    List of relations
 Schema |           Name           |   Type   |  Owner
--------+--------------------------+----------+----------
 public | customers                | table    | postgres
 public | customers_customerid_seq | sequence | postgres
(2 rows)


umuzi=# \d Customers
                                          Table "public.customers"
   Column   |          Type          | Collation | Nullable |                    Default
------------+------------------------+-----------+----------+-----------------------------------------------
 customerid | bigint                 |           | not null | nextval('customers_customerid_seq'::regclass)
 firstname  | character varying(50)  |           | not null |
 lastname   | character varying(50)  |           | not null |
 gender     | character varying(7)   |           | not null |
 address    | character varying(200) |           | not null |
 phone      | bigint                 |           | not null |
 email      | character varying(100) |           |          |
 city       | character varying(20)  |           | not null |
 country    | character varying(50)  |           |          |
Indexes:
    "customers_pkey" PRIMARY KEY, btree (customerid)


umuzi=#


umuzi=# create table Employees (
umuzi(# EmployeeID bigserial not null primary key,
umuzi(# FirstName varchar(50) not null,
umuzi(# LastName varchar(50) not null,
umuzi(# Email varchar(100),
umuzi(# JobTitle varchar(20) not null );
CREATE TABLE


umuzi=# CREATE TABLE Orders (
umuzi(# OrderID bigserial not null primary key,
umuzi(# ProductID int not null,
umuzi(# PaymentID int not null,
umuzi(# FulfilledByEmployeeID int not null,
umuzi(# DateRequired date not null,
umuzi(# DateShipped date,
umuzi(# Status varchar(20) not null,
umuzi(# FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
umuzi(# FOREIGN KEY (FulfilledByEmployeeID) REFERENCES Employees (EmployeeID) );
CREATE TABLE

umuzi=# create table Payments (
umuzi(# CustomerId bigserial not null primary key,
umuzi(# PaymentID int not null,
umuzi(# PaymentDate date not null,
umuzi(# Amount decimal(10,2) not null );
CREATE TABLE


***** Insert DATA in tables *****

**Customers ***
umuzi=# INSERT INTO Customers VALUES (1,'John','Hilbert','Male','284 chaucer st',084789657,'john@gmail.com','Johannesburg','South Africa'),
umuzi-# (2,'Thando', 'Sithole','Female','240 Sect 1',0794445584,'thando@gmail.com','Cape Town','South Africa'),
umuzi-# (3,'Leon','Glen','Male','81 Everton Rd,Gillits',0820832830,'Leon@gmail.com','Durban','South Africa'),
umuzi-# (4,'Charl','Muller','Male','290A Dorset Ecke',44856872553,'Charl.muller@yahoo.com','Berlin','Germany'),
umuzi-# (5,'Julia','Stein','Female','2 Wernerring',448672445058,'Js234@yahoo.com','Frankfurt','Germany');
INSERT 0 5
umuzi=# \d Customers


***Employees***

umuzi=# INSERT INTO Employees VALUES (1,'Kani','Matthew','mat@gmail.com','Manager'),
umuzi-# (2,'Lesly','Cronje','LesC@gmail.com','Clerk'),
umuzi-# (3,'Gideon','Maduku','m@gmail.com','Accountant');
INSERT 0 3
umuzi=#



***Orders***
 INSERT INTO Orders VALUES (1,1,1,2,'2018-09-05 00:00:00',NULL,'Not shipped'),
umuzi-# (2,1,2,2,'2018-09-04 00:00:00','2018-09-03 00:00:00','Shipped'),
umuzi-# (3,3,3,3,'2018-09-06 00:00:00',NULL,'Not shipped');
INSERT 0 3

****Payments****

umuzi=# INSERT INTO Payments VALUES (1,1,'2018-09-01 ',150.75),
umuzi-# (4,3,'2018-09-03 00:00:00',700.60),
umuzi-# (5,2,'2018-09-03',150.70);
INSERT 0 3

***Products***

INSERT INTO VALUES (1,'Harley Davidson Chopper','This replica features working kickstand, front suspension, gear-shift lever',150.75),
(2,'Classic Car','Turnable front wheels, steering function',550.75),
(3,'Sports car','Turnable front wheels, steering function',700.60);


SELECT * FROM Customers;

umuzi=# SELECT FirstName FROM Customers;
 firstname
-----------
 John
 Thando
 Leon
 Charl
 Julia
(5 rows)

SELECT * FROM Customers WHERE CustomerID IN (1);

UPDATE Customers
SET FirstName = 'Lerato', LastName= 'Mabitso'
WHERE CustomerID = 1;

DELETE FROM Customers WHERE CustomerID IN(2);

SELECT COUNT(DISTINCT Status) FROM Orders;

SELECT MAX(Amount) FROM Payments;

SELECT * FROM Customers ORDER BY Country;

SELECT * FROM Products WHERE BuyPrice BETWEEN 100 AND 600;

SELECT SUM(Amount) FROM Payments;

SELECT COUNT(Status) FROM Orders WHERE Status IN ('Shipped');

SELECT AVG(BuyPrice) AS Price_Rands,AVG(BuyPrice)*12 AS Price_Dollars FROM Products;

SELECT * FROM Payments INNER JOIN Customers ON Payments.CustomerID = Customers.CustomerID;

SELECT * FROM Products WHERE Description LIKE '%Turnable front wheels%';


