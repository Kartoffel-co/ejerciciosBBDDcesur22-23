--1.-Da de alta un cliente en el arepazo
USE arepezo
SELECT * FROM Clientes
BEGIN TRAN 
    INSERT into Clientes (nombre,email,telefono,direccion,cod_postal,ciudad,provincia)
    VALUES ('Pablo Vinolo','pablo.s322938@cesurformacion.com','666666666','calle falsa 123','41020','Sevilla','Sevilla')
    INSERT into Clientes (nombre,email,telefono,direccion,cod_postal,ciudad,provincia)
    VALUES ('Prueba','prueba@unoasir.com','666666666','calle falsa 123','41020','Sevilla','Sevilla')
ROLLBACK TRAN

--2.-Da de alta un nuevo plato en el arepa<o. Patatas bravas que cueste 3e.
SELECT * FROM Menu
BEGIN TRAN
    INSERT into Menu (nombre,descripcion,tipo,categoria,precioventa)
    VALUES ('Patatas brabas','angry potatoes','1','3','3.00')
ROLLBACK TRAN
--3.-Ese plato, lleva 0.2kg de patatas. Añade tb el ingrediente y la receta.
SELECT * FROM Ingredientes
BEGIN TRAN
    INSERT into Ingredientes (nombre,PrecioKg)
    VALUES ('Patatas','1.20')
ROLLBACK TRAN

SELECT * FROM Receta
BEGIN TRAN
    INSERT into Receta (idMenu,idIngredientes,CantidadEnKg)
    VALUES ('96','38','0.20')
ROLLBACK TRAN
--4.-Añade un pedido de 3 raciones de patatas bravas, 3 cervezas a ese nuevo cliente.
SELECT * FROM Pedidos
SELECT * FROM PedidosLinea
BEGIN TRAN

    INSERT into Pedidos (Fecha_pedido,Total,GastosEnvio,SubTotal,IdCliente,Telefono,Direccion,Cod_Postal,Ciudad)
    VALUES (GETDATE(),,'4.99',,(select id from Clientes WHERE Nombre = 'Pablo Vinolo'),(select Telefono from Clientes WHERE Nombre = 'Pablo Vinolo'),(select Direccion from Clientes WHERE Nombre = 'Pablo Vinolo'),(select Cod_Postal from Clientes WHERE Nombre = 'Pablo Vinolo'),(select Ciudad from Clientes WHERE Nombre = 'Pablo Vinolo'))
ROLLBACK TRAN

--5 añade y borra un cliente.

--6.- Borra todos los clientes que no tengan pedidos realizados.

--7.- Borra los ingredientes que no se usan en ninguna receta.


--8.- Cambia la dirección del cliente 2, la nueva dirección es Calle Falsa 44

--9.- Modifica la descripción de las patatas bravas añadidas en el ejercicio 2.

--10. Microsoft ha decidido cerrar hotmail. Ahora todos los correos de hotmail seran outlook. 
    --Actualiza la bbdd de clientes.

--11. Incrementa el precio de todos los elementos del menú un 5%.

--12 Los pedidos del 2022 tb deben verse afectados por ese incremento del 5%
            --Recalcula el subtotal, y el total de todos los pedidos del 2022.

--13.- Borra todos los elementos del menú que nadie ha pedido nunca.

--14.- Añade un pedido a fecha de hoy para el cliente 5. Añadele 5 unidades del menu 1. 
--Recalcula todos los precios con el mínimo número de instrucciones SQL y intentando no poner nada "a pelo"
-- que no sea estrictamente necesario.