use Destiny2

create table jugadorDatos( 
idJugador int PRIMARY KEY not null,
usuario varchar(50) not NULL,
email varchar(50) not NULL,
contrasena varchar(50) not NULL,
clanID int not NULL
)

create table personajes( 
idPersonajes int PRIMARY KEY not null,
idJugador int not null,
raza varchar(50) not NULL,
genero varchar(50) not NULL,
clase varchar(50) not NULL,
poder varchar(50) not NULL,
luz int not NULL,
CONSTRAINT fkidJugador FOREIGN KEY (idJugador) REFERENCES jugadorDatos(idJugador)
)

create table armaduras( 
nombreArmadura VARCHAR(50) PRIMARY KEY not null,
tipoArmadura varchar(50) not NULL,
estadisticas varchar(50) not NULL,
rareza varchar(50) not NULL,
elementos varchar(50) not NULL,
nivel int not NULL,
localizacion varchar(50) not NULL
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