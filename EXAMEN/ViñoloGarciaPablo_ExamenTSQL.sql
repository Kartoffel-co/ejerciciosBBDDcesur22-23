use laliga_examen
-- ejercicio 1
GO
CREATE or ALTER PROCEDURE presupuestoAnual @equipo VARCHAR(200)
AS
    BEGIN
        UPDATE Equipos 
        SET PresupuestoAnual=(
            SELECT SUM(SueldoAnual) FROM Jugadores j
            INNER JOIN Equipos e on e.id = j.idEquipo
            WHERE e.nombre = @equipo
        ) 
        WHERE nombre = @equipo
    END

    EXEC presupuestoAnual 'Sevilla';



-- ejercicio 2
go
CREATE or ALTER FUNCTION dbo.numeroGoles(@equipo VARCHAR(200))
RETURNS int
AS
    BEGIN
        DECLARE @numGoles INT
        DECLARE @idEquipo INT

        set @idEquipo = (select id FROM Equipos WHERE nombre = @equipo)
        
        SET @numGoles = (SELECT SUM(MarcadorLocal) from partidos WHERE idEquipoLocal = @idEquipo) + (SELECT SUM(MarcadorVisitante) from partidos WHERE idEquipoVisitante = @idEquipo)

        RETURN @numGoles
    END
GO
SELECT dbo.numeroGoles('Sevilla')

-- ejercicio 3 
go
CREATE or ALTER FUNCTION dbo.ganadorPartido(@partido int)
RETURNS VARCHAR(200)
AS
    BEGIN
        DECLARE @idganador INT
        if (select Marcadorlocal from Partidos WHERE id = @partido) > (select MarcadorVisitante from Partidos WHERE id = @partido)
            BEGIN
                set @idganador = (select idEquipoLocal from Partidos WHERE id = @partido)
            END
        ELSE
            BEGIN
                if (select Marcadorlocal from Partidos WHERE id = @partido) < (select MarcadorVisitante from Partidos WHERE id = @partido)
                    BEGIN
                        set @idganador = (select idEquipoVisitante from Partidos WHERE id = @partido)
                    END
                ELSE
                    BEGIN
                        SET @idganador = NULL
                    END
            END
        RETURN @idganador
    END
GO
SELECT dbo.ganadorPartido(765)

-- ejercicio 4
go  
CREATE or alter PROCEDURE ganadorPartidos
as 
    BEGIN
        DECLARE @limite int = (SELECT MAX(id) from Partidos)
        DECLARE @contador int = (select MIN(id) from Partidos)
        WHILE @contador <= @limite
            BEGIN
                UPDATE Partidos SET idganador = dbo.ganadorPartido(@contador) WHERE id = @contador
                SET @contador = @contador + 1
            END
    END
GO
EXEC ganadorPartidos;