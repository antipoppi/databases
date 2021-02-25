#1
-- Lisää tietokantaan kaksi riviä: 
-- henkilölle 10 palkkaa 1000 ja 
-- henkilölle 20 palkkaa 2000. 
-- Laita fromdate-kenttään tämä päivä.
/*
INSERT INTO SALARIES (EMPNUM, SALARY, FROMDATE)
VALUES (10, 1000, NOW()),
(20,2000, NOW());
*/

#2
-- Muuta henkilön 20 palkaksi 2500
/*
UPDATE SALARIES
SET SALARY = 2500,
FROMDATE = NOW() #koska palkaa päivitetään, fromdatenkin voisi päivittää samalla
WHERE EMPNUM = 20;
*/

#3
-- Luo taulu nimeltä PALKKAHISTORIA, jossa on sarakkeet:
-- empnum (3 numeroa, ei desimaaleja, pakollinen)
-- salary (6 numeroa, 2 desimaalia)
-- fromdate (vvvv-kk-pp)
/*
CREATE TABLE PALKKAHISTORIA
(EMPNUM DECIMAL(3,0) NOT NULL,
SALARY DECIMAL(6,2),
FROMDATE DATE);
*/

#4
-- Lisää kaikki SALARIES-taulun rivit PALKKAHISTORIA-tauluun.
/*
INSERT INTO PALKKAHISTORIA
SELECT EMPNUM, SALARY, FROMDATE 
FROM SALARIES;
*/
# FROMDATEn siirtäminen hävitti kellonajan päivämäärästä, 
# koska palkkahistorian sarakkeessa fromdate datatyyppi on eri kuin SALARIES taulussa.
# Tein näin, koska tehtävässä 3 käskettiin laittamaan muotoon (vvvv-kk-pp).
# Muuten olisin laittanut myös datatyypiksi TIMESTAMP.

#5
-- Poista työntekijän 20 tiedot PALKKAHISTORIA-taulusta.
#SET SQL_SAFE_UPDATES=0; #tällä ohitetaan safe update mode, koska primary key:tä ei ole määritelty palkkahistoria-taulussa.
#DELETE FROM PALKKAHISTORIA
#WHERE EMPNUM = 20;