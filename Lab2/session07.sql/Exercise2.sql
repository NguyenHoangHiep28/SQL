
USE EXAMPLE3
GO
CREATE TABLE Student
(
	StudNo int Primary Key,
	StudName nvarchar(50) NOT NULL,
	StudAddr nvarchar(50),
	StudPhone bigint,
	BirthDate DateTime
);
GO
INSERT INTO Student VALUES(1, 'Michael John', 'New York', 9145247891, '12-01-1989');
INSERT INTO Student VALUES(2, 'Anna Lombard', 'Alabama', 8942574632, '08-25-1989');
INSERT INTO Student VALUES(3, 'Peter Dawson', 'California', 9165688471, '02-15-1963');
INSERT INTO Student VALUES(4, 'Leonard Thornton', 'New Jersey', 9142563422, '12-20-1991');
INSERT INTO Student VALUES(5, 'Elizabeth Isaac', 'Atlanta', 9149855771, '07-11-1990');
GO
SELECT * FROM Student
ALTER TABLE Student ADD Country nvarchar (20) NULL
UPDATE Student SET Country = 'USA'
SELECT * FROM Student
GO

