--CREA UN  PROCEDIMIENTO PARA CADA EJERCICIO QUE HAGA LO QUE SE PIDE.
--El fichero debe llamarse ApellidosNombre_Procedures.sql
------------------------------------------------------------------------------------------------

--1-Crear un procedimiento almacenado que nos devuelva el factorial de un número​
GO
CREATE or ALTER PROCEDURE factorial @num int
AS
    BEGIN
        DECLARE @resultado as int = @num
        DECLARE @bucle as int = 1

            WHILE @bucle < @num
            BEGIN
                SET @resultado = @resultado * @bucle
                SET @bucle = @bucle + 1
            END
            PRINT @resultado
    END
GO

EXEC factorial 10;
--2-Crear un procedimiento almacenado que nos indique si un numero es primo o no.​
GO
CREATE or ALTER PROCEDURE primo @numPrimo int
AS
    BEGIN
        DECLARE @count as int = 1
        DECLARE @num as int
        DECLARE @contar as int=0
        DECLARE @primo as int = @numPrimo


        WHILE @count <= @primo
            BEGIN
                set @num = @primo % @count
                -- print @num
                if @num = 0
                    BEGIN
                        set @contar = @contar + 1
                       -- PRINT @contar
                    END
                set @count = @count + 1

                -- PRINT @contar
                -- print @count
            END
        IF @contar = 2
            BEGIN
                PRINT 'es numero primo'
            END
        else
            BEGIN
                PRINT 'no es primo'
            END
    END
GO

EXEC primo 83;
--3-Crear un procedimiento almacenado que nos devuelva los n primeros numeros de la sucesión de fibonacci.​
GO
CREATE or ALTER PROCEDURE fibonacci @num int
AS
    BEGIN
        DECLARE @an as bigint = 0
        DECLARE @a1 as bigint = 1
        DECLARE @a2 as bigint = 1
        DECLARE @count as int = 1
        WHILE @count < 3
        BEGIN
            PRINT @a1
            --RINT 'a1'
            --print '-------'
            --PRINT @count
            --PRINT 'count'
            --print '-------'
            set @count = @count + 1
            if @count = 3
                BEGIN
                    set @an = @a1 + @a2
                    set @a2 = @an
                    print @an
                    --PRINT 'an'
                    --PRINT '-------'
                END
        END

            WHILE @count > 2 and @count <> @num
                BEGIN
                    set @an = @a1 + @a2
                    PRINT @an
                    set @a1 = @a2
                    set @a2 = @an
                    set @count = @count + 1
                END
    END
GO

EXEC fibonacci 10
--https://stackoverflow.com/questions/21746100/how-to-generate-fibonacci-series

--4-Con adventureWorks, dame la lista de empleados de un departamento indicando el id del departamento.​

--5-A la consulta anterior, añadir un parametro opcional que sea el sexo de los empleados​

--6 añade al procedimiento anterior un parametro de salida que nos devuelva el numero de empleados.


--Manipulando cadenas...

--6-Dime que clientes del arepazo, tienen un nombre de mas de 5 caracteres.​

--7-Recorta a 5 caracteres los nombres de los clientes del arepazo. Muestralo por pantalla, no lo guardes en ningun sitio.​

--8-De los email del arepazo, obten los caracteres del 3 al 7​

--9-Dime el total de caracteres de todos los nombres de los clientes del arepazo.​

--10-Haz un procedimiento, dado un cliente del arepazo( el id), me devuelva una cadena de texto con su nombre, el total gastado, y el numero de pedidos. Ejemplo:​

--'El cliente Bernat, ha gastado 100€ en un total de 4 pedidos.'​


----manipulando fechas----

--11.- haz un procedimiento que imprima por pantalla una fecha aleatoria
-- de la semana santa de este año.
-- Para obtener un número aleatorio, usa la función:

-- cast(RAND(CHECKSUM(NEWID())) * 10 as INT) siendo  10 el valor máximo -1
-- que nos va a devolver. Nos devolverá un número de 0 a 9. probad: 

declare @numeroAleatorio as int=  cast(RAND(CHECKSUM(NEWID())) * 10 as INT)
print @numeroAleatorio

--12 Serías capaz de hacer un procedure que dado un minuto aleatorio dentro de la
-- semana santa nos dijera con un print cuantas procesiones hay en la calle?
--imaginate que tienes esta bbdd y la tabla procesiones con toda la info.
--haz que el procedimiento te diga: 
-- 'El dia X a de abril a las xxh hay X procesiones en la calle'
use master
go
drop database if exists SemanaSantaSevilla
Go
create database SemanaSantaSevilla
GO
use SemanaSantaSevilla
go
create table Procesiones(
                id int identity(1,1) primary key,
    nombre varchar(100) not null,
    fechaSalida datetime not null,
    fechaEntrada datetime not null
) 
declare @viernesdolores as datetime='3/31/2023'
declare @viernessanto as datetime =DATEADD(DAY,7,@viernesdolores)
insert into Procesiones
select 'Macarena',@viernessanto,dateadd(hour,13,@viernessanto)


select * from Procesiones