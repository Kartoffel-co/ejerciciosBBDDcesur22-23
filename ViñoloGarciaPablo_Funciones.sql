use master
--1.-Crea una función para calcular el factorial con sumas en lugar de multiplicaciones.​

        --4 = 4+3+2+1 = 10​

        --5 = 5+4+3+2+1=15​
create or alter function dbo.factorial(@num int)
returns bigint
as
begin
    DECLARE @fac as INT = 0
    DECLARE @contador as int = @num

    WHILE @contador => 1
        set @fac = @fac + @contador
        set @contador = @contador - 1
    RETURN @fac
end

select dbo.factorial(4)
--2.-Crea una función para calcular el iva, pasandole el importe y el % de iva.​
create or alter function dbo.iva(@num DECIMAL(18,2),@iva DECIMAL(18,2))
returns DECIMAL(18,2)
as
BEGIN
        DECLARE @total DECIMAL(18,2)
        set @total = @num * (@iva / 100.0)
        return @total
end

SELECT dbo.iva(10,21)
--3.-Crea una función para calcular los gastos de envio del arepazo, si CP empieza por ​

        --410NN -> 3.99 Sevilla ciudad.​

        --41NNN (n es un numero)-> 6.99 es un pueblo de sevilla​

        --Otra cosa numerica -> 9.99​

        --NULL -> Cod postal no valido​


--4.-(usar Arepezo) Crea un parse para los datos del cliente​. La función debe devolver 1 si es valido y 0 si no es valido.
    --A esta función le pasaremos el id del cliente y nos validará las siguientes cosas:

        --CP valido​ ( para españa, 5 digitos numericos y los dos primeros menores deben estar en la tabla correos)

        --Email valido​ ( contiene una arroba y detras de la arroba tiene . punto y minimo 2 letras.)
go
create or alter function dbo.validaremail(@idc as int)
returns bit
as
begin
declare @res as BIT
declare @email as varchar(100)= (select email from clientes where id=@idc)

if @email like '%@%%.%%'
        set @res=1
ELSE
        set @res =0

return @res
end
go
        --DNI con letra correcta.​ (añadir el campos dni a la tabla clientes)
create or alter function dbo.validardni(@idc as int)
returns bit
as
begin
declare @res as BIT
declare @dni as varchar(100)= (select dni from clientes where id=@idc)
declare @numdni as bigint = SUBSTRING(@dni,1,8)
declare @letra as varchar(1) = SUBSTRING(@dni,9,1)

declare @letracalculada as varchar(1) --calculo la letra del dni numdni como ya sabemos hacer

IF @letra=@letracalculada
        set @res=1
ELSE
        set @res=1
return @res
end


        --Nombre de almenos 2 letras.​ 
GO
create or alter function dbo.validarnombre(@idc as int)
returns bit
as
begin
declare @res as BIT
declare @nombre as varchar(100)= (select nombre from clientes where id=@idc)

if (len(@nombre)>1)
        set @res=1
else
        set @res=0

return @res
end
go
go


create or alter function validarcliente(@idcliente as int)
returns bit
as
begin
declare @res as int
set @res = dbo.validardni(@idcliente) 
if @res=1
        BEGIN
                set @res = dbo.validaremail(@idcliente) 
                if (@res=1)
                        begin 
                                set @res = dbo.validarnombre(@idcliente) 
                        end
        end
return @res
end
go
   print dbo.validarcliente(1) 

update clientes set dni ='00000001R' where id=1
-- 5.- Crea una función que mirando la tabla correos del arepezo, Nos diga la provincia según el cod postal.
            -- usa esa función para comprobar si la provincia indicada en la tabla clientes está bien.​

--6.- crea una funcion que pasandole la fecha de nacimiento te devuelva la edad de una persona mirando la fecha actual. 
--Ten en cuenta el dia, el mes y el año.




go
    create or alter function dbo.calcularedad(@idcliente as int)
    returns int
    as
    begin
        
declare @fecha as datetime = (select fechanacimiento from clientes where id=@idcliente)
declare @fechahoy as datetime = getdate()

 declare @edad as int = year(@fechahoy)-year(@fecha) 

if month(@fecha)> month(@fechahoy)
    begin
        
        set @edad =@edad-1
    end
    ELSE
    begin
        IF month(@fecha)= month(@fechahoy) AND DAY(@FECHA)> day(@fechahoy)
            set @edad =@edad-1
    END
    --print @edad
        return @EDAD
    end
    go


    PRINT DBO.calcularedad(3)

    select nombre,email,FechaNacimiento,dbo.calcularedad(id) as edad from clientes


select * from clientes

update clientes set edad=dbo.calcularedad(id) where 1=1



------EJERCICIOS CON FUNCIONES QUE DEVUELVEN TABLAS

-- 7.- Crear una función en la bbdd del Arepazo que nos devuelva en una tabla los elementos del
-- menu que no están disponibles cuando se agota un ingrediente que le pasamos como parametro.

--8.- Crear una función en la BBDD del arepazo que nos devuelva los 10 elementos del menu
-- mas solicitados. Indicando en un campo, el numero de veces que se ha pedido.


-------------------------------------------------------------------

--Encriptado CESAR

--9.- Crea dos funciones para Encriptar y Desencriptar un varchar(255) con el algoritmo de Cesar que se explica en el pdf.