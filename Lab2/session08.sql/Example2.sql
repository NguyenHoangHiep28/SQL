--Variable declaration of type int
DECLARE @age int = 40

--Variable declaration of type decimal
DECLARE @taxPercent decimal = 0.75
--Variable declaration of type money
DECLARE @amount money = 50000
DECLARE @bonus money = @amount*.10

--Variable declaration of type date
DECLARE @userDate date = '09-30-2009'
DECLARE @currentDate date = GETDATE()

SELECT @age, @taxPercent, @amount, @bonus, @userDate, @currentDate