use heladeriavillar_vinolo


-- ejercicio 1
GO
CREATE or ALTER PROCEDURE add_sabor @sabor VARCHAR(100)
AS
    BEGIN
        insert into sabores
        select @sabor,2.5
    END
GO

EXEC add_sabor piña;
SELECT * FROM sabores

--ejercicio 2