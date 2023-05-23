
use nba
<<<<<<< HEAD

=======
>>>>>>> 5c48ee8c5287d6aeb04beabd6133fb3e24d877fd
--1 Con la bbdd de la NBA imprime por consola el numero de partidos que ha jugado Ricky Rubio. Guardalo en una variable y luego imprimelo con el print.
DECLARE @count as int

<<<<<<< HEAD

=======
set @count = (select count(ep.idjugador) from jugadores j
INNER JOIN EstadisticasPartidos ep on j.idjugador = ep.idjugador
WHERE nombre like 'Ricky Rubio')

print @count
>>>>>>> 5c48ee8c5287d6aeb04beabd6133fb3e24d877fd
--2 Recupera el numero de partidos de Ricky Rubio y el de Lebron James en dos variables. Imprime por consola el nombre del jugador que más partidos ha disputado.
DECLARE @partidosRecky as int
DECLARE @partidosJames as int

set @partidosRecky = (select count(ep.idjugador) from jugadores j
INNER JOIN EstadisticasPartidos ep on j.idjugador = ep.idjugador
WHERE nombre like 'Ricky Rubio')

set @partidosJames = (select count(ep.idjugador) from jugadores j
INNER JOIN EstadisticasPartidos ep on j.idjugador = ep.idjugador
WHERE nombre like 'Lebron James')

IF @partidosRecky > @partidosJames
    BEGIN
        PRINT 'Ricky Rubio'
    END
ELSE
    BEGIN
        PRINT 'Lebrom James'
    END

--3 Recupera en una variable la fecha del ultimo partido de la nba que tenemos en la bbdd. Muestra esa fecha por consola.
DECLARE @fecha as date

set @fecha = (SELECT top(1) fecha FROM Partidos
ORDER BY fecha Desc)

PRINT @fecha

--4 Recupera el nombre, la altura y el peso de de Pau Gasol. Imprime un mensaje que ponga "Pau Gasol mide XX y pesa XX. Su indice de masa corporal es: " ( busca como calcular el IMC en google.)
-- Para poder convertir un decimal o un entero a varchar, podemos usar CAST(@altura as varchar(100)) o directamente declarar la variable altura como un varchar(100).
DECLARE @nombre as VARCHAR(50)
DECLARE @altura as decimal = 0.0
DECLARE @alturaM as decimal = 0.0
DECLARE @peso as DECIMAL = 0.0
DECLARE @IMC as DECIMAL = 0.0

set @nombre = (SELECT nombre FROM jugadores WHERE nombre = 'Pau Gasol')
set @altura = (SELECT altura from jugadores WHERE nombre = 'Pau Gasol')
set @alturaM = (@altura+0.0)/100
set @peso = (SELECT peso FROM jugadores WHERE nombre = 'Pau Gasol')
set @IMC = @peso/POWER(@alturaM,2)

print @nombre+' mide '+CAST(@altura as varchar(100))+'cm y pesa '+CAST(@peso as varchar(100))+'Kg. Su indice de mas corporal es:'+CAST(@IMC as varchar(100))


use arepezovinolo

--arepazo
--5 Añade 1000 veces un clientes los mismos datos de contacto.
DECLARE @count as int = 1

WHILE @COUNT <> 1000
    BEGIN
        INSERT into Clientes (nombre,email,telefono,direccion,cod_postal,ciudad,provincia)
        VALUES ('Pablo Vinolo','pablo.unoasir.com','666666666','calle falsa 123','1111','Sevilla','Sevilla')
        set @count = @count + 1
    END
--6 Borra esos clientes duplicados, porfavor.
DELETE from Clientes
WHERE Email = 'pablo.unoasir.com'
--7 Recupera el cod postal, el telefono , el email y el nombre del cliente que más dinero se ha gastado en 4 variables distintas.
--muestra en la consola los valores de las 4 variables
DECLARE @ClienteMasGasta as int
DECLARE @cod_postal as INT
DECLARE @email as VARCHAR(50)
DECLARE @nombre as VARCHAR(200)
DECLARE @telefono as VARCHAR(200)

set @ClienteMasGasta = (SELECT top(1) IdCliente as Total FROM Pedidos GROUP BY IdCliente ORDER BY SUM(Total) Desc)

set @cod_postal = (SELECT Cod_Postal FROM Clientes WHERE id = @ClienteMasGasta)
set @telefono = (SELECT Telefono FROM Clientes WHERE id = @ClienteMasGasta)
set @email = (SELECT email FROM Clientes WHERE id = @ClienteMasGasta)
set @nombre = (SELECT Nombre FROM Clientes WHERE id = @ClienteMasGasta)
PRINT @cod_postal
PRINT @telefono
PRINT @email
PRINT @nombre


--8 Recupera el valor de total del ultimo pedido de el cliente id =1. Si el total es impar, cambia los gastos de envio de ese pedido a 0. 
--Si el total es par, duplica los gastos de envio. Recalcula luego el total de ese pedido.
DECLARE @total as decimal(18,2)
DECLARE @total_entero as int
DECLARE @resto as int
DECLARE @idPedido as int

set @idPedido =  (SELECT top(1) Id FROM Pedidos WHERE IdCliente = 1 ORDER BY Fecha_pedido DESC)
set @total =  (SELECT top(1) Total FROM Pedidos WHERE IdCliente = 1 ORDER BY Fecha_pedido DESC)
set @total_entero = ROUND(@total,0)
set @resto = @total_entero % 2

if @resto = 1
    BEGIN
        UPDATE Pedidos
        set GastosEnvio = 0
        WHERE Id = @idPedido
    END
ELSE
    BEGIN
        UPDATE Pedidos
        set GastosEnvio = GastosEnvio * 2
        WHERE Id = @idPedido
    END

UPDATE Pedidos
set Total = GastosEnvio+SubTotal
WHERE Id = @idPedido

--9 Sacad el numero total de elementos del menu que son bebidas del arepazo 
--por consola
DECLARE @count as int

set @count = (SELECT COUNT(1) FROM Menu m INNER JOIN TipoAlimento ta on ta.Id = m.Tipo WHERE ta.Descripcion = 'bebidas')
print @count 
--10 Calcular el cliente que mas ha gastado en 2020 en el arepazo, y mandarle a su casa un pedido de 5 arepas arepazo
--a coste 0.

--11 Crear un script que te indique si el menu es rentable o no dependiendo de si hay elementos en el menu no rentables.
--debe devolver 'ES RENTABLE' o '¡ESTAMOS PERDIENDO PASTA!' por la consola.