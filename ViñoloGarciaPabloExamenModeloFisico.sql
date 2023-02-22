-- Ejercicio 1
USE master
DROP DATABASE IF EXISTS Rebeldes_ViñoloGarciaPablo
CREATE DATABASE Rebeldes_ViñoloGarciaPablo
USE Rebeldes_ViñoloGarciaPablo
CREATE TABLE rango(
    id INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    salario decimal(18,2) NOT NULL,
)

CREATE TABLE planeta(
    id INT PRIMARY KEY NOT NULL,
    nombre NVARCHAR(300) NOT NULL,
    coordenadas VARCHAR(8000) NOT NULL,
)

CREATE TABLE nave(
    id INT PRIMARY KEY NOT NULL,
    modelo VARCHAR(300) NOT NULL,
    matricula VARCHAR(300) NOT NULL,
    fecha_fabricacion DATE NOT NULL,
)

CREATE TABLE soldado(
    id INT PRIMARY KEY NOT NULL,
    nombre NVARCHAR(300) NOT NULL,
    apellidos NVARCHAR(300) NOT NULL,
    fecha_nacimiento DATE NULL,
    id_rango INT NOT NULL,
    CONSTRAINT id_rango_soldado FOREIGN KEY (id_rango) REFERENCES rango(id),
    id_planeta INT NOT NULL,
    CONSTRAINT id_planeta_soldado FOREIGN KEY (id_planeta) REFERENCES planeta(id),
    id_nave INT NOT NULL,
    CONSTRAINT id_nave_soldado FOREIGN KEY (id_nave) REFERENCES nave(id),
    )
-- Ejercicio 2
USE laliga
ALTER TABLE clasificacion ADD partidosGanados INT
ALTER TABLE clasificacion ADD partidosPerdidos INT
ALTER TABLE clasificacion ADD partidosEmpatados INT
ALTER TABLE clasificacion ADD partidosJugados INT

-- Ejercicio 3
CREATE TABLE Arbitros(
    carnetFederacion int PRIMARY KEY,
    nombre VARCHAR(300) NOT NULL,
    fechaNacimiento DATE NULL,
)

-- Ejercicio 4
CREATE TABLE Arbitros_Partidos(
    idPartidos INT PRIMARY KEY,
    CONSTRAINT idPartidos FOREIGN key (idPartidos) REFERENCES Partidos(id),
    carnetFederacion INT NOT NULL,
    CONSTRAINT carnetFederacion FOREIGN KEY (carnetFederacion) REFERENCES Arbitros(carnetFederacion)
    )

-- Ejercicio 5
ALTER TABLE Jugadores ALTER COLUMN SueldoAnual DECIMAL(11,2)

-- Ejercicio 6
ALTER TABLE Estadisticas DROP CONSTRAINT fkjugadores
ALTER TABLE Jugadores ALTER COLUMN idJugador VARCHAR(21) NOT NULL
ALTER TABLE Estadisticas ALTER COLUMN idJugador VARCHAR(21) NOT NULL
ALTER TABLE Estadisticas ADD CONSTRAINT fkjugadores FOREIGN KEY (idJugador) REFERENCES Jugadores(idJugador)

-- Ejercicio 7
ALTER TABLE Equipos ALTER COLUMN nombre VARCHAR(100) NOT NULL
ALTER TABLE Equipos ALTER COLUMN PresupuestoAnual DECIMAL(18,2) NOT NULL

-- Ejercicio 8
ALTER TABLE Jugadores DROP COLUMN edad