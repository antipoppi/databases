-- -----------------------------------------------------
-- Table TUOTE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS TUOTE 
 (TUOTEID INT NOT NULL AUTO_INCREMENT,
  AUTOMERKKI VARCHAR(45),
  OSARYHMÄ VARCHAR(45),
  OSA VARCHAR(45) NOT NULL,
  MASSA INT,
  HINTA DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (TUOTEID));

-- -----------------------------------------------------
-- Table OSTOTAPAHTUMA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS OSTOTAPAHTUMA
 (OSTOID INT NOT NULL AUTO_INCREMENT,
  TUOTEID INT NOT NULL,
  MÄÄRÄ INT NOT NULL,
  YHTEENSÄ DECIMAL(10,2) DEFAULT NULL,
  AIKALEIMA TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (OSTOID),
  CONSTRAINT fk_Ostotapahtuma_tuoteID
    FOREIGN KEY (TUOTEID)
    REFERENCES TUOTE (TUOTEID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table MYYNTITAPAHTUMA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS MYYNTITAPAHTUMA 
 (MYYNTIID INT NOT NULL AUTO_INCREMENT,
  TUOTEID INT NOT NULL,
  MÄÄRÄ INT,
  YHTEENSÄ DECIMAL(10,2) DEFAULT NULL,
  AIKALEIMA TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (MYYNTIID),
  CONSTRAINT fk_Myyntitapahtuma_tuoteID
    FOREIGN KEY (TUOTEID)
    REFERENCES TUOTE (TUOTEID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table VARASTO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS VARASTO 
 (VARASTOID INT NOT NULL AUTO_INCREMENT,
  TUOTEID INT,
  OSTOID INT,
  MYYNTIID INT,
  VARASTOSSA_KPL INT NOT NULL DEFAULT 0,
  PRIMARY KEY (VARASTOID),
  CONSTRAINT fk_varasto_tuote
    FOREIGN KEY (TUOTEID)
    REFERENCES TUOTE (TUOTEID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_varasto_Ostotapahtuma1
    FOREIGN KEY (OSTOID)
    REFERENCES OSTOTAPAHTUMA (OSTOID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT fk_varasto_Myyntitapahtuma1
    FOREIGN KEY (MYYNTIID)
    REFERENCES MYYNTITAPAHTUMA (MYYNTIID)
    ON DELETE SET NULL
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- TIETOJEN LISÄÄMINEN TUOTE-TAULUUN
-- -----------------------------------------------------
INSERT INTO TUOTE (AUTOMERKKI, OSARYHMÄ, OSA, MASSA, HINTA) VALUES
('Mercedes Benz','sähkölaitteet','laturi',8000,150.00),
('Mercedes Benz','sähkölaitteet','solenoidi',400,99.00),
('Mercedes Benz','sähkölaitteet','vilkkurele',228,78.00),
('Mercedes Benz','voimansiirto','tasauspyörästön kotelo',35000,540.00),
('Mercedes Benz','voimansiirto','kytkinsarja',17000,1130.00),
('Mercedes Benz','voimansiirto','kytkinlevy',4000,326.00),
('Mercedes Benz','voimansiirto','korjaussarja',1230,49.00),
('Mercedes Benz','moottori','venttiilin jousi',106,12.40),
('Mercedes Benz','moottori','turboahdin',3107,1510.00),
('Mercedes Benz','moottori','jäähdytin',17400,1310.00),
('Mercedes Benz','moottori','kiilahihna',315,22.00),
('Mercedes Benz','moottori','hihnankiristin',352,19.00),
('Mercedes Benz','moottori','nokka-akseli',7050,1700.00),
('Mercedes Benz','moottori','kampiakseli',22000,2690.00),
('Mercedes Benz','moottori','kiertokanki',752,90.00),
('Mercedes Benz','moottori','männänrengas',78,9.00),
('Mercedes Benz','jarrut','jarrupala',200,34.90),
('Mercedes Benz','jarrut','jarrusylinteri',268,117.00),
('Mercedes Benz','jarrut','jarrulevy',8400,214.70),
('Mercedes Benz','jarrut','jarruletku',0,7.00),
('Mercedes Benz','ohjaamo','istuinsuoja',0,99.00),
('Mercedes Benz','ohjaamo','mattosarja',0,105.00),
('Mercedes Benz','jousitus','lehtijousi',30000,469.00),
('Volvo','voimansiirto','tasauspyörästön kotelo',35000,570.00),
('Volvo','voimansiirto','kytkinsarja',17000,999.00),
('Volvo','voimansiirto','kytkinlevy',4000,326.00),
('Volvo','moottori','venttiilin jousi',106,12.40),
('Volvo','moottori','turboahdin',3107,1705.00),
('Volvo','moottori','jäähdytin',18030,1310.00),
('Volvo','moottori','kiilahihna',315,22.00),
('Volvo','moottori','hihnankiristin',352,19.00),
('Volvo','moottori','nokka-akseli',7050,1690.00),
('Volvo','moottori','männänrengas',78,9.00),
('Volvo','jarrut','jarrupala',200,44.90),
('Volvo','jarrut','jarrusylinteri',268,129.00),
('Volvo','jarrut','jarrulevy',8400,214.70),
('Volvo','jarrut','jarruletku',0,7.00),
('Volvo','sähkölaitteet','laturi',8000,150.00),
('Volvo','sähkölaitteet','solenoidi',400,99.00),
('Volvo','sähkölaitteet','vilkkurele',228,78.00),
('Volvo','ohjaamo','istuinsuoja',0,99.00),
('Volvo','ohjaamo','mattosarja',0,105.00),
('Volvo','jousitus','lehtijousi',30000,700.00),
('Scania','jousitus','lehtijousi',30000,749.00),
('Scania','sähkölaitteet','solenoidi',400,99.00),
('Scania','sähkölaitteet','vilkkurele',228,78.00),
('Scania','voimansiirto','tasauspyörästön kotelo',35000,540.00),
('Scania','voimansiirto','kytkinlevy',4000,326.00),
('Scania','voimansiirto','korjaussarja',1230,49.00),
('Scania','moottori','turboahdin',3107,1510.00),
('Scania','moottori','kiilahihna',315,22.00),
('Scania','moottori','nokka-akseli',7050,1700.00),
('Scania','moottori','kampiakseli',22000,1990.00),
('Scania','moottori','kiertokanki',752,90.00),
('Scania','jarrut','jarrupala',200,44.00),
('Scania','jarrut','jarrusylinteri',268,117.00),
('Scania','jarrut','jarrulevy',8400,214.70),
('Scania','jarrut','jarruletku',0,7.00),
('Scania','ohjaamo','istuinsuoja',0,99.00),
('Scania','ohjaamo','mattosarja',0,98.00),
('Sisu','sähkölaitteet','laturi',8000,150.00),
('Sisu','sähkölaitteet','solenoidi',400,99.00),
('Sisu','sähkölaitteet','vilkkurele',228,78.00),
('Sisu','voimansiirto','kytkinsarja',17000,1200.00),
('Sisu','voimansiirto','kytkinlevy',4000,326.00),
('Sisu','voimansiirto','korjaussarja',1230,49.00),
('Sisu','moottori','venttiilin jousi',106,12.40),
('Sisu','moottori','turboahdin',3107,1510.00),
('Sisu','moottori','jäähdytin',17400,1310.00),
('Sisu','moottori','kiilahihna',315,22.00),
('Sisu','moottori','hihnankiristin',352,19.00),
('Sisu','moottori','kampiakseli',22000,2399.00),
('Sisu','moottori','kiertokanki',752,87.00),
('Sisu','moottori','männänrengas',78,7.00),
('Sisu','jarrut','jarrupala',200,34.90),
('Sisu','jarrut','jarrulevy',8400,214.70),
('Sisu','jarrut','jarruletku',0,7.00),
('Sisu','ohjaamo','istuinsuoja',0,99.00),
('Sisu','ohjaamo','mattosarja',4000,100.00),
('MAN','sähkölaitteet','laturi',8000,133.00),
('MAN','sähkölaitteet','solenoidi',400,89.00),
('MAN','moottori','venttiilin jousi',106,14.00),
('MAN','moottori','jäähdytin',17400,1060.00),
('MAN','moottori','kiilahihna',315,22.00),
('MAN','moottori','hihnankiristin',352,19.00),
('MAN','moottori','nokka-akseli',7050,2008.00),
('MAN','moottori','kiertokanki',752,90.00),
('MAN','moottori','männänrengas',78,12.00),
('MAN','jarrut','jarrupala',200,34.90),
('MAN','jarrut','jarrusylinteri',268,107.00),
('MAN','jarrut','jarrulevy',8400,220.00),
('MAN','jarrut','jarruletku',0,7.00),
('MAN','ohjaamo','istuinsuoja',0,87.00),
('MAN','jousitus','lehtijousi',30000,695.00),
('MAN','voimansiirto','tasauspyörästön kotelo',35000,740.00),
('MAN','voimansiirto','kytkinsarja',17000,1100.00),
('MAN','voimansiirto','kytkinlevy',4000,401.00),
('MAN','voimansiirto','korjaussarja',1230,122.00);

-- -----------------------------------------------------
-- TIETOJEN LISÄÄMINEN VARASTO-TAULUUN
-- -----------------------------------------------------
INSERT INTO VARASTO (TUOTEID, VARASTOSSA_KPL) VALUES
(1,5),
(2,8),
(3,7),
(4,3),
(5,9),
(6,10),
(7,5),
(8,6),
(9,8),
(10,2),
(11,3),
(12,5),
(13,8),
(14,7),
(15,3),
(16,9),
(17,10),
(18,5),
(19,6),
(20,8),
(21,2),
(22,3),
(23,5),
(24,8),
(25,7),
(26,3),
(27,9),
(28,10),
(29,5),
(30,6),
(31,8),
(32,2),
(33,3),
(34,5),
(35,8),
(36,7),
(37,3),
(38,9),
(39,10),
(40,5),
(41,6),
(42,8),
(43,2),
(44,3),
(45,5),
(46,8),
(47,7),
(48,3),
(49,9),
(50,10),
(51,5),
(52,6),
(53,8),
(54,2),
(55,3),
(56,5),
(57,8),
(58,7),
(59,3),
(60,9),
(61,10),
(62,5),
(63,6),
(64,8),
(65,2),
(66,3),
(67,5),
(68,8),
(69,7),
(70,3),
(71,9),
(72,10),
(73,5),
(74,6),
(75,8),
(76,2),
(77,3),
(78,5),
(79,8),
(80,7),
(81,3),
(82,9),
(83,10),
(84,5),
(85,6),
(86,8),
(87,2),
(88,3),
(89,5),
(90,8),
(91,7),
(92,3),
(93,9),
(94,10),
(95,5),
(96,6),
(97,8),
(98,2);


-- -----------------------------------------------------
--  OSTOTAPAHTUMIEN TRIGGERIEN LISÄÄMINEN
-- -----------------------------------------------------

-- Tämä Ostotapahtuma-triggeri päivittää yhteensä-sarakkeen kun uusi ostotapahtuma tehdään
DELIMITER $$
CREATE TRIGGER päivitä_Yhteensä
BEFORE INSERT ON OSTOTAPAHTUMA FOR EACH ROW
	BEGIN
		#päivittää yhteensä summan
		SET @OSTOHINTA = (SELECT HINTA FROM TUOTE WHERE TUOTE.TUOTEID = NEW.TUOTEID);
		SET NEW.YHTEENSÄ = NEW.MÄÄRÄ * @OSTOHINTA;
	END
$$
DELIMITER ;

-- Tämä Ostotapahtuma-triggeri aktivoituu kun uusi ostotapahtuma lisätään ja se päivittää ostetun tuotteen varastomäärän
DELIMITER $$
CREATE TRIGGER päivitä_varasto_ja_yhteensä
AFTER INSERT ON OSTOTAPAHTUMA FOR EACH ROW
	BEGIN
		#päivittää varastomäärän
		SET @HOLD = (SELECT VARASTO.VARASTOSSA_KPL FROM VARASTO WHERE VARASTO.TUOTEID = NEW.TUOTEID);
		UPDATE VARASTO
		SET VARASTO.VARASTOSSA_KPL = @HOLD + NEW.MÄÄRÄ
		WHERE VARASTO.TUOTEID = NEW.TUOTEID;
		UPDATE VARASTO
		SET VARASTO.OSTOID = NEW.OSTOID
		WHERE VARASTO.TUOTEID = NEW.TUOTEID;
	END
$$
DELIMITER ;

-- Tämä Ostotapahtuma-triggeri aktivoituu kun ostotapahtumaa päivitetään. 
-- Tarkistaa että ostoid:tä ei ole muutettu.
-- Tarkistaa että yhteensä summaa ei ole käsin muutettu
-- Päivittää yhteensä-sarakkeen
-- Se päivittää ostetun tuotteen ostoid:n aikaleiman sekä kyseisen tuotteen varaston kappalemäärän.
-- Samalla tarkistaa, jos kyseisen ostoid:n tuoteid on muutettu ja päivittää varastossa kappalemäärät oikein
-- (poistaa vanhalta tuoteid:ltä kyseisen vanhan määrän ja lisää uudelle tuoteid:lle kyseisen uuden määrän)
DELIMITER $$
CREATE TRIGGER päivitä_varasto_päivitä_osto
BEFORE UPDATE ON OSTOTAPAHTUMA FOR EACH ROW
	BEGIN
		#Ostoid:tä ei voi muuttaa
		IF OLD.OSTOID != NEW.OSTOID
			THEN CALL RAISE_ERROR; #labranetin vanhassa mysql-versiossa ei toimi signal sqlstat '45000' set message_text = 'Oma error-viesti';
		END IF;
		#Yhteensäsummaa ei voi muuttaa
		IF OLD.YHTEENSÄ != NEW.YHTEENSÄ
			THEN CALL RAISE_ERROR;
		END IF;
		#päivittää yhteensä summan
		SET @OSTOHINTA = (SELECT HINTA FROM TUOTE WHERE TUOTE.TUOTEID = NEW.TUOTEID);
		SET NEW.YHTEENSÄ = NEW.MÄÄRÄ * @OSTOHINTA;
		#Päivittää aikaleiman
		SET NEW.AIKALEIMA = NOW();
		#Päivittää varastomäärän
		SET @HOLD = (SELECT VARASTO.VARASTOSSA_KPL FROM VARASTO WHERE VARASTO.TUOTEID = NEW.TUOTEID);
		SET @MUUTOS = (@HOLD - OLD.MÄÄRÄ) + NEW.MÄÄRÄ;
		IF OLD.TUOTEID = NEW.TUOTEID THEN
			UPDATE VARASTO
			SET VARASTO.VARASTOSSA_KPL = @MUUTOS
			WHERE VARASTO.TUOTEID = NEW.TUOTEID;
		ELSE
			#päivitettää vanhan tuoteid:n varastosaldon kohdilleen ja kyseisen rivin ostoid:n nullille
			SET @HOLD2 = (SELECT VARASTO.VARASTOSSA_KPL FROM VARASTO WHERE VARASTO.TUOTEID = OLD.TUOTEID);
			UPDATE VARASTO
			SET OSTOID = NULL
			WHERE TUOTEID = OLD.TUOTEID;
			UPDATE VARASTO
			SET VARASTO.VARASTOSSA_KPL = @HOLD2 - OLD.MÄÄRÄ
			WHERE VARASTO.TUOTEID = OLD.TUOTEID;
			#tämän jälkeen päivitetään oikean rivin varastomäärä oikeaksi
			UPDATE VARASTO
			SET VARASTO.VARASTOSSA_KPL = @HOLD + NEW.MÄÄRÄ
			WHERE VARASTO.TUOTEID = NEW.TUOTEID;
			UPDATE VARASTO
			SET VARASTO.OSTOID = NEW.OSTOID
			WHERE VARASTO.TUOTEID = NEW.TUOTEID;
		END IF;
	END
$$
DELIMITER ;

-- Tämä Ostotapahtuma-triggeri aktivoituu kun ostotapahtuma poistetaan. 
-- Se päivittää varaston kappalemäärän oikeaksi ja poistaa varasto-taulun kyseisen ostoid:n
DELIMITER $$
CREATE TRIGGER päivitä_varasto_poista_osto
BEFORE DELETE ON OSTOTAPAHTUMA FOR EACH ROW
	BEGIN
		SET @HOLD = (SELECT VARASTO.VARASTOSSA_KPL FROM VARASTO WHERE VARASTO.TUOTEID = OLD.TUOTEID);
		UPDATE VARASTO
		SET VARASTO.VARASTOSSA_KPL = @HOLD - OLD.MÄÄRÄ
		WHERE VARASTO.TUOTEID = OLD.TUOTEID;
	END
$$
DELIMITER ;

-- -----------------------------------------------------
--  MYYNTITAPAHTUMIEN TRIGGERIEN LISÄÄMINEN
-- -----------------------------------------------------

-- Tämä Myyntitapahtuma-triggeri tarkistaa ennen myyntiä että varasto saldo on suurempi/yhtä suuri kuin myytävä määrä
-- Ja estää myyntitapahtuman
DELIMITER $$
CREATE TRIGGER tarkista_varastomäärä_ennen_myyntiä
BEFORE INSERT ON MYYNTITAPAHTUMA FOR EACH ROW
	BEGIN
		#Varaston saldon tarkistus
		SET @HOLD = (SELECT VARASTO.VARASTOSSA_KPL FROM VARASTO WHERE VARASTO.TUOTEID = NEW.TUOTEID);
			IF NEW.MÄÄRÄ > @HOLD
		THEN CALL RAISE_ERROR;
		END IF;
		#Päivittää yhteensäsumman
		SET @OSTOHINTA = (SELECT HINTA FROM TUOTE WHERE TUOTE.TUOTEID = NEW.TUOTEID);
		SET NEW.YHTEENSÄ = NEW.MÄÄRÄ * @OSTOHINTA;
	END
$$
DELIMITER ;

-- Tämä Myyntitapahtuma-triggeri aktivoituu kun uusi myyntitapahtuma lisätään ja se päivittää myydyn tuotteen varastomäärän
-- sekä yhteensä-summan
DELIMITER $$
CREATE TRIGGER päivitä_varasto_uusi_myynti
AFTER INSERT ON MYYNTITAPAHTUMA FOR EACH ROW
	BEGIN
		#Päivittää varastomäärän
		SET @HOLD = (SELECT VARASTO.VARASTOSSA_KPL FROM VARASTO WHERE VARASTO.TUOTEID = NEW.TUOTEID);
		UPDATE VARASTO
		SET VARASTO.VARASTOSSA_KPL = @HOLD - NEW.MÄÄRÄ
		WHERE VARASTO.TUOTEID = NEW.TUOTEID;
		UPDATE VARASTO
		SET VARASTO.MYYNTIID = NEW.MYYNTIID
		WHERE VARASTO.TUOTEID = NEW.TUOTEID;
	END
$$
DELIMITER ;

-- Tämä Myyntitapahtuma-triggeri aktivoituu kun myyntitapahtumaa päivitetään. 
-- Ensin tarkistaa, että myynti-id:tä ja 'yhteensä' ei yritetä muuttaa
-- Sitten tarkistaa, että varastomäärä varmasti riittää myytäväksi kyseisellä tuoteid:llä
-- Onnistuessaan se päivittää myös myydyn tuotteen myyntiID:n aikaleiman sekä kyseisen tuotteen varaston kappalemäärän
DELIMITER $$
CREATE TRIGGER päivitä_varasto_päivitä_myynti
BEFORE UPDATE ON MYYNTITAPAHTUMA FOR EACH ROW
	BEGIN
		#Myynti-id:tä ei voi muuttaa
		IF OLD.MYYNTIID != NEW.MYYNTIID
			THEN CALL RAISE_ERROR; #labranetin vanhassa mysql-versiossa ei toimi signal sqlstat '45000' set message_text = 'Oma error-viesti';
		END IF;
		#Yhteensä ei voi muuttaa
		IF OLD.YHTEENSÄ != NEW.YHTEENSÄ
			THEN CALL RAISE_ERROR;
		END IF;
		#Varastomäärän tarkistus, että riittää
		SET @HOLD = (SELECT VARASTO.VARASTOSSA_KPL FROM VARASTO WHERE VARASTO.TUOTEID = NEW.TUOTEID);
		IF NEW.MÄÄRÄ > @HOLD
			THEN CALL RAISE_ERROR; 
		END IF;
		#päivittää yhteensä summan
		SET @MYYNTIHINTA = (SELECT HINTA FROM TUOTE WHERE TUOTE.TUOTEID = NEW.TUOTEID);
		IF NEW.MÄÄRÄ != OLD.MÄÄRÄ
			THEN SET NEW.YHTEENSÄ = NEW.MÄÄRÄ * @MYYNTIHINTA;
		END IF;
		#Päivittää aikaleiman
		SET NEW.AIKALEIMA = NOW();
		#Päivittää varaston
		SET @MUUTOS = (@HOLD + OLD.MÄÄRÄ) - NEW.MÄÄRÄ;
		IF OLD.TUOTEID = NEW.TUOTEID THEN
			UPDATE VARASTO
			SET VARASTO.VARASTOSSA_KPL = @MUUTOS
			WHERE VARASTO.TUOTEID = NEW.TUOTEID;
		ELSE
			#päivitettää vanhan tuoteid:n varastosaldon kohdilleen ja kyseisen rivin ostoid:n nullille
			#SET @HOLD2 = (SELECT VARASTO.VARASTOSSA_KPL FROM VARASTO WHERE VARASTO.TUOTEID = OLD.TUOTEID);
			UPDATE VARASTO
			SET MYYNTIID = NULL
			WHERE TUOTEID = OLD.TUOTEID;
			UPDATE VARASTO
			SET VARASTO.VARASTOSSA_KPL = @HOLD2 + OLD.MÄÄRÄ
			WHERE VARASTO.TUOTEID = OLD.TUOTEID;
			#tämän jälkeen päivitetään oikean rivin varastomäärä oikeaksi
			UPDATE VARASTO
			SET VARASTO.VARASTOSSA_KPL = @HOLD - NEW.MÄÄRÄ
			WHERE VARASTO.TUOTEID = NEW.TUOTEID;
			UPDATE VARASTO
			SET VARASTO.MYYNTIID = NEW.MYYNTIID
			WHERE VARASTO.TUOTEID = NEW.TUOTEID;
		END IF;
	END
$$
DELIMITER ;

-- Tämä Myyntitapahtuma-triggeri aktivoituu kun myyntitapahtuma poistetaan. 
-- Se päivittää varaston kappalemäärän oikeaksi
DELIMITER $$
CREATE TRIGGER päivitä_varasto_poista_myynti
BEFORE DELETE ON MYYNTITAPAHTUMA FOR EACH ROW
	BEGIN
		SET @HOLD = (SELECT VARASTO.VARASTOSSA_KPL FROM VARASTO WHERE VARASTO.TUOTEID = OLD.TUOTEID);
		UPDATE VARASTO
		SET VARASTO.VARASTOSSA_KPL = @HOLD + OLD.MÄÄRÄ
		WHERE VARASTO.TUOTEID = OLD.TUOTEID;
	END
$$
DELIMITER ;

-- -----------------------------------------------------
--  TUOTETAULUN TRIGGERIEN LISÄÄMINEN
-- -----------------------------------------------------

-- Tämä tuotetaulun triggeri estää päivittämästä tuoteid:tä tuotetaulussa
DELIMITER $$
CREATE TRIGGER estä_tuoteid_päivitys
BEFORE UPDATE ON TUOTE FOR EACH ROW
	BEGIN
		IF OLD.TUOTEID != NEW.TUOTEID
			THEN CALL RAISE_ERROR; #labranetin vanhassa mysql-versiossa ei toimi signal sqlstate '45000' set message_text = 'Oma error-viesti';
		END IF;
	END
$$
DELIMITER ;

-- Tämä tuotetaulun triggeri estää poistamasta koko tuoteid riviä jos varastossa on kyseisellä tuotteella määrä yli 0kpl;
DELIMITER $$
CREATE TRIGGER estä_tuoteid_poisto
BEFORE DELETE ON TUOTE FOR EACH ROW
	BEGIN
		SET @HOLD = (SELECT VARASTO.VARASTOSSA_KPL FROM VARASTO WHERE OLD.TUOTEID = VARASTO.TUOTEID);
		IF @HOLD > 0
			THEN CALL RAISE_ERROR;
		END IF;
	END
$$
DELIMITER ;
