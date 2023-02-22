USE master
GO
DROP DATABASE IF EXISTS toysrus
GO
CREATE DATABASE toysrus
GO
USE toysrus
GO

CREATE TABLE cliente(
    id INT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    telefono VARCHAR(80) NOT NULL,
    password VARCHAR(255) NOT NULL,
)

CREATE TABLE vendedor(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
)

CREATE TABLE producto(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion VARCHAR(8000) NOT NULL,
    -- en el enunciado pone que el precio mas alto de un producto es de 3 digitos pero , he puesto el maximo de 18 digitos por si se añaden productos mas caros en el futuro
    precio DECIMAL(18,2) NOT NULL,

)

CREATE TABLE tematica(
    id INT IDENTITY(1,1) PRIMARY KEY,
    tematica VARCHAR(255) NOT NULL,
)
CREATE TABLE producto_tematica(
    id_producto INT PRIMARY KEY,
    id_tematica INT NOT NULL,
    CONSTRAINT fkproducto_tematica FOREIGN KEY (id_producto) REFERENCES producto(id),
    CONSTRAINT fktematica_producto FOREIGN KEY (id_tematica) REFERENCES tematica(id),
)

CREATE TABLE pedido(
    id INT IDENTITY(1,1) PRIMARY KEY,
    total INT NOT NULL,
    fecha DATETIME NOT NULL,
    direccion VARCHAR(8000) not NULL,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    CONSTRAINT fkpedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    CONSTRAINT fkpedido_vendedor FOREIGN KEY (id_vendedor) REFERENCES vendedor(id),
)

CREATE TABLE pedido_producto(
    id_pedido INT PRIMARY KEY,
    id_producto INT NOT NULL,
    precio DECIMAL(18,2) NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT fkpedido_producto FOREIGN KEY (id_pedido) REFERENCES pedido(id),
    CONSTRAINT fkproducto_pedido FOREIGN KEY (id_producto) REFERENCES producto(id),
)