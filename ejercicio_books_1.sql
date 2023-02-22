-- CREATE DATABASE books
USE books
SELECT * FROM libros WHERE puntuacion_media>'03/19/2003'
ORDER BY puntuacion_media ASC

-- -- 1
-- ALTER TABLE libros ALTER COLUMN titulo NVARCHAR(500)

-- -- 2
-- ALTER TABLE libros ALTER COLUMN isbn VARCHAR(13)

-- -- 3
-- DROP TABLE preciosimpresion

-- -- 4
-- ALTER TABLE Pedidos DROP CONSTRAINT fkclientes
-- ALTER TABLE Clientes DROP CONSTRAINT PK__Clientes__885457EE46580C22
-- ALTER TABLE Clientes ALTER COLUMN idCliente BIGINT
-- ALTER TABLE Pedidos ALTER COLUMN idCliente BIGINT
-- ALTER TABLE Clientes ADD CONSTRAINT PK__Clientes__885457EE46580C22 PRIMARY KEY (idCliente)
-- ALTER TABLE Pedidos ADD CONSTRAINT fkclientes FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)

-- -- 5
-- ALTER TABLE Pedidos DROP CONSTRAINT fkclientes
-- ALTER TABLE Detalle DROP CONSTRAINT fkpedidodetalle
-- DROP TABLE Pedidos

-- -- 6
-- ALTER TABLE Clientes ADD recibir_notificaciones bit 