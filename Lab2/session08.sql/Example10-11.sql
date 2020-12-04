CREATE TABLE Customers
(
	FirstName varchar(25) NOT NULL,
	LastName varchar(25) NOT NULL, 
	ContactNumber varchar(15) NULL,
	Salary money NOT NULL,
	Comments varchar(1000) NULL
)
INSERT INTO Customers VALUES('Daniel', 'Johnson',NULL, 3000, NULL);
SELECT * FROM Customers

CREATE TABLE Customers2
(
	FirstName varchar(25) NOT NULL,
	LastName varchar(25) NOT NULL,
	ContactNumber varchar(15) SPARSE NULL,
	Salary money NOT NULL,
	Comments varchar(1000) SPARSE NULL,
	AllSparseColumns xml COLUMN_SET FOR ALL_SPARSE_COLUMNS
)
SELECT * FROM Customers2 