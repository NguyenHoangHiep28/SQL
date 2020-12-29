USE Lab10
CREATE TABLE Toys (
	ProductCode varchar(5) PRIMARY KEY,
	[Name] varchar(30),
	Category varchar(30),
	Manufacturer varchar(40),
	AgeRange varchar(15),
	UnitPrice money,
	Netweight int,
	QtyOnHand int
)
GO
INSERT INTO Toys VALUES 
('1', 'Cars', 'Transportation Toys', 'Atlas Games', '3-5', 3, 600, 25),
('2', 'Motobikes', 'Transportation Toys', 'Clementoni', '3-5', 5, 400, 30),
('3', 'Bicycles', 'Transportation Toys', 'Goliath Games', '3-5', 2, 200, 45),
('4', 'Air Planes', 'Transportation Toys', 'Atlas Games', '3-5', 4, 700, 20),
('5', 'Trains', 'Transportation Toys', 'Hasbro', '3-5', 3, 1000, 25),
('6', 'African dolls', 'Doll', 'The LEGO Group', '3-5', 3, 250, 35),
('7', 'American Girls', 'Doll', 'Mattel', '3-5', 4, 320, 80),
('8', 'Fashion Dolls', 'Doll', 'Clementoni', '3-5', 7, 500, 100),
('9', 'China Dolls', 'Doll', 'Ravensburger', '3-5', 3, 800, 45),
('10', 'Paper Dolls', 'Doll', 'Thames & Kosmos', '3-5', 5, 750, 55),
('11', 'Robot dog', 'Electronic Toys', 'Hasbro', '3-5', 1, 230, 50),
('12', 'Robot kit', 'Electronic Toys', 'Mattel', '3-5', 2, 420, 46),
('13', 'USB toy', 'Electronic Toys', 'Goliath Games', '3-5', 4, 280, 70),
('14', 'Entertainment robot', 'Electronic Toys', 'TOMY', '3-5', 3, 650, 90),
('15', 'Digital Pet', 'Electronic Toys', 'Vtech Holdings', '3-5', 6, 560, 80);
GO
SELECT * FROM Toys
--2
CREATE PROCEDURE HeavyToys AS
SELECT * FROM Toys WHERE Netweight > 500
GO

--3
CREATE PROCEDURE PriceIncrease 
AS
UPDATE Toys SET UnitPrice = UnitPrice + 10
GO

DROP PROCEDURE PriceIncrease
--4
CREATE PROCEDURE QtyOnHand
AS
UPDATE Toys SET QtyOnHand = QtyOnHand - 5
GO
--5
EXECUTE HeavyToys
EXECUTE PriceIncrease
EXECUTE QtyOnHand
--IV 
	--1
	EXECUTE sp_helptext 'HeavyToys'
	SELECT definition FROM sys.sql_modules WHERE OBJECT_ID = OBJECT_ID('PriceIncrease')
	SELECT OBJECT_DEFINITION(OBJECT_ID('QtyOnHand')) AS [Definition]
	--2
	EXECUTE sp_depends 'HeavyToys'
	EXECUTE sp_depends 'PriceIncrease'
	EXECUTE sp_depends 'QtyOnHand'
	--3
	ALTER PROCEDURE PriceIncrease AS
		BEGIN 
			SELECT [Name], UnitPrice FROM Toys
		END
	GO
	EXECUTE PriceIncrease

	ALTER PROCEDURE QtyOnHand AS
		SELECT [Name], QtyOnHand FROM Toys
	GO
	EXECUTE QtyOnHand
	--4
	CREATE PROCEDURE SpecificPriceIncrease AS
		UPDATE Toys SET UnitPrice = UnitPrice + QtyOnHand
	GO
	EXECUTE SpecificPriceIncrease
	--5
	ALTER PROCEDURE SpecificPriceIncrease AS 
	SELECT COUNT(*) FROM Toys 
	EXEC SpecificPriceIncrease
	--6
	ALTER PROCEDURE SpecificPriceIncrease AS
	BEGIN
		EXEC HeavyToys;
	END
	GO
	EXECUTE SpecificPriceIncrease
	--7

	ALTER PROCEDURE SpecificPriceIncrease AS
	BEGIN
		EXEC HeavyToys '123';
		IF @@ERROR <> 0
			PRINT N'Có lỗi xảy ra trong khi thực hiện thủ tục lưu trữ'
	END
	GO
	EXECUTE SpecificPriceIncrease

	ALTER PROCEDURE QtyOnHand AS
	BEGIN
		BEGIN TRY
		EXEC HeavyToys '123'
		SELECT [Name], QtyOnHand FROM Toys;
		END TRY
		BEGIN CATCH
			PRINT N'Có lỗi xảy ra trong khi thực hiện thủ tục lưu trữ'
		END CATCH
	END
	GO
	EXECUTE QtyOnHand

	ALTER PROCEDURE PriceIncrease AS
		BEGIN 
			BEGIN TRY
			EXEC HeavyToys '123'
			SELECT [Name], UnitPrice FROM Toys;
			END TRY
			BEGIN CATCH
			PRINT N'Có lỗi xảy ra trong khi thực hiện thủ tục lưu trữ'
			END CATCH
		END
	GO
	EXECUTE PriceIncrease

	--8
	DROP PROCEDURE SpecificPriceInCrease
	DROP PROCEDURE HeavyToys
	DROP PROCEDURE PriceIncrease
	DROP PROCEDURE QtyOnHand


