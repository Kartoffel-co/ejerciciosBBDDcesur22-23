USE arepezo
GO
CREATE or ALTER PROCEDURE calcPeso @IdPedido int
AS
    BEGIN
        DECLARE @idMenuPedido as int = 0
        DECLARE @count as int = 1
        DECLARE @total as int = 0
        DECLARE @peso as decimal(18,2) = 0.0000
        DECLARE @pesoTotal as decimal(18,2) = 0.00000
        DECLARE @cantidad as int = 0

        SET @total = (select COUNT(1) FROM PedidosLinea pl WHERE pl.IdPedido = @idPedido)

        WHILE @count < @total
            BEGIN
                set @idMenuPedido  = (select top(@count) IdMenu FROM PedidosLinea pl WHERE pl.IdPedido = @IdPedido)

                set @cantidad = (select * FROM PedidosLinea pl WHERE pl.IdPedido = 1)
                set @peso = (SELECT sum(CantidadEnKg) as pesoPlato FROM Receta WHERE idMenu = @idMenuPedido)
                set @peso = @peso * @cantidad

    
                set @peso = @peso + @peso
                set @count = @count +1
            END
        print @idMenuPedido
        PRINT @peso
        set @pesoTotal = @peso + (@total * 0.05)
        print @pesoTotal
    END
GO

EXEC calcPeso 1;


select * from Ingredientes
SELECT * FROM Menu
SELECT * FROM Receta