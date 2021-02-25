#Harjoitukset osa 5

-- ------------------------------

#Tehtävä 1 (Taulujen luonti)

-- Muodosta SQL-kysely alla esitetyssä kuvassa kuvattujen taulujen muodostamiseen. Tähdellä merkityt kentät ovat pakollisia!

/*
#pelipaikka-taulu täytyy luoda ensin koska pelaajataulussa viitataan pelipaikan pk_pelaajaid
CREATE TABLE PELIPAIKKA
(Pelipaikka CHAR(1) NOT NULL, #tehtävänannossa * tarkoittaa NOT NULL
Nimi VARCHAR(25) NOT NULL,
Lisätiedot TEXT,
CONSTRAINT pk_pelipaikka PRIMARY KEY (Pelipaikka));

CREATE TABLE PELAAJA
(PelaajaID INT NOT NULL,
Etunimi VARCHAR(50) NOT NULL,
Sukunimi VARCHAR(80) NOT NULL,
Email VARCHAR(90),
Puhnro VARCHAR(15),
Pelipaikka CHAR(1) NOT NULL,
CONSTRAINT pk_pelaajaid PRIMARY KEY (PelaajaID),
CONSTRAINT fk_pelipaikka FOREIGN KEY (Pelipaikka)
REFERENCES PELIPAIKKA (Pelipaikka)); #viittaa siis pelipaikka taulun primary key Pelipaikka
*/

#Tehtävä 2 (Taulun tietojen muokkaaminen)

-- Muodosta SQL-kysely, jolla voit kerralla tehdä tehtävän 1 PELAAJA-tauluun seuraavat muutokset:
--    Luo uusi sarake nimeltä Kaupunki (pakollinen sarake, jonka tietotyyppi on varchar(20)).
--    Muokkaa Email-sarakkeen tietotyyppiä siten, että maksimimerkkimäärä pudotetaan 75 merkkiin.
/*
ALTER TABLE PELAAJA
ADD COLUMN Kaupunki VARCHAR(20) NOT NULL, # uusi sarake
MODIFY COLUMN Email VARCHAR(75); # muokataan kolumnia Email
*/

#Tehtävä 3 (Syötteiden tarkistaminen)
-- Luo tarkaste TRIGGER-toiminteella siten, että syötettäessä PELIPAIKKA-taulun Pelipaikka-sarakkeeseen arvoa X, muutetaan arvoksi 0.

DELIMITER $$
CREATE TRIGGER pelipaikka_x BEFORE INSERT ON PELIPAIKKA
FOR EACH ROW 
	BEGIN
		IF NEW.Pelipaikka = 'X'
			THEN SET New.Pelipaikka = '0';
		END IF;
	END $$
