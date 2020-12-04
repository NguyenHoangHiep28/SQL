DECLARE @shapepoly geography
SET @shapepoly = geography::STGeomFromText('POLYGON((0 2, 10 3, 3 4, 0 2))', 4326);
SELECT @shapepoly