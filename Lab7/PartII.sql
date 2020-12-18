USE Lab10
GO
CREATE DATABASE Aptech
Go
USE Aptech
GO
CREATE TABLE Classes(
	ClassName char(6),
	Teacher varchar(30),
	TimeSlot varchar(30),
	Class int,
	Lab int
)
CREATE UNIQUE CLUSTERED INDEX MyClusteredIndex ON Classes(ClassName)
WITH (Pad_index = ON, FILLFACTOR=70, Ignore_Dup_key = ON)
DROP INDEX MyClusteredIndex ON Classes
GO
CREATE NONCLUSTERED INDEX TeacherIndex ON Classes(Teacher)
DROP INDEX TeacherIndex ON Classes
CREATE INDEX ClassLabIndex ON Classes(Class,Lab)
EXEC sp_helpindex 'Classes'