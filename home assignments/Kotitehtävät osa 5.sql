#1
-- Luo SALARIES-niminen taulu, johon sijoitetaan sarakkeet
-- salaryID (pääavain, joka yksilöi taulun rivitiedot)
-- empnum (kenen palkasta on kyse, ei saa olla tyhjä arvo)
-- salary (palkan suuruus kahden desimaalin tarkkuudella)
/*
CREATE TABLE SALARIES
(SALARYID INT PRIMARY KEY,
EMPNUM DECIMAL(3,0) NOT NULL, 
SALARY DECIMAL(7,2));
*/
#2
-- Luo viite-eheys SALARIES- ja EMPS-taulujen välille siten, että päivitykset vyörytetään (UPDATE CASCADE) ja poistot estetään (DELETE NO ACTION). 
-- Vihje: Aloita selvittämällä mikä on yhteinen sarake SALARIES- ja EMPS-taulujen osalta.
/*
ALTER TABLE SALARIES
ADD CONSTRAINT fk_empnum FOREIGN KEY (EMPNUM)
REFERENCES EMPS(EMPNUM)
ON UPDATE CASCADE
ON DELETE NO ACTION;
*/

#3
-- Lisää SALARIES-tauluun palkan voimaantuloa varten sarake fromdate, jonka sisällöksi tulee automaattisesti tämä kuluva päivämäärä (voi sisältää myös kellonajan).
/*
ALTER TABLE SALARIES 
ADD COLUMN FROMDATE TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
*/

#4
-- Lisää tauluun rajoitin, joka estää yli 10000 euron palkan lisäämisen tauluun.
/*
DELIMITER $$
CREATE TRIGGER salary_addtest BEFORE INSERT ON SALARIES
FOR EACH ROW
	BEGIN
		IF NEW.SALARIES > 10000.00
			THEN SET NEW.SALARIES = 10000.00;
		END IF;
	END $$

DELIMITER $$
CREATE TRIGGER salary_updatetest BEFORE UPDATE ON SALARIES
FOR EACH ROW
	BEGIN
		IF NEW.SALARIES > 10000.00
			THEN SET NEW.SALARIES = 10000.00;
		END IF;
	END $$
*/

#5
-- Aseta taulun avainsarakkeelle vielä automaattinen laskuri (AUTO_INCREMENT), 
-- jolloin ID-numero käsitellään automaattisesti lisättäessä uutta palkkatietoa tauluun.
/*
ALTER TABLE SALARIES
MODIFY COLUMN SALARYID INT AUTO_INCREMENT;
*/