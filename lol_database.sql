USE master
CREATE DATABASE campeones_pvg
use campeones_pvg
CREATE TABLE Campeones(
    ID INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Tipo VARCHAR(100) NOT NULL,
    Diseño INT NOT NULL,    
    Dificultad INT NOT NULL,    
    Tipo_Daño VARCHAR(2) NOT NULL,    
    Daño INT,    
    Tenacidad INT,    
    Control INT,    
    Mobilidad INT,    
    Eficiencia INT ) 

BULK INSERT Campeones FROM '/var/opt/mssql/backup/CSV_LOL.csv' 
  WITH (     
        FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a' )

SELECT * FROM Campeones