IF DB_ID('Assignment2') IS NOT NULL
	DROP Database Assignment2 
ELSE 
	CREATE DATABASE Assignment2
GO
USE Assignment2
GO
CREATE TABLE Company(
	ComID int PRIMARY KEY,
	ComName nvarchar(50),
	Tel varchar(8) CHECK (DATALENGTH(Tel) = 8 AND Tel NOT LIKE '%[^0-9]%' ),
	Address varchar(10)
)
DROP TABLE Company
INSERT INTO Company VALUES
(201, 'ASUS', '91826381','USA'),
(202, 'LENOVO', '91823748', 'CHINA'),
(203, 'ACER', '91724648', 'USA'),
INSERT INTO Company VALUES (204, 'HP', '91726463', 'USA')
GO
CREATE TABLE Category(
	CateID int PRIMARY KEY,
	CateName nvarchar(50)
)
INSERT INTO Category VALUES 
(101, N'Máy Tính'),
(102, N'Điện Thoại'),
(103, N'Máy In')

GO
CREATE TABLE Product(
	ProductID varchar(3) PRIMARY KEY,
	ProductName nvarchar(50),
	Description nvarchar(100),
	Unit nvarchar(10),
	Price smallmoney,
	Qty int,
	ComID int,
	CateID int,
	CONSTRAINT FK_ComID FOREIGN KEY (ComID) REFERENCES Company(ComID),
	CONSTRAINT FK_CateID FOREIGN KEY (CateID) REFERENCES Category(CateID)
)
DROP TABLE Product
INSERT INTO Product VALUES
('A01', N'Máy Tính T450', N'Máy nhập cũ', N'Chiếc',1000 ,10 ,202 ,101 ),
('A02', N'Điện Thoại Nokia 5670', N'Điện thoại đang hot', N'Chiếc',200 ,200 ,201 ,102 ),
('A03', N'Máy In Samsung 450', N'Máy in đang loại bình', N'Chiếc',100 ,10 ,203 ,103 )
SELECT * FROM Product
SELECT * FROM Company
SELECT * FROM Category
--4
	--4a
	SELECT ComID, ComName FROM Company
	--4b
	SELECT * FROM Product
--5
	--5a
	SELECT ComID, ComName FROM Company ORDER BY ComName DESC
	--5b
	SELECT * FROM Product ORDER BY Price DESC
	--5c
	SELECT * FROM Company WHERE ComName LIKE 'ASUS'
	--5d
	SELECT * FROM Product WHERE Qty < 11
	--5e
	SELECT ProductID, ProductName, ComName FROM Product 
	INNER JOIN Company ON Product.ComID = Company.ComID
	WHERE ComName LIKE 'ASUS'
--6
	--6a
	SELECT COUNT(ComName) AS 'ComQty' FROM Company 
	INNER JOIN Product ON Company.ComID = Product.ComID
	--6b
	SELECT COUNT(ProductID) FROM Product
	--6c
	SELECT ComName, Count(CateName) AS 'CompanyCate' FROM((Company
	INNER JOIN  Product ON Company.ComID = Product.ComID)
	INNER JOIN Category ON Product.CateID = Category.CateID)
	GROUP BY ComName
	--6d
	SELECT COUNT(DISTINCT CateName) AS 'Categories' FROM Category
	INNER JOIN Product ON Category.CateID = Product.CateID
--7
	--7a
	ALTER TABLE Product
		ADD CONSTRAINT CK_ProductPrice CHECK (Price > 0)
	--7b
	ALTER TABLE Company
		ADD CONSTRAINT CK_TelNum CHECK (Tel LIKE '0%' AND DATALENGTH(Tel) = 8 AND Tel NOT LIKE '%[^0-9]%')
	--7c
	AlTER TABLE Product
		ADD CONSTRAINT PK_ProID PRIMARY KEY (ProductID)
	ALTER TABLE Product 
		ADD CONSTRAINT Fk_ComID FOREIGN KEY (ComID) REFERENCES Company(ComID)
	ALTER TABLE Product
		ADD CONSTRAINT Fk_CateID FOREIGN KEY (CateID) REFERENCES Category(CateID)
--8
	--8a
	CREATE INDEX IX_Des ON Product(Description)
	CREATE INDEX IX_Name ON Product(ProductName)