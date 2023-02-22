-- EJERCICIOS CON ADVENTUREWORKS
use adventurework
--0.-Ventas por mes
select sum(totaldue) as totalventas,month(orderdate) as mes 
from sales.SalesOrderHeader 
where year(OrderDate )=2011
group by month(orderdate)
order by mes
-- --0.1-Clientes de california

-- select FirstName,LastName,s.Name from sales.Customer c
-- inner join person.person p on p.BusinessEntityID = c.PersonID
-- inner join person.BusinessEntityAddress ba on ba.BusinessEntityID=p.BusinessEntityID
-- inner join person.Address a on a.AddressID =ba.AddressID
-- inner join person.StateProvince s on s.StateProvinceID=a.StateProvinceID
-- where s.Name='California'


--1.-Nombre empleados
-- SELECT FirstName+' '+MiddleName+' '+LastName FROM Person.Person

--2.-Clientes que sean empleados
-- SELECT SalesPersonID FROM Sales.SalesOrderHeader WHERE SalesPersonID = CustomerID

--3.-Empleados de california
-- SELECT FirstName,LastName,Name FROM Person.Person p
-- INNER JOIN HumanResources.Employee hre on hre.BusinessEntityID = p.BusinessEntityID
-- INNER JOIN Person.BusinessEntityAddress pba on pba.BusinessEntityID = p.BusinessEntityID
-- INNER JOIN Person.Address pa on pa.AddressID = pba.AddressID
-- INNER JOIN Person.StateProvince ps on ps.StateProvinceID = pa.StateProvinceID
-- WHERE Name like 'california'
--4.-Pedido más caro
-- SELECT TOP(1) SalesOrderID,SubTotal from Sales.SalesOrderHeader ORDER BY SubTotal DESC

--5.-Clientes que el nombre empiece por c
-- SELECT FirstName FROM Sales.Customer c
-- INNER JOIN Person.Person p on p.BusinessEntityID = c.PersonID
-- WHERE FirstName LIKE 'c%'

--6.-Total ventas 2011
select sum(totaldue) as totalventas
from sales.SalesOrderHeader 
where year(OrderDate )=2011
--7.-Total importe ventas 2011
select sum(SubTotal) as totalventas
from sales.SalesOrderHeader 
where year(OrderDate )=2011

--8.-Importe de todas las ventas de cada año
select sum(totaldue) as totalventas,month(orderdate) as mes 
from sales.SalesOrderHeader 
group by year(OrderDate )
order by mes

--9.- Nombre y apellidos del cliente que mas pedidos ha realizado.


--10.- ranking de los 10 clientes  (Nombre y Apellido con los pedidos mas caros


--11.- Media de los pedidos de los clientes de California


--12.- Producto más caro comprado.


--13.- Producto comprado más veces.


--14.- Cliente que más productos distintos ha comprado


--15.- Ranking de los 20 productos más veces vendidos.