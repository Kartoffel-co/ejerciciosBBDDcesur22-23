-- USE master
-- GO
-- DROP DATABASE IF EXISTS contactos
-- GO
-- CREATE DATABASE contactos
-- GO
USE contactos

-- CREATE TABLE contacts(
--     steam_id int NOT NULL,
--     phone_destination int not null,
--     name_contac VARCHAR(20) not NULL,
-- )

-- insert into  contactos (steam_id,phone_destination,name_contac,number_contac)
-- VALUES (1,604600600,'pablo',4)


INSERT INTO contacts(steam_id,phone_destination,name_contac) VALUES('30','600001002','julito')

SELECT * FROM contacts WHERE steam_id = (@p0)