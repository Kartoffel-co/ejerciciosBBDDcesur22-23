USE master
GO
DROP DATABASE IF EXISTS netflix
GO
CREATE DATABASE netflix
GO
USE netflix
GO

CREATE TABLE usuario(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    avatar VARCHAR(8000) NOT NULL,
    password VARCHAR(200) NOT NULL,
)

CREATE TABLE cliente(
    id INT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(200) NOT NULL,
    region VARCHAR(200) NOT NULL,
    plan_pago  DECIMAL(18,2) NOT NULL,
    password VARCHAR(200) NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT fkusuario FOREIGN KEY (id_usuario) REFERENCES usuario(id),
)

CREATE TABLE genero(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR NOT NULL,
)

CREATE TABLE series(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    fecha_estreno DATETIME NOT NULL,
    numero_temporadas INT NOT NULL,
    numero_capitulos INT NOT NULL,
)

CREATE TABLE peliculas(
    id INT IDENTITY(1,1) PRIMARY KEY,
    duracion TIME NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    fecha_estreno DATETIME NOT NULL,
)

CREATE TABLE genero_series(
    id_series INT PRIMARY KEY,
    id_genero INT NOT NULL,
    CONSTRAINT fkseries_genero FOREIGN KEY (id_series) REFERENCES series(id),
    CONSTRAINT fkgenero_series FOREIGN KEY (id_genero) REFERENCES genero(id),
)

CREATE TABLE genero_peliculas(
    id_peliculas INT PRIMARY KEY,
    id_genero INT NOT NULL,
    CONSTRAINT fkpeliculas_genero FOREIGN KEY (id_peliculas) REFERENCES peliculas(id),
    CONSTRAINT fkgenero_peliculas FOREIGN KEY (id_genero) REFERENCES genero(id),
)

CREATE TABLE contenido(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    fecha_estreno DATETIME NOT NULL,
    id_peliculas INT NOT NULL,
    CONSTRAINT fkpeliculas_contenido FOREIGN KEY (id_peliculas) REFERENCES peliculas(id),
    id_series INT NOT NULL,
    CONSTRAINT fkserie_contenido FOREIGN KEY (id_series) REFERENCES series(id),
)

CREATE TABLE capitulos(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    duracion TIME NOT NULL,
    id_series INT NOT NULL,
    CONSTRAINT fkserie_capitulo FOREIGN KEY (id_series) REFERENCES series(id),
)

CREATE TABLE favoritos(
    id_usuario INT PRIMARY KEY,
    id_contenido INT NOT NULL,
    CONSTRAINT fkusuario_favoritos FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    CONSTRAINT fkcontenido_favoritos FOREIGN KEY (id_contenido) REFERENCES contenido(id),
)