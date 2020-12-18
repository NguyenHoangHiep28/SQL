USE Exam10Test
GO
CREATE TABLE Student(
	StudentNo int PRIMARY KEY,
	StudentName varchar(50),
	StudentAddress varchar(100),
	PhoneNo int
)

GO
CREATE TABLE Department (
	DeptNo int PRIMARY KEY,
	DeptName varchar(50),
	ManagerName char(30)
)
GO
CREATE TABLE Assignment(
	AssignmentNo int PRIMARY KEY,
	Description varchar(100)
)
GO
CREATE TABLE Works_Assign(
	JobID int PRIMARY KEY,
	StudentNo int,
	AssignmentNo int,
	TotalHours int,
	JobDetails XML
	CONSTRAINT FK_StdNo FOREIGN KEY (StudentNo) REFERENCES Student(StudentNo),
	CONSTRAINT Fk_AsmNo FOREIGN KEY (AssignmentNo) REFERENCES Assignment(AssignmentNo)
)
ALTER TABLE Works_Assign
DROP CONSTRAINT FK_StdNo
GO
SELECT NAME FROM sys.key_constraints WHERE OBJECT_NAME(parent_object_id) = 'Student' 
ALTER TABLE Student 
DROP CONSTRAINT  PK__Student__32C4C02AFF06361B
GO
CREATE CLUSTERED INDEX IX_Student ON Student(StudentNo)
GO
CREATE NONCLUSTERED INDEX IX_Dept ON Department(DeptNo, DeptName, ManagerName)