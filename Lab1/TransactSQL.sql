USE AdventureWorks2019

SELECT * FROM HumanResources.Employee
--Khai báo biến
GO
DECLARE @depID INT --khai báo biến depID kiểu int
SET @depID = 1;
SELECT Name, GroupName FROM HumanResources.Department WHERE DepartmentID = @depID
GO
SELECT @@LANGUAGE
SELECT @@VERSION

GO
SELECT SUM(StandardCost) FROM Production.ProductCostHistory

SELECT AVG(StandardCost) FROM Production.ProductCostHistory

SELECT MAX(StandardCost) FROM Production.ProductCostHistory

SELECT COUNT(*) FROM Production.ProductPhoto

SELECT GETDATE()

SELECT DATEPART(HH, GETDATE())

SELECT CONVERT(varchar(50), GETDATE(), 103)

SELECT DB_ID('AdventureWorks2019')

--Tạo csdl 
CREATE DATABASE EXAMPLE3
USE EXAMPLE3
--TẠO BẢNG TRONG CSDL
CREATE TABLE Contacts(MailID VARCHAR(20), Name NTEXT, TelephoneNumber INT)
--Thêm 1 cột vào bảng đã có
ALTER TABLE Contacts ADD Address NVARCHAR(50)
INSERT INTO Contacts values('abc@yahoo.com',N'Nguyễn Văn A',91271736,N'Hà Nội')
INSERT INTO Contacts values('hiepls@yahoo.com',N'Nguyễn Văn Hiệp',86271736,N'Hà Nội')
INSERT INTO Contacts values('hehe@yahoo.com',N'Nguyễn Văn B',85271736,N'Hà Nội')
INSERT INTO Contacts values('hoho@yahoo.com',N'Nguyễn Văn C',87271736,N'Hà Nội')

SELECT * FROM Contacts

--xóa bản ghi 
DELETE FROM Contacts WHERE MailID = 'abc@yahoo.com'
--sửa bản ghi
UPDATE Contacts SET Name=N'Hoàng Văn D' WHERE MailID='hoho@yahoo.com'