CREATE TABLE NewEmployees(EmployeeID smallint, FirstName char(10), 
LastName char(10), Department varchar(50), HiredDate datetime, Salary money);

INSERT INTO NewEmployees
VALUES (11,'Kevin','Blaine','Research', '2006-07-31 00:00:00.000', 54000);

WITH EmployeeTemp(EmployeeID, FirstName, LastName, Department, HiredDate, Salary)
AS
(SELECT * FROM NewEmployees)
INSERT INTO Employee
SELECT * FROM EmployeeTemp