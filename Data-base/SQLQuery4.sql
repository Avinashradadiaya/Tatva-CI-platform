Skip to content
Search or jump to…
Pull requests
Issues
Codespaces
Marketplace
Explore
 
@Avinashradadiaya 
Avinashradadiaya
/
Tatva-CI-platform
Public
Cannot fork because you own this repository and are not a member of any organizations.
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
Settings
Tatva-CI-platform/Data-base/SQLQuery4.sql
@Avinashradadiaya
Avinashradadiaya new commit
Latest commit 620ec11 5 minutes ago
 History
 1 contributor
176 lines (142 sloc)  4.02 KB

/* Assignment --4 ( Q-1 )*/
CREATE PROCEDURE que1
AS
	SELECT CustomerID, AVG(Freight) as AvgFreight
	FROM Orders
	GROUP BY CustomerID
GO

insert into orders values ( 'VAFFE', 8,'1997-08-25 00:00:00.000', '1997-08-01 00:00:00.000','1997-01-01 00:00:00.000', 1,80, 'Wolski Zajazd', 'ul. Filtrowa 68',
'Warszawa', 'Tachira', 24100, 'brazil')

exec que1
UPDATE Orders SET Freight=60 WHERE OrderID = 10248
SELECT * FROM Orders WHERE OrderID = 10248

CREATE  TRIGGER tr_que1_update
ON orders
INSTEAD OF UPDATE
AS
BEGIN 
	Declare @OrderID int
	Declare @CustomerID varchar(50)
	Declare @Freight money
	Declare @AvgFreight money

	Declare @t_ave TABLE(CustomerID nchar(5), AvgFreight money)
	INSERT @t_ave
	exec que1
	
	Select * Into #Temptable FROM Inserted

	While(Exists(Select OrderID from #TempTable))
      Begin
		Select TOP 1 @OrderID = OrderID, @CustomerID = CustomerID, @Freight=Freight
		FROM #Temptable
		SET @AvgFreight = (SELECT AvgFreight FROM @t_ave WHERE CustomerID = @CustomerID)

			IF @Freight > @AvgFreight 
			BEGIN	
				RAISERROR ('ABOVE AVERAGE',16,1)
			END
			ELSE 
			BEGIN
				UPDATE Orders SET Freight = @Freight WHERE OrderID=@OrderID 
			END

		Delete from #TempTable where OrderID = @OrderID
		
      End
END

CREATE TRIGGER tr_que1_insert
ON orders
INSTEAD OF INSERT
AS
BEGIN 
	Declare @OrderID int
	Declare @CustomerID varchar(50)
	Declare @Freight money
	Declare @AvgFreight money
	Declare @t_ave TABLE(CustomerID nchar(5), AvgFreight money)
	INSERT @t_ave
	exec que1
	
	Select * Into #Temptable FROM Inserted

	While(Exists(Select OrderID from #TempTable))
      Begin
		Select TOP 1 @OrderID = OrderID, @CustomerID = CustomerID, @Freight=Freight
		FROM #Temptable
		SET @AvgFreight = (SELECT AvgFreight FROM @t_ave WHERE CustomerID = @CustomerID)

		IF @Freight > @AvgFreight 
		BEGIN	
			RAISERROR ('ABOVE AVERAGE',16,1)
		END
		ELSE 
		BEGIN
			INSERT INTO Orders (CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
			SELECT CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry
			From Inserted
		END

		Delete from #TempTable where OrderID = @OrderID
		
      End
END



/* Assignment --4 ( Q-2 )*/

CREATE PROC spEmployeeSalesbByCounttry
@country NVARCHAR(10)
AS
BEGIN
SELECT FirstName, LastName,COUNT(o.OrderID)
AS [totle sales] , @country AS Country
FROM [Order Details] r 
JOIN Orders o ON o.OrderID = r.OrderID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
group by FirstName, LastName, o.ShipCountry
having o.ShipCountry = @country
END

spEmployeeSalesbByCounttry 'UK'

/* Assignment --4 ( Q-3 )*/

CREATE PROC spSalesbByyear
@year int
AS
BEGIN
SELECT  COUNT(o.OrderID)
AS [totle sales] , @year as [Year]
FROM [Order Details] r 
JOIN Orders o ON o.OrderID = r.OrderID
group by YEAR(o.ShippedDate)
having  YEAR(ShippedDate) = @year
END
spSalesbByyear 1998

/* Assignment --4 ( Q-4 )*/

CREATE PROC spSalesbByCategory
@CategroyName Nvarchar(15)
AS
BEGIN
SELECT  count(r.OrderID)
AS [totle sales]  , @CategroyName AS CategoryName
FROM [Order Details] r 
JOIN Products ON Products.ProductID = r.ProductID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
where Categories.CategoryName = @CategroyName
group by Categories.CategoryName
END

spSalesbByCategory 'seafood'

/* Assignment --4 ( Q-5 )*/

CREATE PROC sp10mostExpensiveproducts
as
begin
select top 10 ProductName , UnitPrice from Products order by UnitPrice desc
end
sp10mostExpensiveproducts

/* Assignment --4 ( Q-6 )*/

CREATE PROC spCustomerOrderDetails
@OrderID int,
@ProductID int,
@UnitPaice money,
@Quantity smallint,
@Discount real
as
begin
insert into [Order Details] values (@OrderID , @ProductID , @UnitPaice , @Quantity , @Discount)
end

spCustomerOrderDetails 10248,14,522,5,0.2

SELECT * FROM [Order Details]

/* Assignment --4 ( Q-7 )*/

CREATE PROC spUpdateCustomerOrderDetails
@orderid int,
@productid int ,
@unitprice money,
@quantity smallint ,
@discount real  

as
update [Order Details] 
     set  [Quantity] = @quantity , [UnitPrice] = @unitprice, [Discount] = @discount 
     WHERE ( [OrderID] = @orderid AND [ProductID] = @productid )
go


spUpdateCustomerOrderDetails 10248 , 72 , 35.25 , 2 , 0.13

SELECT * FROM [Order Details]

