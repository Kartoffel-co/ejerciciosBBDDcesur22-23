use tiendacartaspokemon
-- ejercicio 1

BEGIN TRAN
    INSERT INTO clientes
    VALUES ('Pablo Vinolo','66 66 66 66 66','pablovinolo@examenbernat.com','calle falsa 123','12312','Sevilla')
ROLLBACK TRAN

-- ejercicio 2

BEGIN TRAN
    DELETE FROM cartaspokemon
    WHERE id in 
        (
            SELECT c.id FROM cartaspokemon c
            LEFT JOIN detalle d on d.idcarta = c.id
            WHERE idpedido is NULL AND idColeccion = (SELECT id FROM coleccion WHERE nombre = 'World Championship Decks')      
        )    
ROLLBACK TRAN

-- ejercicio 3 

BEGIN TRAN
    DELETE from Clientes
    WHERE id in 
        (
            SELECT c.id FROM clientes c
            LEFT JOIN pedidos p on p.idCliente = c.id
            WHERE p.idcliente is NULL
        )    
ROLLBACK TRAN

-- ejercicio 4 

BEGIN TRAN
UPDATE CartasPokemon
SET precio = (precio*1.14)
WHERE 1 = 1
ROLLBACK TRAN

-- ejercicio 5

BEGIN TRAN
    UPDATE Pedidos
    SET gastosenvio = '9.99'
    WHERE ciudad = 'Ceuta' 
ROLLBACK TRAN

-- ejercicio 6
BEGIN TRAN
    UPDATE Clientes
    set ciudad = 'B' + SUBSTRING(ciudad,2,200)
    WHERE ciudad LIKE 'b%'
ROLLBACK TRAN

-- ejercicio 7

BEGIN TRAN
    UPDATE Pedidos
    set idCliente = NULL
    FROM Pedidos p
    INNER JOIN Clientes c on c.id = p.idCliente
    WHERE email = 'noelfuentes@aol.edu'

    DELETE from Clientes
    WHERE email = 'noelfuentes@aol.edu'
ROLLBACK TRAN

-- ejercicio 8

BEGIN TRAN
    INSERT into Pedidos
    VALUES (
                GETDATE(),
                0,
                4.99,
                0,
                (select id from Clientes WHERE email = 'stephenfuentes@protonmail.ca'),
                (select nombre from Clientes WHERE email = 'stephenfuentes@protonmail.ca'),
                (select direccion from Clientes WHERE email = 'stephenfuentes@protonmail.ca'),
                (select codpostal from Clientes WHERE email = 'stephenfuentes@protonmail.ca'),
                (select ciudad from Clientes WHERE email = 'stephenfuentes@protonmail.ca')
            )

    INSERT into detalle
    VALUEs  (
                (select top(1) id from Pedidos WHERE idCliente = (select id from Clientes WHERE email = 'stephenfuentes@protonmail.ca') order by fecha desc),
                (
                    SELECT top(1) id FROM CartasPokemon
                    WHERE idColeccion in (SELECT id FROM coleccion WHERE nombre = 'League & Championship Cards')
                    ORDER BY id asc
                ),
                1,
                (
                    select precio from CartasPokemon WHERE id = 
                        (
                            SELECT top(1) id FROM CartasPokemon
                            WHERE idColeccion in (SELECT id FROM coleccion WHERE nombre = 'League & Championship Cards')
                            ORDER BY id asc
                        )
                )
            )
    UPDATE Pedidos
    SET subtotal = sum((select precioUnitario from detalle WHERE idPedido = (select top(1) id from Pedidos WHERE idCliente = (select id from Clientes WHERE email = 'stephenfuentes@protonmail.ca') order by fecha desc)))
    WHERE id = (select top(1) id from Pedidos WHERE idCliente = (select id from Clientes WHERE email = 'stephenfuentes@protonmail.ca') order by fecha desc)

    UPDATE Pedidos
    SET total = (select subtotal from Pedidos WHERE id = (select top(1) id from Pedidos WHERE idCliente = (select id from Clientes WHERE email = 'stephenfuentes@protonmail.ca')))+(select gastosEnvio from Pedidos WHERE id = (select top(1) id from Pedidos WHERE idCliente = (select id from Clientes WHERE email = 'stephenfuentes@protonmail.ca')))
    WHERE id = (select top(1) id from Pedidos WHERE idCliente = (select id from Clientes WHERE email = 'stephenfuentes@protonmail.ca') order by fecha desc)
ROLLBACK TRAN

-- ejercicio 9
BEGIN TRAN
    INSERT into Pedidos
    VALUES (
                GETDATE(),
                0,
                0,
                0,
                (
                SELECT top(1) idCliente FROM detalle d
                INNER JOIN CartasPokemon cp on cp.id = d.idCarta
                INNER JOIN Coleccion cc on cc.id = cp.idColeccion
                INNER JOIN Pedidos p on d.idPedido = p.id
                WHERE cp.idColeccion = (SELECT id FROM coleccion WHERE nombre = 'League & Championship Cards')
                GROUP BY idCliente
                ORDER BY COUNT(1) DESC
                ),
                (select nombre from Clientes WHERE id = (
                                                        SELECT top(1) idCliente FROM detalle d
                                                        INNER JOIN CartasPokemon cp on cp.id = d.idCarta
                                                        INNER JOIN Coleccion cc on cc.id = cp.idColeccion
                                                        INNER JOIN Pedidos p on d.idPedido = p.id
                                                        WHERE cp.idColeccion = (SELECT id FROM coleccion WHERE nombre = 'League & Championship Cards')
                                                        GROUP BY idCliente
                                                        ORDER BY COUNT(1) DESC
                                                        )),
                (select direccion from Clientes WHERE id = (
                                                        SELECT top(1) idCliente FROM detalle d
                                                        INNER JOIN CartasPokemon cp on cp.id = d.idCarta
                                                        INNER JOIN Coleccion cc on cc.id = cp.idColeccion
                                                        INNER JOIN Pedidos p on d.idPedido = p.id
                                                        WHERE cp.idColeccion = (SELECT id FROM coleccion WHERE nombre = 'League & Championship Cards')
                                                        GROUP BY idCliente
                                                        ORDER BY COUNT(1) DESC
                                                        )),
                (select codpostal from Clientes WHERE id = (
                                                        SELECT top(1) idCliente FROM detalle d
                                                        INNER JOIN CartasPokemon cp on cp.id = d.idCarta
                                                        INNER JOIN Coleccion cc on cc.id = cp.idColeccion
                                                        INNER JOIN Pedidos p on d.idPedido = p.id
                                                        WHERE cp.idColeccion = (SELECT id FROM coleccion WHERE nombre = 'League & Championship Cards')
                                                        GROUP BY idCliente
                                                        ORDER BY COUNT(1) DESC
                                                        )),
                (select ciudad from Clientes WHERE id = (
                                                        SELECT top(1) idCliente FROM detalle d
                                                        INNER JOIN CartasPokemon cp on cp.id = d.idCarta
                                                        INNER JOIN Coleccion cc on cc.id = cp.idColeccion
                                                        INNER JOIN Pedidos p on d.idPedido = p.id
                                                        WHERE cp.idColeccion = (SELECT id FROM coleccion WHERE nombre = 'League & Championship Cards')
                                                        GROUP BY idCliente
                                                        ORDER BY COUNT(1) DESC
                                                        ))
            )

    INSERT into detalle
    VALUEs  (
                (select top(1) id from Pedidos WHERE idCliente = (
                                                                    SELECT top(1) idCliente FROM detalle d
                                                                    INNER JOIN CartasPokemon cp on cp.id = d.idCarta
                                                                    INNER JOIN Coleccion cc on cc.id = cp.idColeccion
                                                                    INNER JOIN Pedidos p on d.idPedido = p.id
                                                                    WHERE cp.idColeccion = (SELECT id FROM coleccion WHERE nombre = 'League & Championship Cards')
                                                                    GROUP BY idCliente
                                                                    ORDER BY COUNT(1) DESC) order by fecha desc),
                117,
                1,
                (
                    select precio from CartasPokemon WHERE id = 117
                )
            )
ROLLBACK TRAN