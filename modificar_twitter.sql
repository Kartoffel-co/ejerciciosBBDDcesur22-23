use twitter
select * from usuarios
--1 añadete como usuario
INSERT into usuarios (nombre,nick,email,telefono,pais,contrasena)
VALUES ('Pablo Vinolo','Kartoffel','pablo.s322938@cesurformacion.com','666-666-666','Spain','PYI10NFK5VG4PY')
--2 publica un tuit
INSERT into tweets (fecha,idusuario,mensaje)
VALUES (GETDATE(),(select id FROM usuarios WHERE nick='Kartoffel'),'preubapreubapreubapreubapreubapreubapreuba')
--3 modifica el nombre del usuario de todos los usuarios con contraseña repetida por 'CuentaBloqueada'
BEGIN TRAN
    UPDATE usuarios SET nombre='CuentaBloqueada'
    WHERE contrasena in
        (SELECT contrasena FROM usuarios
        GROUP BY contrasena
        HAVING COUNT(1) > 1)
ROLLBACK TRAN

-- BEGIN TRAN
-- DECLARE @cnt INT = 1;
-- WHILE @cnt < 3
--     BEGIN
--         UPDATE usuarios SET nombre='CuentaBloqueada'
--         WHERE contrasena in
--         (SELECT top(@cnt) contrasena FROM usuarios
--         GROUP BY contrasena
--         HAVING COUNT(1) > 1)
--         SET @cnt = @cnt + 1;
--     END;
-- ROLLBACK TRAN

--4 añade al nombre del usuario con mas tuits un * al final del nombre.
BEGIN TRAN
    
ROLLBACK TRAN

--5 cambia todos los emails de google a gugle

--6 borra a karen ( la del examen). Si da algún error de fks, borra todo lo necesario para poder borrar al usuario de karen

--7 todos los telefonos que empiezan por 1- son de USA, arregla la tabla usuario para que todo telefono que empieze por 1- ponga pais USA.

--8 modifica todos los tuits que empiecen por a minuscula para que empiecen por A mayuscula.