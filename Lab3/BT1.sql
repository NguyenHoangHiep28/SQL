CREATE DATABASE BookLibrary
GO
USE BookLibrary 
GO
CREATE TABLE Book (
	BookCode int PRIMARY KEY,
	BookTitle varchar(100) NOT NULL,
	Author varchar(50) NOT NULL,
	Edition int,
	BookPrice money CHECK ( 20<BookPrice), CHECK (BookPrice< 200),
	Copies int
)
GO
DROP TABLE Book
INSERT INTO Book VALUES 
(01, 'CONAN DETECTIVE','Aoyama Gosho', 5, 110, 100),
(02, 'DORAEMON','Fujiko F Fujio', 7, 50, 100)
SELECT * FROM Book
GO
CREATE TABLE Member
(
	MemberCode int PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Address varchar(100) NOT NULL,
	PhoneNumber int UNIQUE
)
INSERT INTO Member VALUES 
(101, 'THOMAS JOHNSON', 'United Kingdom', 9181648),
(102, 'BOSTON CLAIR', 'EngLand',  9181688)
SELECT * FROM Member
GO
CREATE TABLE IssueDetails
(
	BookCode int NOT NULL,
	MemberCode int NOT NULL,
	IssueDate datetime,
	ReturnDate datetime,
	CONSTRAINT BC FOREIGN KEY (BookCode) REFERENCES Book(BookCode),
	CONSTRAINT MB FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode)
)
DROP TABLE IssueDetails
INSERT INTO IssueDetails VALUES
(01, 101, '2020-08-20 20:00:00', '2020-08-25 19:00:00'),
(02, 102, '2020-09-27 21:40:00', '2020-09-30 15:00:00')
SELECT * FROM IssueDetails
GO
ALTER TABLE IssueDetails 
	DROP CONSTRAINT BC, MB
GO   
SELECT name  
FROM sys.key_constraints  
WHERE type = 'PK' AND OBJECT_NAME(parent_object_id) = 'Book';  
GO  
ALTER TABLE dbo.Book
DROP CONSTRAINT PK__Book__0A5FFCC6079E58AE;
GO
SELECT name  
FROM sys.key_constraints  
WHERE type = 'PK' AND OBJECT_NAME(parent_object_id) = 'Member';  
GO  
ALTER TABLE dbo.Member
DROP CONSTRAINT PK__Member__84CA6376F2B01DEC;
GO
ALTER TABLE IssueDetails
	ADD CONSTRAINT PK_Key PRIMARY KEY (BookCode, MemberCode)