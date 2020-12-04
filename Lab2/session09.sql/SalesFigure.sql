CREATE TABLE SuperCoolSalesFigure
(CityId int PRIMARY KEY IDENTITY (1,1),
CityName nvarchar(25), Amount money, CityGeo geometry);
GO
INSERT INTO SuperCoolSalesFigure (CityName, Amount, CityGeo)
VALUES
('Adelaide', 45000.00, geometry::STGeomFromText('POLYGON ((0 0, 1 0, 11, 0 1, 0 0))', 0)),
('Brisbane', 50000.00, geometry::STGeomFromText('POLYGON ((3 3, 3 4, 44, 4 2, 3 3))', 0)),
('Canberra', 35000.00, geometry::STGeomFromText('POLYGON ((5 3, 6 3, 54, 5 3))', 0)),
('Darwin', 40000.00, geometry::STGeomFromText('POLYGON ((5 0, 6 0, 6 1,5 0))', 0)),
('Hobart', 25000.00, geometry::STGeomFromText('POLYGON ((4 1, 5 1, 5 2,4 2, 4 1))', 0)),
('Melbourne', 20000.00, geometry::STGeomFromText('POLYGON ((0 2, 1 2, 03, 0 2))', 0)),
('Perth', 55000.00, geometry::STGeomFromText('POLYGON ((2 1, 3 1, 3 2,2 2, 2 1))', 0)),
('Sydney', 60000.00, geometry::STGeomFromText('POLYGON ((1 3, 2 3, 2 4,1 4, 1 3))', 0));
SELECT * FROM SuperCoolSalesFigure