

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
DECLARE 

--3 Calcula cuanto es 2 elevado a 24. ( Con un bucle, no me busqueis como se hace la potencia en t-sql....) 

--4 Busca en google como se calcula la potencia en tsql y comprueba el resultado anterior.

--5 Haz un script que me vaya imprimiendo todas las potencias de 3 desde 3 elevado a 1 hasta 3 elevado a 10.

--6.-calcular letra DNI ( (el % sirve para calcular el resto de una división (ejemplo: select 3%2 )))

--7 ¿Cuántos multiplos de 3 hay entre el 1 y el 1000?

--8 ¿es el numero 83 un numero primo? (el % sirve para calcular el resto de una división (ejemplo: select 3%2 ))


--9 La sucesión de Fibonacci se define de la siguiente forma: a1=1, a2=1 y an=an-1+an-2 para n>2, 
--es decir los dos primeros son 1 y el resto cada uno es la suma de los dos anteriores, 
--los primeros son: 1, 1, 2, 3, 5, 8, 13, 21, ... 
--calcular el 100 término de la sucesión.