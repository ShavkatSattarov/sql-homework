/*

home work lesson3

Easy-Level Tasks (10)

1. Define and explain the purpose of BULK INSERT in SQL Server
BULK INSERT is a SQL Server command used to efficiently load large volumes of data from an external file (e.g., .csv, .txt) directly into a database table.

Purpose:

The main purpose of BULK INSERT is to simplify and speed up the mass data import process by bypassing row-by-row INSERT operations, which are much slower. It is especially useful for:

importing report data;

data migration;

loading logs or transaction records;

routine data synchronization.

Example:

sql
Копировать
Редактировать
BULK INSERT Sales
FROM 'C:\data\sales_data.csv'
WITH (
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n', 
    FIRSTROW = 2
);
This example loads data from the sales_data.csv file into the Sales table, skipping the first row (headers), and using commas as field delimiters.




2. List four file formats that can be imported into SQL Server.
Here are four file formats that can be imported into SQL Server:

CSV (Comma-Separated Values)
Commonly used for exporting/importing tabular data. Easily handled using BULK INSERT, bcp, or OPENROWSET.

TXT (Plain Text Files)
Text files with custom delimiters (e.g., tab-separated). Often used in legacy systems or manual data exports.

XML (eXtensible Markup Language)
Can be imported using OPENXML, xml data type, or BULK INSERT with format files.

JSON (JavaScript Object Notation)
Supported via the OPENJSON function or by loading into a column of type nvarchar and parsing it.




3. Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
*/

create table Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10,2))

Select * from Products




/*
4. Insert three records into the Products table using INSERT INTO.
*/
insert into Products (ProductID, ProductName, Price) values
(101, 'bread', 8000),
(102, 'water', 12000),
(103, 'apple', 18000);




/*
5. Explain the difference between NULL and NOT NULL.
NULL and NOT NULL are attributes that define whether a column in a table can contain an empty (unknown or missing) value.

📌 Differences:
NULL means that the field can be left empty (the value is unknown or not provided).

Example: If an employee has no middle name, the field can be NULL.

NOT NULL means that the field must have a value.

It cannot be left blank during INSERT or UPDATE.

🔧 Example:
sql
Копировать
Редактировать
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50) NULL,
    LastName VARCHAR(50) NOT NULL
);
Here, MiddleName is optional, while FirstName and LastName are required.




6. Add a UNIQUE constraint to the ProductName column in the Products table.
*/

ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName_2 UNIQUE (ProductName);



/*
7. Write a comment in a SQL query explaining its purpose.

-- This query inserts three new products into the Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(104, 'milk', 10000),
(105, 'cheese', 25000),
(106, 'butter', 18000);



8. Add CategoryID column to the Products table.
*/

alter table Products
add CategoryID int;


/*
9. Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
*/
create table Categories (CategoryID int PRIMARY KEY, CategoryName varchar(100) UNIQUE);

select * from Categories

/*
10. Explain the purpose of the IDENTITY column in SQL Server.
The IDENTITY column in SQL Server is used to automatically generate unique numeric values for each new row inserted into a table — usually for primary keys.

📌 Main Purposes:
Auto-increment values without manual input.

Ensure each row has a unique identifier.

Useful for primary keys in tables like Users, Orders, Products.

🔧 Syntax Example:
sql
Копировать
Редактировать
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100)
);
IDENTITY(1,1) means:

Start at 1,

Increment by 1 for each new row.

Each time a new Customer is inserted, SQL Server will automatically assign the next number to CustomerID.



🟠 Medium-Level Tasks (10)

11. Use BULK INSERT to import data from a text file into the Products table.
*/

bulk insert Products 
from 'C:\Users\admin\Desktop\Products.txt'
with (
	FIELDTERMINATOR = ',',   -- разделитель полей (например, запятая)
    ROWTERMINATOR = '\n',    -- конец строки
    FIRSTROW = 2			 -- если первая строка — заголовки
);



/*
12. Create a FOREIGN KEY in the Products table that references the Categories table.
*/

UPDATE Products
SET CategoryID = 1
WHERE CategoryID IS NULL;

INSERT INTO Categories (CategoryID, CategoryName)
VALUES 
(1, 'Dairy'),
(2, 'Baked Goods'),
(3, 'Drinks');



UPDATE Products SET CategoryID = 2 WHERE ProductName = 'bread';
UPDATE Products SET CategoryID = 3 WHERE ProductName = 'water';
UPDATE Products SET CategoryID = 2 WHERE ProductName = 'apple';

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

/*

13. Explain the differences between PRIMARY KEY and UNIQUE KEY.
🇬🇧 In English:
Criteria	PRIMARY KEY	UNIQUE KEY
🔑 Uniqueness	Yes	Yes
🚫 Allows NULL	❌ No	✅ Yes (usually once)
🔢 One per table?	❗ Only one	✅ Multiple allowed
🧱 Purpose	Uniquely identifies each row	Enforces uniqueness of values
📎 Index type	Creates clustered index (by default)	Creates non-clustered index (by default)


14. Add a CHECK constraint to the Products table ensuring Price > 0.
*/
select * from Categories
select * from Products

alter table Products
add constraint CHK_Price_Positive
Check (Price > 0);
/*


15. Modify the Products table to add a column Stock (INT, NOT NULL).

*/
alter table Products
add Stock int not null default 0;

/*
16. Use the ISNULL function to replace NULL values in Price column with a 0.
*/
SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;

/*
17. ✅ Purpose:
A FOREIGN KEY constraint is used to establish a relationship between two tables. It ensures that the value in a column (or group of columns) in one table matches a value in another table — maintaining referential integrity.

📌 Example:
sql
Копировать
Редактировать
-- Parent table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

-- Child table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
*/

/*
Hard-Level Tasks (10)

18. Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
*/

create table Customers (Age int not null,
check (Age >= 18));
select * from Customers

/*
19. Create a table with an IDENTITY column starting at 100 and incrementing by 10.
*/
CREATE TABLE SampleTable (
    ID INT IDENTITY(100, 10) PRIMARY KEY,
    Name VARCHAR(100),
    CreatedDate DATETIME DEFAULT GETDATE()
);
select * from SampleTable
/*
20. Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
*/
create table OrderDetails (
ID int Primary key
);
select * from OrderDetails
/*
21. Explain the use of COALESCE and ISNULL functions for handling NULL values.
✅ COALESCE and ISNULL — Functions to Handle NULL Values in SQL Server
Both functions are used to replace NULL values with default values, but they have some differences.

🔹 ISNULL — Simple Replacement of NULL with a Default Value
sql
Копировать
Редактировать
SELECT ISNULL(Price, 0) AS AdjustedPrice FROM Products;
What it does:
If Price is NULL, it returns 0; otherwise, it returns the value of Price.

Limitations:

Can only take two arguments.

Returns the data type of the first argument.

🔹 COALESCE — Returns the First Non-NULL Value from a List
sql
Копировать
Редактировать
SELECT COALESCE(DiscountPrice, RegularPrice, 0) AS FinalPrice FROM Products;
What it does:
It checks the values from left to right and returns the first non-NULL value.
If both DiscountPrice and RegularPrice are NULL, it returns 0.

Advantages:

Can handle multiple arguments.

Returns the data type of the first non-NULL value (based on SQL standard).

More portable across different database systems.



22. Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
*/
create table Employees (EmpID int Primary key,
Email varchar (50) unique);

select * from Employees

drop table Employees
/*
23. Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
*/
CREATE TABLE Customers12 (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers12 (CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);