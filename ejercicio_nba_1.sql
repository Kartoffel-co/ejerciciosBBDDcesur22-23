-- --1.Jugadores de los Boston Celtics
-- USE nba
-- SELECT idjugador,nombre,idequipo FROM dbo.jugadores WHERE idequipo = ('BOS')

-- --2.Jugador que más puntos ha metido en la temporada 2020
-- USE nba
-- SELECT top(1) SUM(puntos) as puntosTotales,idjugador FROM dbo.EstadisticasPartidos GROUP BY idjugador ORDER BY SUM(puntos) DESC

--3.equipo con mas victorias en el 2019
-- USE nba
-- SELECT top(1) COUNT(1) as numeroVictorias, idganador FROM Partidos GROUP BY idganador ORDER BY numeroVictorias DESC

--4.Clasificación de las dos conferencias. ( se ordenan por numero de victorias, separando los equipos del Este y del Oeste), Sacarlo en dos consultas.
use nba
SELECT COUNT(1),nombre,conferencia from Equipos INNER JOIN Partidos ON idequipo = idganador GROUP BY conferencia

-- -- DROP FOREIGN KEY
-- ALTER TABLE JugadoresEquipos DROP CONSTRAINT fkjugadorequipo
-- ALTER TABLE EstadisticasPartidos DROP CONSTRAINT fkjugador
-- -- DROP PRIMARY KEY
-- ALTER TABLE JugadoresEquipos DROP CONSTRAINT PK__Jugadore__D6C586BFC9850AC2
-- ALTER TABLE EstadisticasPartidos DROP CONSTRAINT PK__Estadist__9A5629BA5C81C5C4
-- ALTER TABLE jugadores DROP CONSTRAINT pkjugador
-- -- ALTER TABLE VARCHAR(11)
-- ALTER TABLE jugadores ALTER COLUMN idjugador VARCHAR(11) NOT NULL
-- ALTER TABLE EstadisticasPartidos ALTER COLUMN idjugador VARCHAR(11) NOT NULL
-- ALTER TABLE JugadoresEquipos ALTER COLUMN idjugador VARCHAR(11) NOT NULL
-- -- ADD PRIMARY KEY
-- ALTER TABLE jugadores ADD CONSTRAINT pkjugador PRIMARY KEY (idjugador)
-- ALTER TABLE EstadisticasPartidos ADD CONSTRAINT PK__Estadist__9A5629BA5C81C5C4 PRIMARY KEY (idjugador)
-- ALTER TABLE JugadoresEquipos ADD CONSTRAINT PK__Jugadore__D6C586BFC9850AC2 PRIMARY KEY (idjugador)

-- -- ADD FOREIGN KEY
-- ALTER TABLE EstadisticasPartidos ADD CONSTRAINT fkjugador FOREIGN KEY (idjugador) REFERENCES jugadores(idjugador) 
-- ALTER TABLE JugadoresEquipos ADD CONSTRAINT fkjugadorequipo FOREIGN KEY (idjugador) REFERENCES jugadores(idjugador)


--5.Jugadores españoles


--6.Paises de nacimiento de los jugadores, ranking de los 20 paises que más jugadores aportan.


--7.top 10 de los jugadores con más puntos por partido


--8.top 10 Jugadores con mas asistencias por partido


--9.Top 10 de jugadores con mas triples por minuto jugado


--10.Jugador mas bajito de la NBA


--11.Equipo con mas puntos por partido


--12.Equipos en los que ha jugado Ricky Rubio estos últimos años.


--13.Equipo con más derrotas.


--14.Clasificación por victorias si no se separaran los equipos por conferencias este y oeste de esta temporada.