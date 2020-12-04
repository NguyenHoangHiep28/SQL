DECLARE @location1 datetimeoffset(0)
SET @location1 = '2009-11-9 23:50:55 -1:00'
DECLARE @location2 datetimeoffset(0)
SET @location2 = '2009-11-9 22:50:55 +5:00'
SELECT DATEDIFF(HH, @location1, @location2);