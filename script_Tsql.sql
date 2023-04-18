

-----SIN NINGUNA BBDD-----------------

--1 Calcula el factorial de 10 con un algoritmo que en lugar de decrementar la variable como hacemos en el ejemplo del PDF, la incremente.
DECLARE @resultado as int = 1
DECLARE @num as int
set @num=1

BEGIN
    WHILE @num <> 10
    BEGIN
        SET @resultado = @resultado * @num
        SET @num = @num+1
    END
    PRINT @resultado
END

--2 Haz un script que imprima la lista de números pares más pequeños de 35. ( un numero por linea en la consola)
DECLARE @count as int = 35
DECLARE @par as int

 BEGIN
    WHILE @count > 0
    BEGIN
        set @par =  @count % 2
        IF @par = 0
        BEGIN
            PRINT @count
            PRINT '---------------'
        END
        set @count = @count - 1
    END
END

--3 Calcula cuanto es 2 elevado a 24. ( Con un bucle, no me busqueis como se hace la potencia en t-sql....)
DECLARE @num as INT = 2
DECLARE @count as INT = 1

WHILE @count <> 24
    BEGIN
    set @num = @num * 2
    set @count = @count +1
    END
    PRINT @num


--4 Busca en google como se calcula la potencia en tsql y comprueba el resultado anterior.
print power(2,24)

--5 Haz un script que me vaya imprimiendo todas las potencias de 3 desde 3 elevado a 1 hasta 3 elevado a 10.
DECLARE @count as int = 1
WHILE @count <> 10
    BEGIN
        PRINT power(3,@count)
        set @count = @count + 1
    END

--6.-calcular letra DNI ( (el % sirve para calcular el resto de una división (ejemplo: select 3%2 )))
DECLARE @resto as int = 0
DECLARE @numDNI as int = 12345678
DECLARE @letraDNI as VARCHAR(1)

SET @resto = (@numDNI % 23) + 1
set @letraDNI = substring('TRWAGMYFPDXBNJZSQVHLCKE',@resto,1)
PRINT cast(@numDNI as VARCHAR(9)) + @letraDNI

--7 ¿Cuántos multiplos de 3 hay entre el 1 y el 1000?
DECLARE @count as int = 1
DECLARE @mult as int

WHILE @count <> 1000
    BEGIN
        set @mult = @count % 3
        IF @mult = 0
            BEGIN
                print @count
            END
        set @count = @count + 1
    END
--8 ¿es el numero 83 un numero primo? (el % sirve para calcular el resto de una división (ejemplo: select 3%2 ))
DECLARE @count as int = 1
DECLARE @num as int
DECLARE @contar as int=0
DECLARE @primo as int = 83


WHILE @count <= @primo
    BEGIN
        set @num = @primo % @count
        -- print @num
        if @num = 0
            BEGIN
                set @contar = @contar + 1
               -- PRINT @contar
            END
        set @count = @count + 1
       
        -- PRINT @contar
        -- print @count
    END
IF @contar = 2
    BEGIN
        PRINT 'es numero primo'
    END
else
    BEGIN
        PRINT 'no es primo'
    END


--9 La sucesión de Fibonacci se define de la siguiente forma: a1=1, a2=1 y an=an-1+an-2 para n>2, 
--es decir los dos primeros son 1 y el resto cada uno es la suma de los dos anteriores, 
--los primeros son: 1, 1, 2, 3, 5, 8, 13, 21, ... 
--calcular el 100 término de la sucesión.
DECLARE @an as bigint = 0
DECLARE @a1 as bigint = 1
DECLARE @a2 as bigint = 1
DECLARE @count as int = 1
WHILE @count < 3
    BEGIN
        PRINT @a1
        --RINT 'a1'
        --print '-------'
        --PRINT @count
        --PRINT 'count'
        --print '-------'
        set @count = @count + 1
        if @count = 3
            BEGIN
                set @an = @a1 + @a2
                set @a2 = @an
            print @an
            --PRINT 'an'
            --PRINT '-------'
            END
    END

WHILE @count > 2 and @count <> 100
    BEGIN
        set @an = @a1 + @a2
        PRINT @an
        set @a1 = @a2
        set @a2 = @an
        set @count = @count + 1
    END