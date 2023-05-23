create database ripsql_vinolo
go
use ripsql_vinolo
go

create table routers(
    id int IDENTITY(1,1) PRIMARY key,
    nombre varchar(100)
)

create table cables(
    id int identity(1,1) PRIMARY key,
    id_router1 INt,
    id_router2 int,
    CONSTRAINT fkr1 FOREIGN KEY (id_router1) REFERENCES routers(id),
    CONSTRAINT fkr2 FOREIGN KEY (id_router2) REFERENCES routers(id),
    )

create table caminos (
    id int identity(1,1) PRIMARY key,
    id_router_origen int,
    id_router_destino int,
    id_cable int,
    saltos int,
    CONSTRAINT fkr3 FOREIGN KEY (id_router_origen) REFERENCES routers(id),
    CONSTRAINT fkr4 FOREIGN KEY (id_router_destino) REFERENCES routers(id),
    CONSTRAINT fkr5 FOREIGN KEY (id_cable) REFERENCES cables(id),

)

--show iproute desde elrouter 1

select id_router_destino,id_cable,saltos 
from caminos where id_router_origen = 1


--rellenar tablas routers y cables.
select * from routers
select * from cables


INSERT into cables (id_router1,id_router2)

SELECT 4,3
--crear metodo para rellenar caminos. 2 fases:
-- primero rellenar caminos adyacentes de cada uno de los routers.
-- luego, mientras haya caminos nuevos, cada router debe preguntar al router de al lado que caminos conoce, 
-- si el num de saltos +1 es mas corto que el que ya tenia, actualiza su camino 

--crea un método que dado un router, te de la tabla de routers a los que sabe llegar. (show routes)