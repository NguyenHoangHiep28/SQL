USE LAB09
GO
CREATE TABLE Class(
	ClassCode varchar(10) PRIMARY KEY,
	HeadTeacher varchar(30),
	Room varchar(30),
	TimeSlot char,
	CloseDate datetime
)
GO
INSERT INTO Class VALUES 
('T2009E','Dang Kim Thi', 'Class 1', 'G', '2020-10-20'),
('T2009M','Dang Kim Thi', 'Class 2', 'I', '2020-11-22'),
('T2009A','Dang Kim Thi', 'Class 3', 'L', '2020-07-06'),
('T2008E','Dang Kim Thi', 'Class 4', 'M', '2019-05-11'),
('T2007A','Dang Kim Thi', 'Class 5', 'L', '2018-12-10')
GO
CREATE TABLE Student(
	RollNo varchar(10) PRIMARY KEY,
	ClassCode varchar(10),
	FullName varchar(30),
	Male bit,
	BirthDate datetime,
	[Address] varchar(30),
	Province Char(2),
	Email varchar(30),
	CONSTRAINT FK_Class_Code FOREIGN KEY (ClassCode) REFERENCES Class(ClassCode)
)
INSERT INTO Student VALUES 
('A00211', 'T2009E', 'Nguyen Van Nam', 1, '1998-10-12', 'Cau Giay', 'HN', 'nguyenvannam@gmail.com'),
('A00212', 'T2009A', 'Hoang Thi Hong', 0, '1997-12-03', 'Thanh Xuan', 'HN', 'hoangthihong@gmail.com'),
('A00213', 'T2009M', 'Luong Xuan Truong', 1, '1996-09-02', 'Ha Dong', 'HN', 'luongxuantruong@gmail.com'),
('A00121', 'T2008E', 'Tran Thanh Van', 0, '1996-03-12', 'Chi Lang', 'LS', 'tranthanhvan@gmail.com'),
('A00071', 'T2007A', 'Vi Van Trong', 1, '1995-11-12', 'Tu Son', 'BN', 'vivantrong@gmail.com')
GO
CREATE TABLE [Subject] (
	SubjectCode varchar(10) PRIMARY KEY,
	SubjectName varchar(40),
	WMark bit,
	PMark bit,
	WTest_per int,
	PTest_per int
)
INSERT INTO [Subject] VALUES 
('LBEP', 'Logic Building and Elementary Progrm', 1, 1, 100, 15),
('BNGW', 'Building Next Generation Websites', 1, 1, 100, 15),
('DDD', 'Database Design & Development', 1, 1, 100, 15),
('DM', 'Database Management (SQL Server)', 1, 1, 100, 15),
('BSJ', 'BootStrap and jQuery', 1, 0, 100, NULL)
GO
CREATE TABLE Mark(
	RollNo varchar(10),
	SubjectCode varchar(10),
	WMark float,
	PMark float,
	Mark float,
	CONSTRAINT PK_Mark PRIMARY KEY (RollNo, SubjectCode),
	CONSTRAINT FK_Roll_NO FOREIGN KEY (RollNo) REFERENCES Student(RollNo),
	CONSTRAINT FK_Subject_Code FOREIGN KEY (SubjectCode) REFERENCES [Subject](SubjectCode)
)
GO
INSERT INTO Mark VALUES 
('A00211', 'LBEP', 72.5, 7.5, 40),
('A00212', 'BNGW', 80, 14.2,47.1),
('A00211', 'DM', 65.8, 8.7, 37.3),
('A00121', 'BSJ', NULL, 12.5, 25.5),
('A00071', 'DDD', 23.7, 3.4, 13.6)
DROP TABLE Mark 
GO
DROP TABLE Student
GO
DROP TABLE [Subject]
GO
DROP TABLE Class
--2
CREATE VIEW V_Student_Test AS 
SELECT m.RollNo, FullName, ClassCode, COUNT(SubjectCode) AS Test FROM Student s
INNER JOIN Mark AS m ON s.RollNo = m.RollNo
GROUP BY m.RollNo, FullName, ClassCode
HAVING (COUNT(SubjectCode) >= 2)
GO
SELECT * FROM V_Student_Test
--3
CREATE VIEW V_Student_Test_Failed AS
SELECT m.RollNo, FullName, ClassCode, WMark, PMark AS Test FROM Student s
INNER JOIN Mark AS m ON s.RollNo = m.RollNo
GROUP BY m.RollNo, FullName, ClassCode, WMark, PMark
HAVING (WMark < 40 OR PMark < 6)
GO
SELECT * FROM V_Student_Test_Failed

--4
CREATE VIEW V_Student_TimeSlot AS
SELECT s.RollNo, FullName, s.ClassCode, TimeSlot FROM Student s
INNER JOIN Class AS c ON s.ClassCode = c.ClassCode 
WHERE TimeSlot LIKE 'G'
GO
SELECT * FROM V_Student_TimeSlot

--5
CREATE VIEW V_Teacher AS
SELECT HeadTeacher,s.RollNo ,FullName, WMark, PMark FROM (( Class c
INNER JOIN Student AS s ON c.ClassCode = s.ClassCode)
INNER JOIN Mark AS m ON s.RollNo = m.RollNo )
WHERE (WMark < 40 OR PMark < 6)
GROUP BY HeadTeacher, FullName, WMark, PMark, s.RollNo
HAVING COUNT(*) >3
GO
SELECT * FROM V_Teacher

--6
CREATE VIEW V_Student_Failed_LBEP_Test AS
SELECT FullName, s.ClassCode, HeadTeacher, m.WMark, m.PMark, m.SubjectCode,SubjectName FROM((( Student s
INNER JOIN Class AS c ON s.ClassCode = c.ClassCode)
INNER JOIN Mark as m ON s.RollNo = m.RollNo)
INNER JOIN [Subject] as sb ON sb.SubjectCode = m.SubjectCode)
WHERE m.SubjectCode LIKE 'LBEP' AND (m.WMark < 40 OR m.PMark < 6)
GO
SELECT * FROM V_Student_Failed_LBEP_Test
