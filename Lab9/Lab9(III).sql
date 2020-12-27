CREATE DATABASE LAB09
GO
USE LAB09
GO
CREATE TABLE Customers (
	CustomerID int PRIMARY KEY identity,
	CustomerName varchar(50),
	Address varchar(100),
	Phone varchar(12)
)
GO
INSERT INTO Customers(CustomerName, Address, Phone) VALUES
('John Cena', 'Los Angeles', '948631746'),
('Harry Quine', 'New York', '899474537'),
('Bruno Mark', 'San Francisco', '834947393'),
('Manner Sight', 'Chicago', '812646559'),
('Whey Seiler', 'Washington D.C', '647463819')
GO
CREATE TABLE Books (
	BookCode int PRIMARY KEY,
	Category varchar(50),
	Author varchar(50),
	Publisher varchar(50),
	Title varchar(100),
	Price int,
	InStore int
)
GO
INSERT INTO Books VALUES
(101,'Action and Adventure', 'Yann Martel', 'Binh Minh', 'Life of Pi', 9, 7000),
(102,'Comic Book', 'Robert Kirkman', 'Binh Minh', 'The Walking Dead: Compendium One', 28, 3000),
(103,'Detective and Mystery', 'Sir Arthur Conan Doyle', 'Binh Minh', 'The Adventures of Sherlick Holmes',8, 4000),
(104,'Fantasy', 'Leigh Bardugo', 'Binh Minh', 'Ninth House',14, 2500),
(105,'Horror', 'Stephen King', 'Binh Minh', 'Carrie',3, 6000)
GO
CREATE TABLE BookSold (
	BookSoldID int PRIMARY KEY,
	CustomerID int,
	BookCode int,
	[Date] datetime,
	Price int,
	Amount int,
	CONSTRAINT FK_CusID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT FK_BkCode FOREIGN KEY (BookCode) REFERENCES Books(BookCode)
)
INSERT INTO BookSold VALUES
(201,1,101,'2020-11-20',8,2),
(202,2,102,'2020-10-23',27,1),
(203,3,103,'2020-11-22',7,2),
(204,4,104,'2020-09-12',14,1),
(205,5,105,'2020-11-15',3,1),
(206,3,103,'2020-11-15',7,1),
(207,5,105,'2020-11-15',3,1),
(208,1,102,'2020-11-15',27,1),
(209,2,105,'2020-11-15',3,1),
(210,1,101,'2020-11-15',8,1)

DROP TABLE BookSold
GO
DROP TABLE Customers
GO
DROP TABLE Books

SELECT * FROM Books
SELECT * FROM Customer
SELECT * FROM BookSold
--2
CREATE VIEW V_BookList AS 
SELECT BookSold.BookCode, Title, COUNT(Amount) AS 'Quantity', SUM(BookSold.Price) AS 'Price' FROM BookSold
INNER JOIN Books  ON BookSold.BookCode = Books.BookCode GROUP BY Title, BookSold.BookCode

SELECT * FROM V_BookList
DROP VIEW V_BookList

--3
CREATE VIEW V_Customer_List AS
SELECT c.CustomerID, CustomerName, Address, SUM(Amount) AS "Total Book Quantity" FROM Customers AS c
INNER JOIN BookSold as bs ON c.CustomerID = bs.CustomerID 
GROUP BY c.CustomerID, CustomerName, Address

SELECT * FROM V_Customer_List

--4
CREATE VIEW V_Customer_List_BkTitle AS
SELECT BookSold.CustomerID, CustomerName, Address, Title, date FROM 
((Customers INNER JOIN BookSold ON Customers.CustomerID = BookSold.CustomerID)
				INNER JOIN Books ON BookSold.BookCode = Books.BookCode)
GROUP BY BookSold.CustomerID, CustomerName, Address, Title, date
HAVING (DATEPART(mm, GETDATE()) = DATEPART(mm, BookSold.[date]) + 1)

SELECT * FROM V_Customer_List_BkTitle
--5
CREATE VIEW V_Customer_List_totalBkMoney AS
SELECT bs.CustomerID, CustomerName, Address, SUM(bs.Price * Amount)
AS TotalMoney FROM Customers c INNER JOIN BookSold as bs 
ON c.CustomerID = bs.CustomerID GROUP BY bs.CustomerID, CustomerName, Address

SELECT * FROM V_Customer_List_totalBkMoney