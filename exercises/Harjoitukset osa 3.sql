-- TEHTÄVÄ 1 (Koostefunktiot)

-- Hae rate-arvon keskiarvo osastoilta M-P. 
-- Anna tulosjoukon sarakkeelle nimeksi Keskiarvo.
-- SELECT AVG(RATE) AS Keskiarvo FROM EMPS WHERE DEPT BETWEEN 'M' and 'P';

-- Hae työntekijätaulusta niiden henkilöiden lukumäärä, joiden rate-arvo on välillä 6-8. Anna tulosjoukon sarakkeelle nimeksi Lukumäärä
-- SELECT COUNT(*) AS Lukumäärä FROM EMPS WHERE RATE BETWEEN 6 and 8;

-- Hae rate-arvon maksimi- ja minimiarvot (nimeä tulosjoukon sarakkeet Suurin, Pienin) niiden henkilöiden osalta, jotka asuvat kaupungissa Davis.
-- SELECT MAX(RATE) AS Suurin, MIN(RATE) AS Pienin FROM EMPS WHERE CITY='Davis';

-- Laske osastokohtaisesti kuinka monta yli 10 rate-arvon omaavaa henkilöä työskentelee kullakin osastolla. 
-- Tulosjoukossa tulee mainita osasto ja lukumäärä henkilöistä (sarakenimeksi Lukumäärä). 
-- Lajittele tulosjoukko Lukumäärän mukaan laskevaan järjestykseen.
-- SELECT DEPT, COUNT(*) AS Lukumäärä 
-- FROM EMPS 
-- WHERE RATE > 10 
-- GROUP BY DEPT 
-- ORDER BY Lukumäärä DESC;


-- TEHTÄVÄ 2 (Merkkijonofunktiot)

-- Luo käyttäjätunnukset työntekijöille käyttämällä SUBSTRING-funktiota. 
-- Muodosta käyttäjätunnukset seuraavasti: etunimen kaksi ensimmäistä kirjainta, sukunimen kolme viimeistä kirjainta ja puhelinnumeron kolme ensimmäistä numeroa. 
-- Anna tulosjoukon sarakkeelle nimeksi "Käyttäjätunnus".
#SELECT GNAME, SURNAME, PHONE, CONCAT(SUBSTRING(EMPS.GNAME, 1, 2), RIGHT(EMPS.SURNAME, 3), SUBSTRING(EMPS.PHONE, 1, 3)) AS Käyttäjätunnus FROM EMPS;

-- Hae erilaisten kaupunkien nimet siten, että tulosjoukossa kaupunkien nimet esitetään pienillä kirjaimilla. 
-- Anna tulosjoukon nimeksi "Paikat". Järjestä hakutulokset kaupungin nimen mukaan nousevaan järjestykseen.
-- SELECT DISTINCT LOWER(CITY) AS Paikat 
-- FROM EMPS
-- ORDER BY Paikat

-- Hae työntekijöiden etunimi, sukunimi ja sukunimen pituus (tulosjoukon sarakkeen nimeksi sukunimi_pituus). 
-- Näytä hakutuloksissa vain ne henkilöt, joiden sukunimen pituus on suurempi kuin kuusi merkkiä.
-- SELECT GNAME, SURNAME, LENGTH(SURNAME) AS sukunimi_pituus 
-- FROM EMPS 
-- WHERE LENGTH(SURNAME) > 6;


-- TEHTÄVÄ 3 (Muut funktiot)

-- Tee luokittelu osastojen budjeteille siten, että alle 100000 dollarin budjetit ilmaistaan merkinnällä alhainen ja 100000 dollaria suuremmat budjetit merkinnällä korkea.
-- Tulosjoukkoon merkitään sarakkeet dept, duty, budget sekä luokittelun sisältävä sarake "budjettiluokittelu".
-- KTS ESIMERKKI

-- SELECT DEPT, DUTY, BUDGET,
-- 	CASE
-- 		WHEN BUDGET < 100000 THEN 'alhainen'
--      WHEN BUDGET > 100000 THEN 'korkea'
-- 	END AS budjettiluokittelu
-- FROM DEPT

-- Laske rate-arvojen keskiarvot kaupunkikohtaisesti (ryhmittely kaupungin mukaan) siten, 
-- että hakutuloksissa ilmoitetaan kaupunki ja rate-arvon keskiarvo. 
-- Tee tulosjoukkoon lajittelu rate-arvon mukaan laskevaan järjestykseen.
-- SELECT DISTINCT CITY, RATE
-- FROM EMPS
#KESKEN
