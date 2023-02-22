USE arepezo

-- --1.Saca una lista de todas las bebidas donde se vea el nombre, la descripción y el Precio de venta al publico
-- SELECT Nombre,PrecioVenta,m.Descripcion FROM Menu m
-- INNER JOIN TipoAlimento tp on tp.Id = m.Tipo
-- WHERE tp.Descripcion = 'Bebidas'

-- --2. Sacar el menú del bar Arepazo. Debe estar ordenado por tipo de alimento (platos,tapas,bebidas) y por categoria
-- SELECT * FROM Menu m
-- INNER JOIN TipoAlimento tp on tp.Id = m.Tipo
-- INNER JOIN CategoriasMenu cm on cm.Id = m.Categoria
-- ORDER BY Tipo asc

-- --3. Saca una comparativa entre el Precio de venta y el precio que nos cuesta la materia prima.
-- SELECT m.Id,m.Nombre,PrecioVenta,SUM(i.PrecioKg*r.CantidadEnKg) as coste FROM Menu m
-- INNER JOIN Receta r on r.idMenu = m.id
-- INNER JOIN Ingredientes i on i.Id = r.idIngredientes
-- GROUP BY m.Id,PrecioVenta,m.Nombre


--4.¿Algún elemento del menú no es rentable?¿cual?(cuestan mas sus incredientes que el precio de venta, no entramos a valorar la mano de obra)
-- SELECT m.Id,m.Nombre,SUM(i.PrecioKg*r.CantidadEnKg),PrecioVenta AS coste FROM Menu m
-- INNER JOIN Receta r ON r.idMenu = m.id
-- INNER JOIN Ingredientes i ON i.Id = r.idIngredientes 
-- GROUP BY m.Id,PrecioVenta,m.Nombre 
-- HAVING SUM(i.PrecioKg*r.CantidadEnKg) > PrecioVenta

--5. Dame los datos del cliente que mas ha gastado?
-- SELECT c.Id,c.Nombre, SUM(Total) as TotalGastado FROM Clientes c
-- INNER JOIN Pedidos p on p.IdCliente = c.Id
-- GROUP BY c.Id,c.Nombre
-- ORDER BY TotalGastado DESC

--6. ¿Cual es el elemento del Menú que más se ha vendido? Ten en cuenta las cantidades.
-- SELECT m.Id,m.Nombre,SUM(Cantidad) as TotalCantidad FROM Menu m
-- INNER JOIN PedidosLinea pl on pl.idMenu = m.Id
-- GROUP BY m.Id,m.Nombre
-- ORDER BY TotalCantidad DESC

--7. Saca una factura desglosando el precio con iva y sin iva de cada linea del pedido numero 1.
-- Los precios están con IVA y el IVA dependerá del tipo de elemento.
-- En otra consulta, sacar el total desglosado, con IVA y sin IVA. Los gastos de envio no tienen IVA.
-- SELECT * FROM Pedidos p
-- INNER JOIN PedidosLinea pl on pl.IdPedido = p.Id
-- INNER JOIN Menu m on m.Id = pl.IdMenu
-- WHERE p.Id = 1

--8.Busca los elementos del menú  que nunca nadie ha pedido. 
-- SELECT m.Id,m.Nombre FROM Menu m
-- left JOIN Pedidos p on p.IdCliente = m.Id
-- WHERE m.Id = NULL

--9.Calcula cuanto ha ingresado el Arepazo por meses y año. ( Sumando el total del pedido)
SELECT sum(Total),MONTH(Fecha_pedido),YEAR(Fecha_pedido) FROM Pedidos
GROUP BY MONTH(Fecha_pedido),YEAR(Fecha_pedido)

--10.¿Que cliente ha hecho mas pedidos?