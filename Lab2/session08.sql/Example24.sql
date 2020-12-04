DECLARE @x XML
SELECT @x = '<Product name="Computer"/>'
SELECT x.value('@name', 'VARCHAR(20)') AS Name,
x.value('fn:upper-case(@name)', 'VARCHAR(20)') AS InUpperCase,
x.value('fn:lower-case(@name)', 'VARCHAR(20)') AS InLowerCase
FROM @x.nodes('/Product') e(x)