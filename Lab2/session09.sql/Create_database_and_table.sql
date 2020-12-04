CREATE DATABASE SuperCool
GO
USE SuperCool 
GO
CREATE TABLE SuperCoolEmployeeDetails(
[EmployeeName] [varchar](50) NOT NULL,
[EmployeeID] [varchar](20) NOT NULL,
[Designation] [varchar](50) NOT NULL,
[JoiningDate] [datetimeoffset] (0) NOT NULL,
[ContactNo] [varchar](15) SPARSE NULL,
AllSparseColumns xml COLUMN_SET FOR ALL_SPARSE_COLUMNS
)
GO
INSERT INTO SuperCoolEmployeeDetails(EmployeeName, EmployeeID,
Designation, JoiningDate, ContactNo)
VALUES('GustavoAchang', 'E1001', 'President', '2008-10-10 00:00:00.0000000 +05:30', '0346353')
INSERT INTO SuperCoolEmployeeDetails(EmployeeName, EmployeeID,
Designation, JoiningDate, ContactNo)
VALUES('HelloKitty', 'E1002', 'President', '2008-10-11 00:00:00.0000000 +05:30', '0347899')
INSERT INTO SuperCoolEmployeeDetails(EmployeeName, EmployeeID,
Designation, JoiningDate, ContactNo)
VALUES('JohnCena', 'E1003', 'President', '2008-10-12 00:00:00.0000000 +05:30', '0578753')
INSERT INTO SuperCoolEmployeeDetails(EmployeeName, EmployeeID,
Designation, JoiningDate, ContactNo)
VALUES('JohnSmiths', 'E1004', 'President', '2008-10-13 00:00:00.0000000 +05:30', '0857453')
INSERT INTO SuperCoolEmployeeDetails(EmployeeName, EmployeeID,
Designation, JoiningDate, ContactNo)
VALUES('JohnWick', 'E1005', 'President', '2008-10-14 00:00:00.0000000 +05:30', '0826353')
INSERT INTO SuperCoolEmployeeDetails(EmployeeName, EmployeeID,
Designation, JoiningDate, ContactNo)
VALUES('LikinPark', 'E1006', 'President', '2008-10-15 00:00:00.0000000 +05:30', '0847353')
INSERT INTO SuperCoolEmployeeDetails(EmployeeName, EmployeeID,
Designation, JoiningDate, ContactNo)
VALUES('PlunoMark', 'E1007', 'President', '2008-10-16 00:00:00.0000000 +05:30', '0346847')
INSERT INTO SuperCoolEmployeeDetails(EmployeeName, EmployeeID,
Designation, JoiningDate, ContactNo)
VALUES('HarryPotter', 'E1008', 'President', '2008-10-17 00:00:00.0000000 +05:30', '0857291')
INSERT INTO SuperCoolEmployeeDetails(EmployeeName, EmployeeID,
Designation, JoiningDate, ContactNo)
VALUES('SpiderMan', 'E1009', 'President', '2008-10-18 00:00:00.0000000 +05:30', '0726451')

 GO
 SELECT * FROM SuperCoolEmployeeDetails