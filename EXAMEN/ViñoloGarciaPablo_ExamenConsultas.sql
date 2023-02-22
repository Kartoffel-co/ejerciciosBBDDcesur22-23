-- Examen base de datos consultas Pablo Viñolo 15/02/2023
-- pregunta 1
use twitter
SELECT nick,email FROM usuarios
ORDER BY nick,email ASC

-- pregunta 2
use twitter
SELECT COUNT(1) as numeroSeguidores, nombre FROM usuarios u
INNER JOIN seguidores s on s.idseguido = u.id
GROUP by nombre
ORDER BY numeroSeguidores DESC

-- pregunta 3
use twitter
SELECT TOP(1) id,fecha,mensaje,COUNT(1) as numeroLikes FROM tweets t
INNER JOIN likes l on l.idtweet = t.id
GROUP BY id,fecha,mensaje
ORDER BY numeroLikes DESC

-- pregunta 4
USE twitter
SELECT contrasena,COUNT(1) as contraseñaRepetidas FROM usuarios
GROUP BY contrasena
HAVING COUNT(1) > 1

-- pregunta 5
use twitter
SELECT top(19) u.id,COUNT(1) as numeroTweets FROM usuarios u
INNER JOIN tweets t on t.idusuario = u.id
GROUP BY u.id
ORDER BY COUNT(1) DESC

-- pregunta 6
use twitter
SELECT * FROM usuarios u
LEFT JOIN tweets t on t.idusuario = u.id
WHERE t.id is NULL

-- pregunta 7
use twitter
SELECT COUNT(1)*2 as centimos FROM tweets t
INNER JOIN likes l on l.idtweet = t.id
INNER JOIN usuarios u on u.id = t.idusuario
WHERE nick = 'karenmuoz6268' and YEAR(fecha_like) = 2008

-- pregunta 8
use twitter
SELECT u.id,u.nombre,COUNT(1) as numeroTweets FROM usuarios u
INNER JOIN tweets t on t.idusuario = u.id
GROUP BY u.id,u.nombre
HAVING COUNT(1) > 15
ORDER BY COUNT(1) DESC

-- pregunta 9
use twitter
SELECT t.fecha,t.mensaje,t.idusuario FROM usuarios u
INNER JOIN seguidores s on s.idseguidor = u.id
INNER JOIN tweets t on t.idusuario = s.idseguidor
WHERE idseguido = (SELECT id FROM usuarios WHERE nick = 'karenmuoz6268')
-- WHERE nick='karenmuoz6268'
ORDER BY fecha DESC

-- pregunta 10
USE twitter
SELECT TOP(1) COUNT(1) numeroTweets,MONTH(fecha) mes FROM tweets
WHERE YEAR(fecha) = 2009
GROUP BY MONTH(fecha)
ORDER BY numeroTweets DESC

-- pregunta 11
use twitter
SELECT u.nick,COUNT(1) as seguidores,seguidos.seguidos FROM usuarios u
INNER JOIN seguidores s on s.idseguido = u.id
INNER JOIN (
    SELECT nick,COUNT(1) as seguidos FROM usuarios u
    INNER JOIN seguidores s on s.idseguidor = u.id
    GROUP by u.nick
) seguidos on seguidos.nick = u.nick 
GROUP by u.nick,seguidos.seguidos

select nombre, sum(seguidores) as seguidores, sum(seguidos) as seguidos from (
  
  select nombre, count(1) as seguidores,0  as seguidos from usuarios u
  inner join seguidores s on u.id = s.idseguido
  group by u.id,u.nombre
  
  union all 

  select nombre, 0, count(1) as seguidos from usuarios u
  inner join seguidores s on u.id = s.idseguidor
  group by u.id,u.nombre

) as t1
group by nombre