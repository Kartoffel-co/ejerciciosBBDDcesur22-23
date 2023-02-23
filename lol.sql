USE campeones_pvg
SELECT * FROM Campeones
WHERE Nombre = 'Morgana'

BEGIN TRAN
UPDATE Campeones set Tipo_Daño = 'M'
WHERE Tipo like '%warrior%'
ROLLBACK TRAN
