--Creating a Point geometry
DECLARE @spoint geometry;
SET @spoint = geometry::Parse('POINT(2 5)');
SELECT @spoint

--Creating a MultiPoint geometry
DECLARE @mpoint geometry
SET @mpoint = geometry::Parse('MULTIPOINT((6 8), (5 7))');
SELECT @mpoint

--Creating a LineString geometry
DECLARE @line geometry;
SET @line = geometry::Parse('LINESTRING(1 1, 4 5, 10, 13, 19 25)');
SELECT @line

--Creating a MultiLineString geometry
DECLARE @multiline geometry;
SET @multiline = geometry::Parse('MULTILINESTRING((0 2, 1 1), (1 2, 2 1, 2 2))');
SELECT @multiline

--Creating a Polygon geometry
DECLARE @poly geometry
SET @poly = geometry::Parse('POLYGON((0 2, 10 3, 3 4, 0 2))');
SELECT @poly
--Creating a MultiPolygon geometry
DECLARE @multipoly geometry
SET @multipoly = geometry::Parse('MultiPolygon(((0 0, 0 2, 2 3, 3 0, 0 0), (1 1, 1 2, 2 1, 1 1)))');
SELECT @multipoly
--Creating a GeometryCollection geometry
DECLARE @geomocollection geometry;
SET @geomocollection = geometry::Parse('GEOMETRYCOLLECTION(POINT(4 4), 
LINESTRING(3 3, 8 3), POLYGON((0 2, 13 3, 4 5, 0 2)))');
SELECT @geomocollection