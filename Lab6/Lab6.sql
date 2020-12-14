CREATE TABLE [Order] (
	OrderID varchar(3) PRIMARY KEY,
	OrderedDate date,
	Status int,
	CusId int,
	CONSTRAINT fk_CUS FOREIGN KEY (CusId) REFERENCES Customer(CustomerID)
)

CREATE TABLE OrderDetail(
	OrderId varchar(3),
	ProductId int,
	qty int,
	Price money,
	CONSTRAINT fk_odID FOREIGN KEY (OrderId) REFERENCES [Order](OrderID),
	CONSTRAINT fk_ProId FOREIGN KEY (ProductId) REFERENCES Product(ProdID)
)

CREATE TABLE Customer (
	CustomerID int PRIMARY KEY,
	CustomerName nvarchar(50),
	Address nvarchar(100),
	PhoneNumber varchar(9)
)

CREATE TABLE Product(
	ProdID int PRIMARY KEY,	
	Name nvarchar(50),
	unit nvarchar(10),
	ProductPrice money,
	Quantity int,
	ProductStatus nvarchar(30),
	Description nvarchar(100),
	CatID int
)

CREATE TABLE Category(
	CategoryID int PRIMARY KEY,
	CatName nvarchar(50)
)


DROP TABLE [Order] 
DROP TABLE Customer
DROP TABLE Product 
DROP TABLE Category
DROP TABLE OrderDetail

INSERT INTO Customer VALUES 
(101, N'Nguyễn Văn An', N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','847492831'),
(102, N'Hoàng Văn Hùng', N'200 Dịch Vọng, Cầu Giấy, Hà Nội', '384658463')

INSERT INTO Product VALUES 
(201,N'Máy Tính T450',N'Chiếc', 1000, 1, N'Còn hàng', N'Máy nhập mới', 1),
(202,N'Điện Thoại Nokia5670',N'Chiếc', 200, 2, N'Còn hàng', N'Điện thoại đang hot', 2),
(203,N'Máy In Samsung 450',N'Chiếc', 100, 1, N'Còn hàng', N'Máy in đang ế', 3)   

INSERT INTO Category VALUES
(1, N'Máy tính'),
(2, N'Điện thoại'),
(3, N'Máy in')

INSERT INTO [Order] VALUES 
(301, '2009-11-18', 1, 101),
(302, '2009-11-19', 2, 102)

INSERT INTO OrderDetail VALUES
(301, 201, 1, 1000),
(302, 203, 1, 100)

SELECT * FROM [Order]
SELECT * FROM Customer 
SELECT * FROM Product 
SELECT * FROM Category 
SELECT * FROM OrderDetail
--4
	--4a
SELECT CustomerID, CustomerName FROM Customer
	--4b
SELECT ProdID, Name FROM Product
	--4c
SELECT OrderId, ProductId, Name FROM OrderDetail 
INNER JOIN Product ON OrderDetail.ProductID = Product.ProdID
--5
	--5a
	SELECT * FROM Customer ORDER BY CustomerName ASC
	--5b
	SELECT * FROM Product ORDER BY ProductPrice DESC
	--5c
	SELECT Customer.CustomerName, Product.ProdID, Product.Name 
	FROM (((Customer 
			INNER JOIN [Order] ON Customer.CustomerID = CusId)
			INNER JOIN OrderDetail ON [Order].OrderID = OrderDetail.OrderId)
			INNER JOIN Product ON OrderDetail.ProductId = Product.ProdID);
--6
	--6a
	SELECT Count(CustomerID) AS 'Numbers of Customer' FROM Customer
	--6b
	SELECT COUNT(CategoryID) AS 'Numbers of Categories' FROM Category
	--6c
	SELECT OrderID, SUM(Price) FROM OrderDetail GROUP BY OrderID
--7
	--7a
	ALTER TABLE Product ADD CONSTRAINT CK_Price CHECK (ProductPrice > 0)
	--7b
	ALTER TABLE [Order] ADD CONSTRAINT CK_date CHECK (OrderedDate < GETDATE())
	--7c
	ALTER TABLE Product
	ADD NgayXuatHien datetime