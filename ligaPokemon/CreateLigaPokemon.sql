use master

drop DATABASE ligaPokemon
CREATE DATABASE ligaPokemon

USE ligaPokemon

CREATE TABLE entrenadores (
    id int PRIMARY KEY not NULL,
    nombre VARCHAR(300) not NULL
)

CREATE TABLE equipos (
    id int PRIMARY key not NULL,
    idJugador int not NULL,
    pokemon1 VARCHAR(300),
    pokemon2 VARCHAR(300),
    pokemon3 VARCHAR(300),
    pokemon4 VARCHAR(300),
    pokemon5 VARCHAR(300),
    pokemon6 VARCHAR(300),
    CONSTRAINT fkIdJugador FOREIGN key (idJugador) REFERENCES entrenadores(id)
)

CREATE TABLE partidos (
    id int PRIMARY key not NULL,
    fechaPartido DATETIME not NULL,
    idLocal int not null,
    idVisitante int not null,
    marcadorLocal int not null,
    marcadorVisitante int not null,
    jornada int,
    CONSTRAINT fkidLocal FOREIGN key (idLocal) REFERENCES equipos(id),
    CONSTRAINT fkidVisitante FOREIGN key (idVisitante) REFERENCES equipos(id)
)

create TABLE clasificacion (
    id int PRIMARY key not NULL,
    nombre VARCHAR(300) not null,
    Puntos int not null
)