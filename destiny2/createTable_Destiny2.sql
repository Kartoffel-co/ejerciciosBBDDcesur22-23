use Destiny2

create table jugadorDatos( 
idJugador int PRIMARY KEY not null,
usuario varchar(50),
email varchar(50),
contrasena varchar(50),
clanID varchar(50)
)
INSERT INTO jugadorDatos (idJugador,usuario,email,contrasena,clanID)
VALUES ()
	, ()

create table personajes( 
idPersonajes int PRIMARY KEY not null,
idJugador int,
raza varchar(50),
genero varchar(50),
clase varchar(50),
poder varchar(50),
luz varchar(50),
CONSTRAINT fkidJugador FOREIGN KEY (idJugador) REFERENCES jugadorDatos(idJugador)
)

create table armaduras( 
nombreArmadura VARCHAR(50) PRIMARY KEY not null,
tipoArmadura varchar(50),
estadisticas varchar(50),
rareza varchar(50),
elementos varchar(50),
nivel varchar(50),
localizacion varchar(50)
)

create table inventario( 
idPersonajes int PRIMARY KEY not null,
armaPrimaria varchar(100),
armaSecundaria varchar(100),
armaTerciaria varchar(100),
casco varchar(50),
guantes varchar(50),
pecho varchar(50),
botas varchar(50),
CONSTRAINT fkPersonajeInventario FOREIGN KEY (idPersonajes) REFERENCES personajes(idPersonajes),
CONSTRAINT fkarmaPrimaria FOREIGN KEY (armaPrimaria) REFERENCES armas(nombreArma),
CONSTRAINT fkarmaSecundaria FOREIGN KEY (armaSecundaria) REFERENCES armas(nombreArma),
CONSTRAINT fkarmaTerciaria FOREIGN KEY (armaTerciaria) REFERENCES armas(nombreArma),
CONSTRAINT fkcasco FOREIGN KEY (casco) REFERENCES armaduras(nombreArmadura),
CONSTRAINT fkguantes FOREIGN KEY (guantes) REFERENCES armaduras(nombreArmadura),
CONSTRAINT fkpecho FOREIGN KEY (pecho) REFERENCES armaduras(nombreArmadura),
CONSTRAINT fkbotas FOREIGN KEY (botas) REFERENCES armaduras(nombreArmadura)
)