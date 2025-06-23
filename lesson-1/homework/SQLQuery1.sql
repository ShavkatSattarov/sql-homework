create database SchoolDB
use SchoolDB
create table Students1 (StudentID int PRIMARY KEY, Name VARCHAR(50), Age INT)
select * from Students1
insert into Students1 values ('101', 'Agzamchik', 27) 
insert into Students1 values ('102', 'Shermatov', 37) 
insert into Students1 values ('103', 'Qurbonov', 23)

/*
1. data - raw facts or information stored in database. Example: text, numbers, dates.
database - a structured collection of data. Example: A bank database with data about customers, accounts and transactions. 
relational database - a type of database that organizes data into tables that are related to each other through keys. 
Example: a "Customers" table is related to an "Accounts" table by customer ID. 
table - a structure in a relational database where data is stored in rows and columns. Example: a table named 
"Customers" with columns for ID, Name, Phone Number.

2. five key features of SQL Server
1. Relational Database Management
SQL Server is a Relational Database Management System (RDBMS), which means it stores data in tables with rows and columns, allowing for structured relationships between data using primary and foreign keys.

2. T-SQL (Transact-SQL)
SQL Server uses T-SQL, a powerful extension of standard SQL that includes:

Procedural programming (IF, WHILE, etc.)

Error handling

Variables

Stored procedures and functions

This allows for advanced querying and automation within the database.

3. Security and Authentication
SQL Server provides robust security features:

Authentication modes: Windows Authentication & SQL Server Authentication

Role-based access control

Data encryption at rest and in transit

Row-level security

This ensures controlled access and data protection.

4. High Availability & Disaster Recovery (HA/DR)
SQL Server supports several HA/DR solutions, such as:

Always On Availability Groups

Failover clustering

Database mirroring

Backup and restore strategies

These features ensure minimal downtime and data recovery in case of failure.

5. Business Intelligence (BI) Tools
SQL Server includes built-in BI capabilities:

SQL Server Integration Services (SSIS) for ETL

SQL Server Reporting Services (SSRS) for reports

SQL Server Analysis Services (SSAS) for OLAP and data mining

This supports data analysis, reporting, and decision-making.

3. What are the different authentication modes available when connecting to SQL Server? (Give at least 2)

When connecting to SQL Server, there are two main authentication modes:

Windows Authentication Mode

Uses the Windows user account of the person or application connecting.

Authentication is handled by the Windows operating system (Active Directory or local accounts).

More secure in domain environments — supports Kerberos and single sign-on (SSO).

Recommended for enterprise environments.

SQL Server Authentication Mode

Uses SQL Server-specific login credentials (username and password stored in SQL Server).

Authentication is managed by SQL Server itself, not by Windows.

Useful when users are outside the Windows domain (e.g., external apps or mixed OS clients).

💡 SQL Server can be configured to use:

Windows-only authentication

Mixed Mode authentication (Windows + SQL Server)


6. Describe the differences between SQL Server, SSMS, and SQL.

1. SQL Server
🔹 What it is:
A Database Management System (DBMS) developed by Microsoft.
🔹 Purpose:
Stores, manages, and processes data. It allows users and applications to run queries, create databases, manage users, and more.
🔹 Example:
Installed on a server to handle all data-related operations and queries.

2. SSMS (SQL Server Management Studio)
🔹 What it is:
A graphical interface tool (GUI) used to work with SQL Server.
🔹 Purpose:
Lets you connect to SQL Server, write SQL queries, manage databases, view data, perform backups, manage users, etc.
🔹 Example:
Like a control panel or dashboard to interact with SQL Server in a user-friendly way.

3. SQL (Structured Query Language)
🔹 What it is:
A programming/query language used for working with databases.
🔹 Purpose:
Used to create, read, update, and delete data (CRUD). Includes commands like SELECT, INSERT, UPDATE, and DELETE.
🔹 Example:

SELECT * FROM Customers WHERE City = 'Tashkent';


7. Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.


Category	Full Name	Purpose	Examples
DQL	Data Query Language	Retrieve data	SELECT
DML	Data Manipulation Language	Insert, update, delete data	INSERT, UPDATE, DELETE
DDL	Data Definition Language	Define or modify structure	CREATE, ALTER, DROP
DCL	Data Control Language	Grant/revoke permissions	GRANT, REVOKE
TCL	Transaction Control Language	Manage transactions	COMMIT, ROLLBACK
*/

