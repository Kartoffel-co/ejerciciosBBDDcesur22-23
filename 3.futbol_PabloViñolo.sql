use futbolvinolo
--1.-Añadete como jugador
insert set jugadores
SELECT (select idjugador+1 from Jugadores)
select * from Jugadores
--2,. añade a 10 jugadores más.

--3.- Crea un equipo con el nombre que quieras.

--4.- sumalo a laliga española.

--5.-Añade 5 partidos contra los equipos que tu quieras, jugados en 2022, Inventate los resultados.


--6.- Inventare las estadisticas de los jugadores ( goles, minutos jugados, asistentencias,tarjetas...


--7 asegurate que en la tabla PartidosJugadores, no se añaden mas goles que lo que dice el marcador en la tabla Partidos.


--8.- Si has encontrado algun error, actualiza el resultado en la tabla partidos. Podrias hacer un update que actualizara 
---el marcador de TODOS LOS PARTIDOS mirando los goles de PARTIDOSJUGADORES?


--9.-Ficha al jugador que quieras para tu equipo. Cambialo de equipo y ponlo a jugar.

--10.- añadete una tajeta amarilla a ti en tu último partido.


--11.- Borra aquellos jugadores que no hayan jugado ningun partido.

--12.- laliga decide expulsar al Real Madrid y Barcelona por tener el presupuesto hinchado.
        -- Elimínalos de la bbdd. Borra todo lo estrictamente necesario.


 --13.-Al finalizar el segundo partido de tu equipo, cambias el entrenador. Actualiza el nombre del entrenador


 --14 Que cambio harias en la bbdd para poder guardar el historico de entrenadores de cada equipo? 
   -- haz los cambios en el DDL y luego actualiza la información de ese cambio de entrenador de tu equipo.


--15 añade los resultados de algun partido de esta semana que no esté en la bbdd.


--16 Crea una tabla Clasificación y vuelva en ella la clasificación de 
--laliga a según los datos actuales de esta temporada.
