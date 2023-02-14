/* assignment --1 ( Q-1 ) */

SELECT ProductId, ProductName, UnitPrice
from Products
where Unitprice<20 AND Discontinued=0

/* assignment --1 ( Q-2 ) */

SELECT ProductId, ProductName,UnitPrice
from Products
where UnitPrice between 15 and 25

/* assignment --1 ( Q-3 ) */

SELECT ProductName,UnitPrice
from Products
Where UnitPrice>(SELECT AVG (UnitPrice) From Products)
Order by UnitPrice

/* assignment --1 ( Q-4 ) */

Select top 10 ProductName,UnitPrice
from Products
order by UnitPrice DESC

/* assignment --1 ( Q-5 ) */

SELECT Count(ProductName) AS Current_Discontinued_Products
FROM Products
GROUP BY Discontinued;

/* assignment --1 ( Q-6 ) */

SELECT ProductName, UnitsInStock, UnitsOnOrder
from Products
where UnitsInStock<UnitsOnOrder
