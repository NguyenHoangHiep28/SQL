USE master
GO
IF (DB_ID('ASM') IS NOT NULL)
	DROP DATABASE ASM
ELSE 
	CREATE DATABASE ASM
GO
USE ASM
GO
CREATE TABLE Human(
	HumanID int PRIMARY KEY IDENTITY(10, 1),
	FullName nvarchar(50),
	[Address] nvarchar(100),
	DateOfBirth date
)
GO
INSERT INTO Human (FullName,[Address], DateOfBirth) VALUES 
(N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','11-18-87'),
(N'Hoàng Văn Nam',N'30 Dịch Vọng, Cầu Giấy, Hà Nội','12-12-09'),
(N'Lý Thị Ngân',N'280 Hai Bà Trưng, Hoàn Kiếm, Hà Nội','09-11-90')
SELECT * FROM Human
DROP TABLE Human
CREATE TABLE HumanContact(
	HumanID int,
	PhoneNumber varchar(9) PRIMARY KEY,
	CONSTRAINT FK_HumanID FOREIGN KEY (HumanID) REFERENCES Human(HumanID)
)
GO
INSERT INTO HumanContact VALUES 
(10,'987654321'),
(10,'09873452'),
(10,'09832323'),
(10,'09434343'),
(11,'123456789'),
(12,'09487213')
GO
SELECT * FROM HumanContact
DROP TABLE HumanContact
--4
	--a
	SELECT HumanID, FullName FROM Human
	--b
	SELECT PhoneNumber FROM HumanContact
--5
	--a
	SELECT HumanID, FullName FROM Human ORDER BY FullName ASC
	--b
	SELECT PhoneNumber FROM HumanContact WHERE HumanID IN 
	(SELECT HumanID FROM Human WHERE FullName LIKE N'Nguyễn Văn An')
	--c
	SELECT HumanID, FullName FROM Human WHERE DateOfBirth LIKE '2009-12-12'
--6
	--a
	SELECT h.HumanID, FullName, COUNT(PhoneNumber) AS PhoneNumberQty 
	FROM Human h JOIN HumanContact AS hc ON h.HumanID = hc.HumanID
	GROUP BY h.HumanID, FullName
	--b
	SELECT COUNT(*) FROM Human AS BirthDayInDec 
	WHERE DATEPART(mm, DateOfBirth) = 12
	--c
	 SELECT  PhoneNumber, FullName, [Address], DateOfBirth FROM Human h
	 INNER JOIN HumanContact AS hc ON h.HumanID = hc.HumanID 
	--d
	SELECT * FROM Human WHERE HumanID IN 
	(SELECT HumanID FROM HumanContact WHERE PhoneNumber LIKE '123456789')
--7
	--a
	ALTER TABLE Human
		ADD CONSTRAINT CK_BirthDate CHECK (DateOfBirth < GETDATE())
	--b
	ALTER TABLE Human
		ADD CONSTRAINT PK_HumanID PRIMARY KEY (HumanID)
	ALTER TABLE HumanContact 
		ADD CONSTRAINT FK_humanid FOREIGN KEY (HumanID) REFERENCES Human(HumanID)
	--c
	ALTER TABLE HumanContact 
		ADD StartDate date 
--8
	--a
	CREATE CLUSTERED INDEX IX_FullName ON Human(FullName)
	CREATE INDEX IX_PhoneNumber ON HumanContact(PhoneNumber)
	--b
	CREATE VIEW V_PhoneNumber AS
	SELECT FullName, PhoneNumber FROM Human JOIN HumanContact
	ON Human.HumanID = HumanContact.HumanID
	GO
	SELECT * FROM V_PhoneNumber
	--
	GO
	CREATE VIEW V_BirthDate AS
	SELECT FullName,DateOfBirth,PhoneNumber FROM Human JOIN HumanContact
	ON Human.HumanID = HumanContact.HumanID 
	WHERE (DATEPART(mm, DateOfBirth) = DATEPART(mm, GETDATE()))
	--c
	CREATE PROCEDURE SP_ADD_PhoneBook AS
	BEGIN
		INSERT INTO Human(FullName,[Address], DateOfBirth) VALUES 
		(N'Trần Văn Minh', N'130 Nguyễn Trãi, Thanh Xuân, Hà Nội', '12-09-98');
		INSERT INTO HumanContact VALUES (13,'09756382', NULL);
	END
	GO
	EXEC SP_ADD_PhoneBook
	--
	CREATE PROCEDURE SP_Search_BookList 
		@Search nvarchar(50)
	AS
	SELECT  FullName, PhoneNumber,[Address] FROM Human h
	INNER JOIN HumanContact AS hc ON h.HumanID = hc.HumanID 
	WHERE FullName = @Search 
	GO
	EXEC SP_Search_BookList N'Nguyễn Văn An'
	DROP PROCEDURE SP_Search_BookList