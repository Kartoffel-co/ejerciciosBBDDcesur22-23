USE destiny2

BULK INSERT jugadorDatos
    FROM '/var/opt/mssql/backup/jugadoresDatos.txt' 
    WITH (FORMATFILE = '/var/opt/mssql/backup/myformatfile')

SELECT * FROM jugadorDatos
