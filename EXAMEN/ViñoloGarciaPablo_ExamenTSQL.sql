use laliga_examen
-- ejercicio 1
GO
CREATE or ALTER PROCEDURE presupuestoAnual @id int
AS
    BEGIN
        UPDATE Equipos 
        SET PresupuestoAnual=(
            SELECT SUM(SueldoAnual) FROM Jugadores j
            INNER JOIN Equipos e on e.id = j.idEquipo
            WHERE e.id = @id
        ) 
        WHERE id = @id
    END

    EXEC presupuestoAnual '1';

SELECT * FROM Equipos



-- ejercicio 2
go
CREATE or ALTER FUNCTION dbo.numeroGoles(@id int)
RETURNS int
AS
    BEGIN
        DECLARE @numGoles INT
        DECLARE @idEquipo INT
        
        SET @numGoles = (SELECT SUM(MarcadorLocal) from partidos WHERE idEquipoLocal = @id) + (SELECT SUM(MarcadorVisitante) from partidos WHERE idEquipoVisitante = @id)

        RETURN @numGoles
    END
GO
SELECT dbo.numeroGoles('1')

-- ejercicio 3 
go
CREATE or ALTER FUNCTION dbo.ganadorPartido(@partido int)
RETURNS int
AS
    BEGIN
        DECLARE @idganador INT
        DECLARE @marcadorLocal int = (select Marcadorlocal from Partidos WHERE id = @partido)
        DECLARE @marcadorVisitante int = (select MarcadorVisitante from Partidos WHERE id = @partido)
        if @marcadorLocal > @marcadorVisitante
            BEGIN
                set @idganador = (select idEquipoLocal from Partidos WHERE id = @partido)
            END
        ELSE
            BEGIN
                if @marcadorLocal < @marcadorVisitante
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
        UPDATE Partidos SET idganador = dbo.ganadorPartido(id) WHERE 1 = 1
    END
GO
EXEC ganadorPartidos;