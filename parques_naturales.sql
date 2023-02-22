USE master
GO
DROP DATABASE IF EXISTS parques_naturales
GO
CREATE DATABASE parques_naturales
GO
USE parques_naturales
GO

-- tabla de las comunidades autonomas
CREATE TABLE ccaa(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    posicion_cardinal VARCHAR(100) NOT NULL,
)

PRINT '-----------------------'
PRINT 'terminado ccaa'
PRINT '-----------------------'

-- tabla del personal
CREATE TABLE personal(
    nss VARCHAR(11) PRIMARY KEY,
    dni VARCHAR(9) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    sueldo DECIMAL(18,2) NOT NULL,
)

PRINT '-----------------------'
PRINT 'terminado personal'
PRINT '-----------------------'

-- Tabla de los parques
CREATE TABLE parque(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_declaracion DATETIME NOT NULL,
    nss VARCHAR(11) NOT NULL,
    CONSTRAINT fkpersonal FOREIGN KEY (nss) REFERENCES personal(nss),
)

PRINT '-----------------------'
PRINT 'terminado parques'
PRINT '-----------------------'

-- Tabla de las areas
CREATE TABLE areas(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    extesion DECIMAL(38,2) NOT NULL,
    id_parque INT NOT NULL,
    CONSTRAINT fkparque FOREIGN KEY (id_parque) REFERENCES parque(id)
)

PRINT '-----------------------'
PRINT 'terminado areas'
PRINT '-----------------------'

-- tabla N:N ccaa_parque
CREATE TABLE ccaa_parque(
    id_ccaa INT PRIMARY KEY,
    id_parque INT NOT NULL,
    CONSTRAINT fkccaa FOREIGN KEY (id_ccaa) REFERENCES ccaa(id),
    CONSTRAINT fkparque_ccaa FOREIGN KEY (id_parque) REFERENCES parque(id)
)

PRINT '-----------------------'
PRINT 'terminado ccaa_parques'
PRINT '-----------------------'

-- tabla de la superclase especies
CREATE TABLE especies(
    nombre_cientifico VARCHAR(100) PRIMARY KEY,
    nombre_vulgar VARCHAR(100) NOT NULL,
    numero_individuos_area INT NOT NULL,
    vegetal BIT NOT NULL,
    animal BIT NOT NULL,
    mineral BIT NOT NULL,
    estado_floracion VARCHAR(50),
    periodo_floracion VARCHAR(50),
    tipo_alimentacion VARCHAR(50),
    periodo_celo VARCHAR(50),
    cristal BIT,
    roca BIT, 
)

PRINT '-----------------------'
PRINT 'terminado especies'
PRINT '-----------------------'

-- tabla N:N areas_especies
CREATE TABLE areas_especies(
    id_area INT PRIMARY KEY,
    CONSTRAINT fkareas FOREIGN KEY (id_area) REFERENCES areas(id),
    nombre_cientifico_especies VARCHAR(100) NOT NULL,
    CONSTRAINT fkespecies FOREIGN KEY (nombre_cientifico_especies) REFERENCES especies(nombre_cientifico)
)

PRINT '-----------------------'
PRINT 'terminado areas_especies'
PRINT '-----------------------'
