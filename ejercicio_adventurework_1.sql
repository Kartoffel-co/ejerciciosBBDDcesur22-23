--1.- Saca un listado de las personas guardadas en la bbdd
USE adventurework
SELECT LastName+' '+FirstName FROM Person.Person 

--2.- Cuantas personas hay?
USE adventurework
SELECT COUNT(1) FROM Person.Person

--3.- Sacame el listado de las 30 primeras personas ordenadas por apellido.
USE adventurework
SELECT TOP(30) * FROM Person.Person ORDER BY LastName ASC

--4.- Muestrame nombre y apellido de todas las personas de la tabla.
USE adventurework
SELECT LastName+' '+FirstName FROM Person.Person 

--5.- Saca  el login de empleado de todos los empleados ordenados por fecha de nacimiento.
USE adventurework
SELECT LoginID FROM HumanResources.Employee ORDER by BirthDate ASC

--6.- Filtra los empleados sacando varias consultas separando por genero..
USE adventurework
SELECT * FROM HumanResources.Employee WHERE Gender='M'
SELECT * FROM HumanResources.Employee WHERE Gender='F'

--7.- ¿Cuantos hombres hay empleados? ¿Cuantas mujeres?
USE adventurework
SELECT COUNT(1) FROM HumanResources.Employee WHERE Gender='M'
SELECT COUNT(1) FROM HumanResources.Employee WHERE Gender='F' 

--8.- ¿Cuantos pedidos hay en la tabla SalesOrderHeader?
USE adventurework
SELECT COUNT(1) FROM Sales.SalesOrderHeader

-- 9.- ¿Cual es el pedido más caro, con el totalDue mas elevado?
USE adventurework
SELECT TOP(1) * FROM Sales.SalesOrderHeader ORDER BY TotalDue DESC 

--10.- ¿Cual es la media de TAXmt que se paga en los pedidos ?
USE adventurework
SELECT AVG(TaxAmt) FROM Sales.SalesOrderHeader

-- 11.- Dime la fecha del primer pedido enviado. Y del último.
USE adventurework
SELECT top(1) ShipDate FROM Sales.SalesOrderHeader ORDER BY ShipDate ASC
SELECT top(1) ShipDate FROM Sales.SalesOrderHeader ORDER BY ShipDate desc

--12.- Volviendo a los empleados, el campo login, aparece mucha morralla. Limpiala para que solo salga el login de usuario.
USE adventurework
SELECT REPLACE(LoginID,'adventure-works\','') FROM HumanResources.Employee

--13.- Sacame una tabla con una sola columna con el apellido y el nombre separado por una ,
USE adventurework
SELECT FirstName+','+LastName FROM Person.Person 

--14.-Calcula la diferncia entre el TotalDue y el Subtotal.
USE adventurework
SELECT TotalDue-SubTotal FROM Sales.SalesOrderHeader

--15.- ¿Sabrias decirme como se ha calculado el TotalDUE.?
USE adventurework
SELECT SubTotal+TaxAmt+Freight FROM Sales.SalesOrderHeader

-- 16.- ¿Sabrias comprobar si TODOS los pedidos tienen el TOTALDUE bien calculado según tus averiguaciones en el ejercicoo 15?
USE adventurework
SELECT COUNT(1) FROM Sales.SalesOrderHeader
SELECT COUNT(1) FROM Sales.SalesOrderHeader WHERE TotalDue = (SubTotal+TaxAmt+Freight)