use twitter
select * from usuarios
--1 añadete como usuario
insert into usuarios
select 'bernat','bcosta','bernat@cesur.com','4345353','Andalucia','dsfgdfgdf' 

select getdate()
--2 publica un tuit
select  top 10 * from tweets order by fecha desc
insert into tweets
select getdate(),id,'hola mundo' from usuarios where nick ='bcosta'

--3 modifica el nombre del usuario de todos los usuarios 
--con contraseña repetida por 'CuentaBloqueada'
begin tran
update usuarios set nombre = 'CuentaBloqueada' where contrasena in (
select contrasena from usuarios group by contrasena having count(1)>1)
rollback tran
--4 añade ak nombre del usuario con mas tuits un * al final del nombre.

begin TRAN
update usuarios set nombre = nombre + '*' where id in (
select top 1 u.id, NOMBRE from usuarios u 
inner join tweets t on u.id = t.idusuario
group by u.id,NOMBRE
order by count(1) desc
)
ROLLBACK tran


--5.- CAMBIA LOS EMAILS DE GOOGLE A GUGLE
begin trAN
UPDATE usuarios set email = REPLACE(email,'@google','@gugle')
 where
email like '%@google%' 

ROLLBACK TRAN
--6 borra a karen ( la del examen). Si da algún error de fks, borra todo lo necesario para poder borrar al usuario de karen

BEGIN TRAN

DELETE FROM seguidores WHERE idseguido = (SELECT ID FROM USUARIOS WHERE NICK ='karenmuoz6268')
DELETE FROM seguidores WHERE idseguidoR = (SELECT ID FROM USUARIOS WHERE NICK ='karenmuoz6268')
DELETE FROM LIKES WHERE idusuario = (SELECT ID FROM USUARIOS WHERE NICK ='karenmuoz6268')
DELETE FROM LIKES WHERE idtweet IN (SELECT T.ID FROM tweets T 
INNER JOIN USUARIOS U ON U.ID = T.idusuario
WHERE NICK ='karenmuoz6268')
DELETE FROM TWEETS WHERE idusuario = (SELECT ID FROM USUARIOS WHERE NICK ='karenmuoz6268')
DELETE FROM USUARIOS WHERE NICK ='karenmuoz6268'

ROLLBACK TRAN





--7 todos los telefonos que empiezan por 1- son de USA, arregla la tabla usuario para que todo telefono que empieze por 1- ponga pais USA.

BEGIN trAN
UPDATE USUARIOS SET PAIS='USA' where telefono like '1-%'
ROLLBACK TRAN



--8 modifica todos los tuits que empiecen por a minuscula para que empiecen por A mayuscula.

select mensaje, 'A' + SUBSTRING(mensaje,2,154) from tweets where mensaje like 'a%'
begin TRAN
update tweets set mensaje = 'A' + SUBSTRING(mensaje,2,154) 
from tweets where mensaje like 'a%'

rollback tran