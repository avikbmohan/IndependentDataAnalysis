--- Views are always up-to-date
CREATE VIEW [view_name] AS
SELECT ProductID, ProductName
FROM Products
WHERE Discontinued = No;


