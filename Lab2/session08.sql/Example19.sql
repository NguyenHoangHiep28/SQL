DECLARE @shapepoly geometry
SET @shapepoly = geometry::STGeomFromText('POLYGON((0 2, 10 3, 3 4, 0 2))', 4326);
SELECT @shapepoly
