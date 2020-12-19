IF DB_ID ('Assignment3') IS NOT NULL
	DROP DATABASE Assignment3
ELSE 
	CREATE DATABASE Assignment3
GO
USE Assignment3
GO
CREATE TABLE [Services](
	ServicesID int PRIMARY KEY,
	Name nvarchar(20),
	Description nvarchar(50)
)
INSERT INTO [Services] VALUES
(101, N'Trả trước', NULL),
(102, N'Trả sau', NULL)
GO
CREATE TABLE CusTel(
	CusID varchar(3),
	tel varchar(10) PRIMARY KEY,
	Services_ID int,
	StartDate date,
	EndDate date
)
INSERT INTO CusTel VALUES
('A01', '0123456789', '101', '2020-09-10', '2020-11-10'),
('A02', '0138475819', '102', '2019-10-11', NULL)

INSERT INTO CusTel VALUES ('A01', '0348483145', '101', '2016-06-08', NULL)
INSERT INTO CusTel VALUES('A03', '0394877002', '102', '2009-12-12', NULL)
DELETE FROM CusTel WHERE CusID LIKE 'A03' 
GO
SELECT * FROM CusTel
CREATE TABLE Customer(
	Cus_ID varchar(3) PRIMARY KEY,
	Name nvarchar(50),
	ID varchar(9),
	Address nvarchar(50),
)
INSERT INTO Customer VALUES 
('A01', N'Nguyễn Nguyệt Nga', '123456789', N'Cầu Giấy - Hà Nội'),
('A02', N'Hoàng Văn Hoan', '281749174', N'Thanh Xuân - Hà Nội')
INSERT INTO Customer VALUES ('A03', N'Trần Mạnh Hùng', '817491749', N'Hà Đông - Hà Nội')

--4
	--4a
	SELECT * FROM Customer
	--4b
	SELECT * FROM CusTel
--5
	--5a
	SELECT * FROM Customer INNER JOIN CusTel 
	ON Customer.Cus_ID = CusTel.CusID
	WHERE tel LIKE '0123456789' 
	--5b
	SELECT * FROM Customer WHERE ID LIKE '123456789'
	--5c
	SELECT tel FROM CusTel INNER JOIN Customer
	ON CusTel.CusID = Customer.Cus_ID WHERE 
	ID LIKE '123456789'
	--5d
	SELECT tel, Name, StartDate FROM CusTel 
	INNER JOIN Customer ON CusTel.CusID = Customer.Cus_ID
	WHERE StartDate LIKE '2009-12-12'
	--5e
	SELECT tel, Name, Address FROM CusTel INNER JOIN 
	Customer ON CusTel
--6
	--6a
	SELECT COUNT(Cus_ID) AS Customers FROM Customer
	--6b
	SELECT COUNT(tel) AS Tels FROM CusTel
	--6c
	SELECT COUNT(tel) AS TelDetails FROM CusTel 
	WHERE StartDate LIKE '2009-12-12'
	--6d
	SELECT Name, ID, Address, tel, Services_ID, StartDate, EndDate FROM Customer INNER JOIN CusTel 
	ON CusTomer.Cus_ID = CusTel.CusID 
--7
	--7a
	ALTER TABLE CusTel
		ALTER COLUMN StartDate date NOT NULL
	--7b
	ALTER TABLE CusTel
		ADD CONSTRAINT CK_StartDate CHECK (StartDate <= GETDATE())
	--7c
	ALTER TABLE CusTel
		ADD CONSTRAINT CK_Tel CHECK (DATALENGTH(tel) = 10 AND tel LIKE '09%' )
	--7d
	ALTER TABLE CusTel
		ADD Points int
--8
	--8a
	CREATE INDEX IX_CusName ON Customer(Name)
