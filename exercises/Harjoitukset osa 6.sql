#Harjoitukset osa 6

-- ------------------------------

#Tehtävä 1 (Uuden taulun luominen)
-- Luo alla esitetyn kuvion mukainen tietokannan taulu. Lyhennemääritykset: AI = AUTO_INCREMENT, NN = NOT NULL.
/*
CREATE TABLE VARASTO
(TuoteID INT AUTO_INCREMENT NOT NULL,
Nimi VARCHAR(200) NOT NULL,
Kategoria VARCHAR(50) NOT NULL,
Hinta DECIMAL(6,2),
Lisayspvm TIMESTAMP,
CONSTRAINT pk_tuoteid PRIMARY KEY (TuoteID));
*/

#Tehtävä 2 (Tietojen lisääminen tauluun)
-- Lisää tehtävässä 1 luotuun tauluun seuraavat tiedot (muodosta tarvittavat SQL-lausekkeet):
/*
INSERT INTO VARASTO (Nimi, Kategoria, Hinta) VALUES
('Hylly', 'Huonekalut', 200.00),
('Pöytä', 'Huonekalut', 350.00),
('Taulutelevisio', 'Viihde-elektroniikka', 900.00),
('Laavalamppu', 'Valaisimet', 79.90),
('Kattokruunu', 'Valaisimet', 279.90),
('Punottu kori', 'Säilytys', 19.90),
('Laatikosto', 'Säilytys', 49.90);
*/
#SELECT * FROM VARASTO;

#Tehtävä 3 (Tietojen päivittäminen tauluun)
-- Muodosta SQL-lausekkeet seuraavia muokkaustoimia varten aiemmin luodulle datalle:
--    Täydennä tuotteen "Hylly" nimitietoa: "Hylly, mänty (tumma)".
--    Alenna Huonekalut-kategorian tuotteiden hintaa 20 %.
--    Poista hintatieto tuotteelta "Punottu kori".
--    Lisää Valaisimet-kategorian tuotteiden hintaan 10 €.

SET SQL_SAFE_UPDATES=0; #ohitetaan safe-update koska ei käytetä primary key:tä

/*
UPDATE VARASTO
SET Nimi='Hylly, mänty (tumma)'
WHERE Nimi='Hylly';
*/
/*
UPDATE VARASTO
SET Hinta = Hinta * 0.8
WHERE Kategoria='Huonekalut';
*/
/*
UPDATE VARASTO
SET Hinta = NULL
WHERE Nimi='Punottu Kori';
*/
/*
UPDATE VARASTO
SET Hinta = Hinta + 10.0
WHERE Kategoria='Valaisimet';
*/
SELECT * FROM VARASTO;
