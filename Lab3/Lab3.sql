CREATE DATABASE BookLibrary
GO
USE BookLibrary 
GO
CREATE TABLE Book (
	BookCode int NOT NULL,
	BookTitle varchar(100) NOT NULL,
	Author varchar(50) NOT NULL,
	Edition int,
	BookPrice money,
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
	MemberCode int NOT NULL,
	Name varchar(50) NOT NULL,
	Address varchar(100) NOT NULL,
	PhoneNumber int
)
INSERT INTO Member VALUES 
(101, 'THOMAS JOHNSON', 'United Kingdom', 9181648),
(102, 'BOSTON CLAIR', 'EngLand',  9181688)
SELECT * FROM Member
DROP TABLE Member
GO
CREATE TABLE IssueDetails
(
	BookCode int,
	MemberCode int,
	IssueDate datetime,
	ReturnDate datetime,

)
DROP TABLE IssueDetails
INSERT INTO IssueDetails VALUES
(01, 101, '2020-08-20 20:00:00', '2020-08-25 19:00:00'),
(02, 102, '2020-09-27 21:40:00', '2020-09-30 15:00:00')
SELECT * FROM IssueDetails
GO
ALTER TABLE IssueDetails
	ADD CONSTRAINT BC FOREIGN KEY (BookCode) REFERENCES Book(BookCode) 
ALTER TABLE IssueDetails
	ADD CONSTRAINT MB FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode)
GO
ALTER TABLE IssueDetails 
	DROP CONSTRAINT BC, MB
GO   

ALTER TABLE Book 
	ADD CONSTRAINT BPK PRIMARY KEY (BookCode)
ALTER TABLE Member
	ADD CONSTRAINT MK PRIMARY KEY(MemberCode)
ALTER TABLE Member 
	DROP CONSTRAINT MK
ALTER TABLE Book
	DROP CONSTRAINT BPK
ALTER TABLE IssueDetails
	ADD CONSTRAINT PK_Key PRIMARY KEY (BookCode, MemberCode)
ALTER TABLE Book
	ADD CONSTRAINT CBookprice CHECK(BookPrice >0 AND BookPrice < 200)
ALTER TABLE Member 
	ADD CONSTRAINT UN UNIQUE (PhoneNumber)
ALTER TABLE IssueDetails
	ALTER COLUMN BookCode int NOT NULL 

ALTER TABLE IssueDetails 
	ALTER COLUMN MemberCode int NOT NULL
