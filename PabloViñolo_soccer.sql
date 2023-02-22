USE SOCCER
CREATE DATABASE SOCCER

--1.Competiciones de España


--2.Equipos de la liga española


--3.Equipo con mas goles en casa


--4.equipo con mas goles en casa y fuera
select team_api_id,team_long_name,team_short_name,sum(sumagoles) as golestotales from 
        (select t.team_api_id,t.team_long_name,t.team_short_name,sum(m.home_team_goal) as sumagoles from  team t
        inner join [Match] m on t.team_api_id = m.home_team_api_id
        group by t.team_api_id, t.team_long_name,t.team_short_name

        union all 
        select t.team_api_id,t.team_long_name,t.team_short_name,sum(m.away_team_goal) from  team t
        inner join [Match] m on t.team_api_id = m.away_team_api_id
        group by t.team_api_id, t.team_long_name,t.team_short_name) as t1

group by team_api_id,team_long_name,team_short_name
order by golestotales desc
--5.equipo con con mas victorias


--6.Jugadores del betis/sevilla la temporada 2015/2016


--7.top 20 de los equipos que mas empatan.


--8.equipos con los jugadores con la media de altura mas altos.


--9.Equipo que mas veces ha perdido un partido.


--10.jugador mas joven.


--11.¿Hay algun jugador que cumplaaños hoy, siendo hoy, la fecha en la que se lance la consulta?


--12.que dia del año hay mas cumpleaños?


--13.¿Que mejoras podriamos hacer en el diseño de la bbdd para facilitar las consultas?