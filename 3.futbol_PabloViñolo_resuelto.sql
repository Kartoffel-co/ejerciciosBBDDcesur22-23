use futbol
select * from Jugadores order by idjugador desc
--1.-Añadete como jugador
insert into Jugadores (idjugador,nombrecorto,nombre)
values ((select max(idjugador) +1 from jugadores),'BernatD','Bernat Costa')
--2,. añade a 10 jugadores más.

insert into Jugadores (idjugador,nombrecorto,nombre)
values ((select max(idjugador) +1 from jugadores),'BernatE','Bernat Costa')

insert into Jugadores (idjugador,nombrecorto,nombre)
values ((select max(idjugador) +1 from jugadores),'BernatF','Bernat Costa')

insert into Jugadores (idjugador,nombrecorto,nombre)
values ((select max(idjugador) +1 from jugadores),'BernatG','Bernat Costa')

insert into Jugadores (idjugador,nombrecorto,nombre)
values ((select max(idjugador) +1 from jugadores),'BernatH','Bernat Costa')

insert into Jugadores (idjugador,nombrecorto,nombre)
values ((select max(idjugador) +1 from jugadores),'BernatI','Bernat Costa')

insert into Jugadores (idjugador,nombrecorto,nombre)
values ((select max(idjugador) +1 from jugadores),'BernatJ','Bernat Costa')

insert into Jugadores (idjugador,nombrecorto,nombre)
values ((select max(idjugador) +1 from jugadores),'BernatK','Bernat Costa')

insert into Jugadores (idjugador,nombrecorto,nombre)
values ((select max(idjugador) +1 from jugadores),'BernatL','Bernat Costa')

insert into Jugadores (idjugador,nombrecorto,nombre)
values ((select max(idjugador) +1 from jugadores),'BernatM','Bernat Costa')

insert into Jugadores (idjugador,nombrecorto,nombre)
values ((select max(idjugador) +1 from jugadores),'BernatN','Bernat Costa')

select * from Competiciones
--3.- Crea un equipo con el nombre que quieras.
insert into Equipos
values ((select max(idEquipo) + 1 from equipos),'UESants','Unio Esportiva Sants',
(select idcompeticion from Competiciones where nombre like '%premier-leag%'),
10,'La Borderta',100,'BernatZ','http://www.uesants.com')

--4.- sumalo a laliga española.
begin tran
update Equipos 
set idCompeticion =(select idCompeticion from Competiciones where nombre='laliga')
where nombreCorto ='UESants'
rollback tran
--5.-Añade 5 partidos contra los equipos que tu quieras, jugados en 2022, Inventate los resultados.

insert into partidos
values ((select max(idpartido) + 1 from partidos),
(select idCompeticion from Competiciones where nombre='laliga'),
year(getdate()),
1,
getdate(),
(select idequipo from Equipos where nombreCorto ='UESants'),
(select idequipo from Equipos where nombreCorto like '%betis%'),
5,
3,
'Alfonso Baena',
'https://cesur.com',
null
)


insert into partidos
values ((select max(idpartido) + 1 from partidos),
(select idCompeticion from Competiciones where nombre='laliga'),
year(getdate()),
1,
getdate(),
(select idequipo from Equipos where nombreCorto ='UESants'),
(select idequipo from Equipos where nombreCorto like '%malaga%'),
10,
1,
'Alfonso Baena',
'https://cesur.com',
null
)


begin tran
update Partidos set idganador = idEquipoLocal 
where GolesLocales>GolesVisitantes 
--and idpartido=(select max(idpartido)from partidos) 

update Partidos set idganador = idEquipoVisitante 
where GolesLocales<GolesVisitantes 
--and idpartido=(select max(idpartido)from partidos)
rollback tran


--6.- Inventare las estadisticas de los jugadores ( goles, minutos jugados, asistentencias,tarjetas...
select * from jugadores where nombre like 'Bernat%'

update Jugadores 
set idEquipoActual =(select idEquipo from Equipos where nombreCorto='UESants') WHERE
nombre  like 'Bernat%'



insert into PartidosJugadores

select top 11 idjugador,
(select max(idpartido) from partidos),
idEquipo,1,1,90,1,0
 from jugadores j
inner join Equipos e on e.idEquipo= j.idEquipoActual 
where j.nombre like 'Bernat%' and e.nombreCorto='UESants'

--7 asegurate que en la tabla PartidosJugadores, no se añaden mas goles que lo que dice el marcador en la tabla Partidos.


select GolesLocales,sum(goles) from Partidos p
inner join PartidosJugadores pj on p.idEquipoLocal=pj.idEquipo
and p.idPartido = pj.idPartido
group by p.GolesLocales,p.idPartido,p.idEquipoLocal
having GolesLocales < sum(goles)


--8.- Si has encontrado algun error, actualiza el resultado en la tabla partidos. Podrias hacer un update que actualizara 
---el marcador de TODOS LOS PARTIDOS mirando los goles de PARTIDOSJUGADORES?


--9.-Ficha al jugador que quieras para tu equipo. Cambialo de equipo y ponlo a jugar.

select * from jugadores where nombre like '%joaquin%'

begin TRAN
update jugadores 
set idEquipoActual = (select idequipo from Equipos where nombrecorto='UESants') 
where nombre = 'Joaquin'

insert into PartidosJugadores
select top 11 idjugador,
(select max(idpartido) from partidos),
idEquipo,100,1,5,1,0
 from jugadores j
inner join Equipos e on e.idEquipo= j.idEquipoActual 
where j.nombre ='Joaquin' and e.nombreCorto='UESants'




rollback tran

--10.- añadete una tajeta amarilla a ti en tu último partido.

begin TRAN
  update PartidosJugadores set TarjetasAmarillas =TarjetasAmarillas+1
  ,TarjetasRojas=1
  where idJugador = (select idjugador from Jugadores where nombre='Fali')
  and idEquipo =(select idEquipo from Equipos where nombreCorto ='UESants')
rollback tran

--11.- Borra aquellos jugadores que no hayan jugado ningun partido.
begin TRAN
 
delete from jugadores where idjugador in (
  select j.idjugador from Jugadores j
  left join PartidosJugadores p on p.idJugador=j.idjugador
  where p.idPartido is null
)
rollback tran

--12.- laliga decide expulsar al Real Madrid y Barcelona por tener el presupuesto hinchado.
        -- Elimínalos de la bbdd. Borra todo lo estrictamente necesario.

begin TRAN
delete from PartidosJugadores where idEquipo in (select idEquipo from Equipos where nombrecorto = 'UEsants')

update Jugadores set idEquipoActual =null where idEquipoActual =(select idEquipo from Equipos where nombrecorto = 'UEsants')
delete from partidos where idEquipoLocal in (select idEquipo from Equipos where nombrecorto = 'UEsants')
delete from partidos where idEquipoVisitante in (select idEquipo from Equipos where nombrecorto = 'UEsants')
delete from PartidosJugadores where idEquipo in (select idEquipo from Equipos where nombrecorto = 'UEsants')

delete from Equipos where nombrecorto = 'UEsants'

rollback tran

 --13.-Al finalizar el segundo partido de tu equipo, cambias el entrenador. Actualiza el nombre del entrenador

begin TRAN
update Equipos set Entrenador='Paco' where nombreCorto ='UESants'
rollback tran

 --14 Que cambio harias en la bbdd para poder guardar el historico de entrenadores de cada equipo? 
   -- haz los cambios en el DDL y luego actualiza la información de ese cambio de entrenador de tu equipo.



--15 añade los resultados de algun partido de esta semana que no esté en la bbdd.



--16 Crea una tabla Clasificación y vuelva en ella la clasificación de 
--laliga a según los datos actuales de esta temporada.

create table clasificacionlaliga2020 (
id int IDENTITY(1,1) PRIMARY key,
idequipo int,
nombre varchar(100),
puntos int

)


select idEquipo,nombre,sum(puntos) from(

  select  e.idequipo,e.nombre, count(1)*3 as puntos from Equipos e
  inner join Partidos p on e.idequipo=p.idganador
  inner join Competiciones c on c.idCompeticion = p.idCompeticion
  where p.temporada=2020  and c.nombre ='laliga'
  group by e.idequipo,e.nombre
  union ALL
  select  e.idequipo,e.nombre, count(1) from Equipos e
  inner join Partidos p on e.idequipo=p.idEquipoLocal
  inner join Competiciones c on c.idCompeticion = p.idCompeticion
  where p.temporada=2020  and c.nombre ='laliga' and idGanador is null
  group by e.idequipo,e.nombre

  union all

  select  e.idequipo,e.nombre, count(1) from Equipos e
  inner join Partidos p on e.idequipo=p.idEquipoVisitante
  inner join Competiciones c on c.idCompeticion = p.idCompeticion
  where p.temporada=2020  and c.nombre ='laliga' and idGanador is null
  group by e.idequipo,e.nombre
)
as T
group by idequipo,nombre
order by sum(puntos) desc

select idequipo, nombre,sum(puntos) from  (
select  e.idequipo,e.nombre, count(1)*3 as puntos from Equipos e
inner join Partidos p on e.idequipo=p.idganador
inner join Competiciones c on c.idCompeticion = p.idCompeticion
where p.temporada=2020  and c.nombre ='laliga'
group by e.idequipo,e.nombre
union  all
select  e.idequipo,e.nombre, count(1) from Equipos e
inner join Partidos p on e.idequipo=p.idEquipoLocal
inner join Competiciones c on c.idCompeticion = p.idCompeticion
where p.temporada=2020  and c.nombre ='laliga' and idGanador is null
group by e.idequipo,e.nombre

union all
select  e.idequipo,e.nombre, count(1) from Equipos e
inner join Partidos p on e.idequipo=p.idEquipoVisitante
inner join Competiciones c on c.idCompeticion = p.idCompeticion
where p.temporada=2020  and c.nombre ='laliga' and idGanador is null
group by e.idequipo,e.nombre
)
as T
group by idEquipo,nombre
order by sum(puntos) desc