--1.-Da de alta un cliente en el arepazo
select top 10 * from Clientes order by id desc
insert into clientes
select 'Bernat','C','bcpsta@c.com','3453534','calle falsa 22','Spain','Andalucia','41006',getdate(),'Sevilla'

--2.-Da de alta un nuevo plato en el arepa<o. Patatas bravas que cueste 3e.

select * from menu order by id desc
insert into menu
select 'Patatas Alioli','dfgdfsgdf',1,1,3.50

--3.-Ese plato, lleva 0.2kg de patatas. Añade tb el ingrediente y la receta.

insert into Ingredientes
select 'Salsa Alioli',2.0

insert into receta
select id,(select id from ingredientes  menu where nombre='Patatas'),0.2 from menu where descripcion = 'dfgdfsgdf'

--4.-Añade un pedido de 3 raciones de patatas bravas, 3 caña a ese nuevo cliente.

--4.1 Insertatr un pedido
select * from pedidos order by id desc
BEGIN TRAN
insert into pedidos
select getdate(),0,6.99,0, id,Telefono,Direccion,Cod_Postal,Provincia from clientes where email='bcpsta@c.com'
--4.2 añadir los productos al pedido

insert into PedidosLinea
select (select max(id) from pedidos),m.id,3,precioventa,t.iva from menu m
inner JOIN TipoAlimento t on t.Id=m.Tipo
where nombre = 'Patatas Bravas' or nombre = 'Caña'

--4.3 saber el total, calcular el total y subtotal

update pedidos set subtotal = (
select sum(cantidad * precioventaunitario) from PedidosLinea 
where idpedido =(select max(id) from pedidos)
)
WHERE id =(select max(id) from pedidos)

update Pedidos set total = GastosEnvio + SubTotal where id =((select max(id) from pedidos))

ROLLBACK TRAN
--5 añade y borra un cliente.
insert into clientes
select 'Bernat','C','bcpsta@c.com2','3453534','calle falsa 22','Spain','Andalucia','41006',getdate(),'Sevilla'
insert into clientes
select 'Bernat','C','bcpsta@c.com3','3453534','calle falsa 22','Spain','Andalucia','41006',getdate(),'Sevilla'

begin TRAN
delete from  clientes where email = 'bcpsta@c.com3'
rollback tran



--6.- Borra todos los clientes que no tengan pedidos realizados.

begin TRAN
delete from  clientes where id in (

select c.id from clientes c
left join pedidos p on p.IdCliente = c.id
where p.Id is null
)
rollback tran


--7.- Borra los ingredientes que no se usan en ninguna receta.


begin TRAN
delete from  ingredientes where id in (

select c.id from ingredientes c
left join receta p on p.idIngredientes = c.id
where p.idMenu is null
)
rollback tran



--8.- Cambia la dirección del cliente 2, la nueva dirección es Calle Falsa 44

BEGIN TRAN
UPDATE  clientes set Direccion = 'Calle Falsisima 33' where id = 2
ROLLBACK TRAN


--9.- Modifica la descripción de las patatas bravas añadidas en el ejercicio 2.

BEGIN TRAN
UPDATE  menu set Descripcion = 'Calle Falsisima 33' where nombre = 'Patatas Bravas'
ROLLBACK TRAN


--10. Microsoft ha decidido cerrar hotmail. Ahora todos los correos de hotmail seran outlook. 
    --Actualiza la bbdd de clientes.

BEGIN TRAN
UPDATE  clientes set email =replace(email,'@hotmail.','@outlook.') where email  like '%hotmail.%'
ROLLBACK TRAN


--11. Incrementa el precio de todos los elementos del menú un 5%.

BEGIN TRAN
UPDATE  menu set PrecioVenta = PrecioVenta *1.05 where  1=1
ROLLBACK TRAN



--12 Los pedidos del 2021 tb deben verse afectados por ese incremento del 5%
            --Recalcula el subtotal, y el total de todos los pedidos del 2021.

begin TRAN

update pedidos set SubTotal = SubTotal*1.05 where year(Fecha_pedido)=2021
update pedidos set total = SubTotal + GastosEnvio where year(Fecha_pedido)=2021
update PedidosLinea set PrecioVentaUnitario =PrecioVentaUnitario*1.05 
where IdPedido in (select id from pedidos where year(Fecha_pedido)=2021)
rollback tran

--13.- Borra todos los elementos del menú que nadie ha pedido nunca.

begin TRAN
delete from  receta where idmenu    in (

select c.id from menu c
left join PedidosLinea p on p.IdMenu = c.id
where p.id is null
)

delete from  menu where id in (
select c.id from menu c
left join PedidosLinea p on p.IdMenu = c.id
where p.id is null
)
rollback tran


--14.- Añade un pedido a fecha de hoy para el cliente 5. Añadele 5 unidades del menu 1. 
--Recalcula todos los precios con el mínimo número de instrucciones SQL y intentando no poner nada "a pelo"
-- que no sea estrictamente necesario.

--4.1 Insertatr un pedido
select * from pedidos order by id desc
BEGIN TRAN
insert into pedidos
select getdate(),0,6.99,0, id,Telefono,Direccion,Cod_Postal,Provincia from clientes where id=5
--4.2 añadir los productos al pedido

insert into PedidosLinea
select (select max(id) from pedidos),m.id,5,precioventa,t.iva from menu m
inner JOIN TipoAlimento t on t.Id=m.Tipo
where m.id=1

--4.3 saber el total, calcular el total y subtotal

update pedidos set subtotal = (
select sum(cantidad * precioventaunitario) from PedidosLinea 
where idpedido =(select max(id) from pedidos)
)
WHERE id =(select max(id) from pedidos)

update Pedidos set total = GastosEnvio + SubTotal where id =((select max(id) from pedidos))

ROLLBACK TRAN
