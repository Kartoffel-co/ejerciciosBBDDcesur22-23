DROP DATABASE IF EXISTS enfermedades;
CREATE DATABASE enfermedades;
USE enfermedades;

CREATE TABLE enfermedades(
    steamid INT PRIMARY KEY,
    nombre_usuario VARCHAR(300) NOT NULL,
    hipotermia BIT DEFAULT 0 NOT NULL,
    tiempo_hipotermia INT NULL,
    diarrea BIT DEFAULT 0 NOT NULL,
    tiempo_diarrea INT NULL,
    tuberculosis BIT DEFAULT 0 NOT NULL,
    tiempo_tuberculosis INT NULL,
    escoliosis BIT DEFAULT 0 NOT NULL,
    tiempo_escoliosis INT NULL,
    cancer BIT DEFAULT 0 NOT NULL,
    tiempo_cancer INT NULL
);