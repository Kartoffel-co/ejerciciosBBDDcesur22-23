--1.-Da de alta un cliente en el arepazo
USE arepezo
SELECT * FROM Clientes
BEGIN TRAN 
    INSERT into Clientes (nombre,email,telefono,direccion,cod_postal,ciudad,provincia)
    VALUES ('Pablo Vinolo','pablo.unoasir.com','666666666','calle falsa 123','1111','Sevilla','Sevilla')
    INSERT into Clientes (nombre,email,telefono,direccion,cod_postal,ciudad,provincia)
    VALUES ('Prueba','prueba@unoasir.com','666666666','calle falsa 123','1111','Sevilla','Sevilla')
ROLLBACK TRAN

--2.-Da de alta un nuevo plato en el arepa<o. Patatas bravas que cueste 3e.
SELECT * FROM Menu
BEGIN TRAN
    INSERT into Menu (nombre,descripcion,tipo,categoria,precioventa)
    VALUES ('Patatas bravas','angry potatoes','1','3','3.00')
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
    VALUES ((select id from menu WHERE Nombre = 'Patatas bravas'),(select id from Ingredientes WHERE Nombre = 'Patatas'),'0.20')
ROLLBACK TRAN
--4.-Añade un pedido de 3 raciones de patatas bravas, 3 cervezas a ese nuevo cliente.
SELECT * FROM Pedidos
SELECT * FROM PedidosLinea
BEGIN TRAN
    INSERT into PedidosLinea (IdPedido,IdMenu,Cantidad,PrecioVentaUnitario,IVA)
    VALUES (44
            (select top(1) id from Pedidos ORDER by Fecha_pedido desc),
            (select id from Menu WHERE Nombre = 'Patatas bravas'),
            '3',
            (select PrecioVenta from Menu WHERE Nombre = 'Patatas bravas'),
            (SELECT IVA FROM TipoAlimento WHERE id = (select tipo from Menu WHERE Nombre = 'Patatas bravas'))
            )
    INSERT into PedidosLinea (IdPedido,IdMenu,Cantidad,PrecioVentaUnitario,IVA)
    VALUES (
            (select top(1) id from Pedidos ORDER by Fecha_pedido desc),
            (select top(1) id from Menu WHERE Nombre = 'caña'),
            '3',
            (select top(1) PrecioVenta from Menu WHERE Nombre = 'caña'),
            (SELECT IVA FROM TipoAlimento WHERE id = (select top(1) tipo from Menu WHERE Nombre = 'caña'))
            )
ROLLBACK TRAN
BEGIN TRAN
    INSERT into Pedidos (Fecha_pedido,Total,GastosEnvio,SubTotal,IdCliente,Telefono,Direccion,Cod_Postal,Ciudad)
    VALUES (
            GETDATE(),
            ((select top(1) PrecioVenta*3+(select top(1) PrecioVenta*3 from Menu WHERE Nombre = 'Patatas bravas')+4.99 from Menu WHERE Nombre = 'caña')),
            '4.99',
            ((select top(1) PrecioVenta*3+(select top(1) PrecioVenta*3 from Menu WHERE Nombre = 'Patatas bravas') from Menu WHERE Nombre = 'caña')),
            (select id from Clientes WHERE Nombre = 'Pablo Vinolo'),
            (select Telefono from Clientes WHERE Nombre = 'Pablo Vinolo'),
            (select Direccion from Clientes WHERE Nombre = 'Pablo Vinolo'),
            (select Cod_Postal from Clientes WHERE Nombre = 'Pablo Vinolo'),
            (select Ciudad from Clientes WHERE Nombre = 'Pablo Vinolo')
            )
ROLLBACK TRAN




--5 añade y borra un cliente.
SELECT * FROM Clientes
BEGIN TRAN
    INSERT into Clientes (nombre,email,telefono,direccion,cod_postal,ciudad,provincia)
    VALUES ('Prueba2','prueba2@unoasir.com','666666666','calle falsa 123','1111','Sevilla','Sevilla')
ROLLBACK TRAN
BEGIN TRAN
    DELETE from Clientes
    WHERE Id = (select id from Clientes WHERE Email = 'prueba2@unoasir.com')
ROLLBACK TRAN

--6.- Borra todos los clientes que no tengan pedidos realizados.
BEGIN TRAN
    DELETE from Clientes
    WHERE id in (
                SELECT c.Id FROM Clientes c
                left JOIN Pedidos p on p.IdCliente = c.Id
                WHERE IdCliente is NULL
                )
ROLLBACK TRAN
SELECT c.Id FROM Clientes c
left JOIN Pedidos p on p.IdCliente = c.Id
WHERE IdCliente is NULL   
--7.- Borra los ingredientes que no se usan en ninguna receta.
BEGIN TRAN
DELETE from Ingredientes WHERE Id in
(SELECT i.Id FROM Ingredientes i
LEFT JOIN Receta r on r.idIngredientes = i.Id
WHERE idIngredientes is NULL)
ROLLBACK TRAN
--8.- Cambia la dirección del cliente 2, la nueva dirección es Calle Falsa 44
BEGIN TRAN
UPDATE Clientes SET Email = 'email@hotmail.com'
WHERE id = '2'
ROLLBACK TRAN
--9.- Modifica la descripción de las patatas bravas añadidas en el ejercicio 2.
BEGIN TRAN
    UPDATE Menu
    set Descripcion = 'Very angry potatoes'
    WHERE Nombre = 'Patatas bravas'
ROLLBACK TRAN

--10. Microsoft ha decidido cerrar hotmail. Ahora todos los correos de hotmail seran outlook. 
    --Actualiza la bbdd de clientes.
BEGIN TRAN
    UPDATE Clientes
    set Email=REPLACE(Email,'@hotmail.','@outlook.')
    WHERE Email like '%hotmail%'
ROLLBACK TRAN

--11. Incrementa el precio de todos los elementos del menú un 5%.
BEGIN TRAN
    UPDATE Menu
    set PrecioVenta = PrecioVenta + PrecioVenta * 0.05
ROLLBACK TRAN
--12 Los pedidos del 2022 tb deben verse afectados por ese incremento del 5%
            --Recalcula el subtotal, y el total de todos los pedidos del 2023.
BEGIN TRAN
    UPDATE Pedidos
    set SubTotal =SubTotal + SubTotal*0.05
 WHERE Fecha_pedido like '%2020%'
ROLLBACK TRAN

BEGIN TRAN
DECLARE @cnt INT = 1;
WHILE @cnt < (select COUNT(1) as num_cnt from PedidosLinea WHERE IdPedido in (SELECT Id FROM Pedidos WHERE Fecha_pedido like '%2023%') GROUP BY IdPedido)
    BEGIN
        UPDATE Pedidos
        set SubTotal = (select TOP(@cnt) (PrecioVentaUnitario+PrecioVentaUnitario*0.05)*(select TOP(@cnt) Cantidad from PedidosLinea WHERE IdPedido in (SELECT Id FROM Pedidos WHERE Fecha_pedido like '%2023%'))
        FROM PedidosLinea
        WHERE IdPedido
        in (SELECT Id FROM Pedidos WHERE Fecha_pedido like '%2020%'))
        SET @cnt = @cnt + 1;
    END;
ROLLBACK TRAN
SELECT * FROM Pedidos
--13.- Borra todos los elementos del menú que nadie ha pedido nunca.
BEGIN TRAN
    DELETE from Menu
    WHERE id in (
                SELECT m.Id FROM Menu m
                left JOIN Pedidos p on p.IdCliente = m.Id
                WHERE m.Id = NULL
                )
ROLLBACK TRAN

--14.- Añade un pedido a fecha de hoy para el cliente 5. Añadele 5 unidades del menu 1. 
--Recalcula todos los precios con el mínimo número de instrucciones SQL y intentando no poner nada "a pelo"
-- que no sea estrictamente necesario.
SELECT * FROM Pedidos
SELECT * FROM PedidosLinea

BEGIN TRAN
DECLARE @envio int = 4.99;
DECLARE @idMenu INT = 1;
DECLARE @cantidad INT = 5;
DECLARE @cliente INT = 5;
    INSERT into Pedidos (Fecha_pedido,Total,GastosEnvio,SubTotal,IdCliente,Telefono,Direccion,Cod_Postal,Ciudad)
    VALUES (
            GETDATE(),
            (select top(1) (PrecioVenta*@cantidad)+@envio FROM Menu WHERE id = @idMenu),
            @envio,
            (select top(1) PrecioVenta*@cantidad FROM Menu WHERE id = @idMenu),
            (select id from Clientes WHERE Id = @cliente),
            (select Telefono from Clientes WHERE Id = @cliente),
            (select Direccion from Clientes WHERE Id = @cliente),
            (select Cod_Postal from Clientes WHERE Id = @cliente),
            (select Ciudad from Clientes WHERE Id = @cliente)
            )
ROLLBACK TRAN

BEGIN TRAN
DECLARE @idMenupl INT = 1;
DECLARE @cantidadpl INT = 5;
    INSERT into PedidosLinea (IdPedido,IdMenu,Cantidad,PrecioVentaUnitario,IVA)
    VALUES (
            (select top(1) id from Pedidos ORDER by Fecha_pedido desc),
            @idMenupl,
            @cantidadpl,
            (select PrecioVenta from Menu WHERE id = @idMenupl),
            (SELECT IVA FROM TipoAlimento WHERE id = (select tipo from Menu WHERE id = @idMenupl))
            )
ROLLBACK TRAN