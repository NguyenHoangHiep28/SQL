USE AdventureWorks2019
SELECT * FROM Person.Person
SELECT PersonType, FirstName, MiddleName, LastName FROM Person.Person
SELECT PersonType + '. ' + FirstName+ ' ' + LastName AS 'Person Name' FROM Person.Person

SELECT * FROM Person.Address
SELECT DISTINCT(City) FROM Person.Address

SELECT TOP 25 PERCENT * FROM Person.Address

SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory

SELECT COUNT(BusinessEntityID) AS TitleCount FROM HumanResources.Employee