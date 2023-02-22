USE books
-- SELECT * FROM libros

-- --1 
-- SELECT * FROM libros WHERE fecha_publicacion = '03/19/2003'

-- --2
-- SELECT * FROM libros WHERE fecha_publicacion = '03/19/2003' ORDER BY puntuacion_media ASC

-- --3
-- SELECT * FROM libros WHERE autores LIKE '%tolkien%'

-- --4
-- SELECT * FROM libros WHERE idioma = 'spa' AND puntuacion_media > 4

-- --5
-- SELECT COUNT(1) FROM libros WHERE idioma = 'LAT'

-- --6
-- SELECT AVG(puntuacion_media) FROM libros WHERE idioma = 'spa'

-- --7
-- SELECT * FROM libros WHERE fecha_publicacion LIKE '198%'

-- --8
-- SELECT sum(total) FROM pedidos WHERE fecha >= '08/01/2021' and fecha < '09/01/2021'

--9
-- SELECT * FROM Pedidos WHERE cod_postalEntrega LIKE '410%'

--10
SELECT * FROM Pedidos WHERE cod_postalEntrega LIKE '41%'