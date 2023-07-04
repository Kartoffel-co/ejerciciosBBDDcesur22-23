use ligaPokemon
-- procedure para la inserccion de datos
-- go
-- create or alter PROCEDURE nuevoEntrenador @nombre VARCHAR(300)
-- as 
--     BEGIN
--         INSERT INTO entrenadores(id,nombre) VALUES ((select MAX(id)+1 from entrenadores),@nombre);
--     END
-- 
-- SELECT * from entrenadores
-- EXEC nuevoEntrenador 'Antonio'

SELECT * from equipos

-- procedure para la insertar datos en la tabla equipos
GO
CREATE or ALTER procedure nuevoEquipo @nombre VARCHAR(300) 