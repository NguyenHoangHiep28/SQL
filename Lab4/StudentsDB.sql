CREATE DATABASE STUDENT
GO
USE STUDENT
GO
CREATE TABLE Students(
	StudentCode int NOT NULL PRIMARY KEY,
	Name varchar(50),
	Score int,
	PhoneNumber bigint UNIQUE,
	CONSTRAINT Sc_Check CHECK (Score > 0 AND Score <= 100)
)
INSERT INTO Students VALUES
(01,'Jame Smiths',90,7164829),
(02, 'Harry Kraver',80,9585739),
(03, 'Michael Jason',85,7481748),
(04, 'Tom Cruise',72,9471637),
(05, 'John Cena',95,4749274);
GO
CREATE TABLE Class (
	ClassCode int,
	ClassName varchar(50),
	Starttime datetime
)
GO
INSERT INTO Class VALUES
(101,'T2009M','2020-12-7 19:22:00'),
(102,'T2009A','2020-12-6 20:20:00'),
(103,'T2009E','2020-12-5 10:00:00'),
(104,'T2008M','2020-12-4 12:00:00'),
(105,'T2008E','2020-12-3 07:00:00');
CREATE TABLE StudentsClasses(
	StudentCode int,
	StudentClassCode int,
)
INSERT INTO StudentsClasses VALUES
(01,102),
(02,101),
(03,105),
(04,103),
(05,102);
SELECT * FROM Students
SELECT * FROM Class
SELECT * FROM StudentsClasses
DROP TABLE StudentsClasses;
DROP TABLE Class
DROP TABLE Students
ALTER TABLE Class
	ALTER COLUMN ClassCode int NOT NULL
GO
ALTER TABLE Class
	ADD CONSTRAINT PK_CLASS_K PRIMARY KEY (ClassCode)
ALTER TABLE StudentsClasses
	ADD	CONSTRAINT FK_Name FOREIGN KEY (StudentCode) REFERENCES Students(StudentCode)
ALTER TABLE StudentsClasses
	ADD CONSTRAINT FK_ClassCode FOREIGN KEY (StudentClassCode) REFERENCES Class(ClassCode)
ALTER TABLE StudentsClasses
	DROP CONSTRAINT FK_Name
ALTER TABLE StudentsClasses
	DROP CONSTRAINT FK_ClassCode
UPDATE Students 
	SET Name = 'Spider Man', Score = 70
	WHERE StudentCode = 1
UPDATE Class 
	SET Starttime = '2020-12-08 15:00:00'
	WHERE ClassCode = 101
UPDATE StudentsClasses
	SET StudentCode = 03
	WHERE StudentClassCode = 101
DELETE FROM Students WHERE StudentCode = 2
DELETE FROM Class WHERE ClassCode = 104
DELETE FROM StudentsClasses WHERE StudentCode = 3
