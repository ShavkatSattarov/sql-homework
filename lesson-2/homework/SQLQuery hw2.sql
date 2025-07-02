--Lesson 2: DDL and DML Commands
--Notes before doing the tasks:

--Tasks should be solved using SQL Server.
--Case insensitivity applies.
--Alias names do not affect the score.
--Scoring is based on the correct output.
--One correct solution is sufficient.

/*
Basic-Level Tasks (10)
Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
Update the Salary of an employee to 7000 where EmpID = 1.
Delete a record from the Employees table where EmpID = 2.
Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
Modify the Name column in the Employees table to VARCHAR(100).
Add a new column Department (VARCHAR(50)) to the Employees table.
Change the data type of the Salary column to FLOAT.
Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
Remove all records from the Employees table without deleting its structure.
Intermediate-Level Tasks (6)
Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).
Update the Department of all employees where Salary > 5000 to 'Management'.
Write a query that removes all employees but keeps the table structure intact.
Drop the Department column from the Employees table.
Rename the Employees table to StaffMembers using SQL commands.
Write a query to completely remove the Departments table from the database.
Advanced-Level Tasks (9)
Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
Add a CHECK constraint to ensure Price is always greater than 0.
Modify the table to add a StockQuantity column with a DEFAULT value of 50.
Rename Category to ProductCategory
Insert 5 records into the Products table using standard INSERT INTO queries.
Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
Rename the Products table to Inventory.
Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.
*/

--1

create table Employees (EmpID int, Name varchar(50), Salary decimal(10,2))

--2
select * from Employees
insert into Employees values 
(1, 'Agzamchik', 100),
(2, 'Anvar', 120),
(3, 'Dadakhon', 130);

--3
update Employees
set Salary = 7000
where EmpID = 1;

--4
delete from Employees
where EmpID =2;

--5
/*
delete - removes specific rows from a table based on a where condition. it is logged and can be rolled back. 
Table structure and indexes remain. 

truncate - removes all rows from a table quickly and cannot filter with a where clause. 
it is less logged than delete, often faster, and cannot be rolled back in some systems.
table structure remains.

drop - completely removes the table (or the object) from the database, including all data, structure,
constraints, and indexes. this operation cannot be rolled back.
*/

--6
alter table Employees 
alter column Name varchar(100);

--7
alter table Employees 
add Department varchar(50);

--8
alter table Employees
alter column Salary FLOAT;

--9
create table Departments (DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50))

--10
truncate table Employees


--11
select * from Departments
insert into Departments values 
(101, 'RMD'),
(201, 'HR'),
(301, 'VED'),
(401, 'APPARAT'),
(501, 'KAZNA');


--12
UPDATE Employees
SET Department = 'Management'
where Salary > 5000;

--13
truncate table Employees

--14
alter table Employees
drop column Department;

--15
exec sp_rename Employees, StaffMembers;

--16
drop table Departments

--17
create table Products (ProductID int Primary Key, ProductName varchar(100), Category varchar(100), Price decimal(10,2))

--18
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

--19
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

--20

ALTER TABLE Products
EXEC sp_rename 'dbo.Products.Category', 'ProductCategory', 'COLUMN';


--21
select * from Products
insert into Products values
(100, 'Song', 'BYD', 30000, 10),
(101, 'Nexia', 'GM', 10000, 20),
(102, 'Nexia1', 'GM', 10000, 30),
(103, 'Nexia2', 'GM', 10000, 40),
(104, 'Nexia3', 'GM', 10000, 50);

--22
SELECT * INTO Products_Backup
FROM Products;

--23
exec sp_rename Products, Inventory;

--24
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

--25
CREATE TABLE Inventory_New (
    ProductCode INT IDENTITY(1000,5) PRIMARY KEY,
    ProductID INT,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(100),
    Price FLOAT,
    StockQuantity INT
);

INSERT INTO Inventory_New (ProductID, ProductName, ProductCategory, Price, StockQuantity)
SELECT ProductID, ProductName, ProductCategory, Price, StockQuantity
FROM Inventory;
