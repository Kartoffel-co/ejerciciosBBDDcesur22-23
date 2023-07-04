USE ligaPokemon

CREATE TABLE entrenadores (
    id int(1,1) PRIMARY KEY not NULL,
    nombre VARCHAR(300) not NULL
)

CREATE TABLE equipos (
    id int(1,1) PRIMARY key not NULL,
    idEquipo int not NULL,
    pokemon1 VARCHAR(300) not NULL,
    pokemon2 VARCHAR(300) not NULL,
    pokemon3 VARCHAR(300) not NULL,
    pokemon4 VARCHAR(300) not NULL,
    pokemon5 VARCHAR(300) not NULL,
    pokemon6 VARCHAR(300) not NULL,
    CONSTRAINT fkIdEquipo FOREIGN key (idEquipo) REFERENCES entrenadores(id)
)

CREATE TABLE partidos (
    id int(1,1) PRIMARY key not NULL,
    fechaPartido DATETIME not NULL,
    idLocal int not null,
    idVisitante int not null,
    marcadorLocal int not null,
    marcadorVisitante int not null,
    CONSTRAINT fkidLocal FOREIGN key (idLocal) REFERENCES equipos(id),
    CONSTRAINT fkidVisitante FOREIGN key (idVisitante) REFERENCES equipos(id)
)

create TABLE clasificacion (
    id int(1,1) PRIMARY key not NULL,
    nombre VARCHAR(300) not null,
    Puntos int not null
)