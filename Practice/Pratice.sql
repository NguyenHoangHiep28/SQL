CREATE DATABASE SellingPoint
GO
USE SellingPoint
GO
CREATE TABLE Categories (
	CateID char(6) PRIMARY KEY,
	CateName nvarchar(100) NOT NULL,
	[Description] nvarchar(200)
)
GO
INSERT INTO Categories VALUES 
('CP01', 'RAM', 'A hardware device that allows information to be stored and retrieved on a computer.'),
('CP02', 'CPU', 'The electronic circuitry within a computer that executes instructions that make up a computer program.'),
('CP03', 'HDD', 'An electro-mechanical data storage device that stores and retrieves digital data using magnetic storage and one or more rigid rapidly rotating platters coated with magnetic material.')
GO
CREATE TABLE Parts(
	PartID int PRIMARY KEY IDENTITY,
	PartName nvarchar(100) NOT NULL,
	CateID char(6),
	[Description] nvarchar(1000),
	Price money NOT NULL DEFAULT(0),
	Quantity int DEFAULT(0),
	Warranty int DEFAULT(1),
	Photo nvarchar(200) DEFAULT('photo/nophoto.png'),
	CONSTRAINT FK_Cate_ID FOREIGN KEY (CateID) REFERENCES Categories(CateID)
)
GO
INSERT INTO Parts(PartName, CateID, [Description], Price, Quantity, Warranty, Photo)
VALUES 
('RAM desktop DDR4 Micron ECC', 'CP01', 'Designed and optimized for full compatibility on the latest AMD Ryzen 3000 processors, the Trident Z Neo delivers great memory performance and vivid RGB lighting.', 200, 50, 6, 'photo/ramphoto.png'),
('AMD Ryzen 3 2200G 3.5 GHz', 'CP02', 'AMD notes to users that the Ryzen APU 2000 series will be compatible with the current generation of 300 series chipset with the same socket AM4 but will need a BIOS update for proper identification.',400 ,100 , 3, 'photo/cpuphoto.png'),
('HDD Seagate BarraCuda', 'CP03', 'HDD Seagate BarraCuda 1TB 3.5 inch SATA III 64MB Cache 7200RPM ST1000DM010', 50, 75 , 12, 'photo/hddphoto.png')
GO
--4
	SELECT * FROM Parts WHERE Price > 100
--5
	SELECT p.CateID, PartName, p.[Description], Price, Quantity, Warranty, Photo  FROM Parts p JOIN  Categories AS c 
	ON p.CateID = c.CateID WHERE CateName LIKE 'CPU'
--6
	CREATE VIEW V_Parts AS
	SELECT PartID, PartName, CateName, Price, Quantity FROM Parts p
	JOIN Categories AS c ON p.CateID = c.CateID 
	GO
	SELECT * FROM V_Parts
--7
	CREATE VIEW V_TopParts AS
	SELECT PartID, PartName, CateName, Price, Quantity FROM Parts p
	JOIN Categories AS c ON p.CateID = c.CateID
	WHERE Price = (SELECT TOP 1 (price) FROM Parts ORDER BY price DESC)
	GO
	SELECT * FROM V_TopParts

