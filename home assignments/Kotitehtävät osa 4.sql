#1. 
-- Hae osaston A työntekijät formaatissa "SUKUNIMI A" (sukunimi ja etunimen ensimmäinen kirjain).
-- Lajittele hakutulokset sukunimen mukaan.
-- Ota listaukseen mukaan osaston tehtävä (Duty). 
-- Hae tulokset käyttäen molempia seuraavista:
-- - Uusi liitossyntaksi
-- - Vanha liitossyntaksi

#uusi liitossyntaksi
/*
SELECT CONCAT(EMPS.SURNAME, ' ', SUBSTRING(EMPS.GNAME, 1, 1)) AS TYÖNTEKIJÄ, DUTY
FROM EMPS INNER JOIN DEPT
ON EMPS.DEPT = DEPT.DEPT
WHERE EMPS.DEPT='A'
ORDER BY 1;
*/

#vanha liitossyntaksi
/*
SELECT CONCAT(EMPS.SURNAME, ' ', SUBSTRING(EMPS.GNAME, 1, 1)) AS TYÖNTEKIJÄ, DUTY
FROM EMPS, DEPT
WHERE EMPS.DEPT='A'
GROUP BY TYÖNTEKIJÄ
ORDER BY TYÖNTEKIJÄ;
*/

#2.
-- Hae MB-provinssista (PROV) kotoisin olevat henkilöt (työntekijän numero ja koko nimi), joiden manageri on Black D.
/*
SELECT EMPS.EMPNUM AS TYÖNTEKIJÄNUMERO, CONCAT(EMPS.GNAME, ' ',EMPS.SURNAME) AS KOKONIMI
FROM EMPS INNER JOIN DEPT
WHERE EMPS.PROV='MB' AND DEPT.MANAGER='Black D';
*/

#3
-- Hae kaikki managerit, joilla on yli 10 alaista. Tulosjoukkoon tulee managerin lisäksi alaisten lukumäärä. 
-- Nimeä tulosjoukon sarakkeet "Manageri" ja "Alaisia". Lajittele hakutulokset alaisten lukumäärän mukaan laskevaan järjestykseen.
/*
SELECT DEPT.MANAGER AS Manageri, COUNT(*) AS Alaisia
FROM EMPS INNER JOIN DEPT
ON EMPS.DEPT = DEPT.DEPT
GROUP BY DEPT.MANAGER
HAVING Alaisia>10
ORDER BY Alaisia DESC;
*/

#4
-- Tee listaus yhteen sarakkeeseen, johon tulee sekä työntekijöiden nimet (etunimi, sukunimi) että managerien nimet.
-- Tulosjoukkoon sarakkeen nimeksi "nimi". Toiseen sarakkeeseen tulee tieto siitä, onko kyseessä työntekijä vai pomo.
-- Toisen sarakkeen nimeksi tulee "Tyyppi". Lajittelu ensisijaisesti tyypin ja sitten nimen mukaan.
/*
SELECT DEPT.MANAGER AS nimi, 'Pomo' AS Tyyppi
FROM DEPT
	UNION
SELECT CONCAT(EMPS.GNAME, ' ', EMPS.SURNAME) AS nimi, 'Työntekijä' AS Tyyppi
FROM EMPS
ORDER BY Tyyppi, nimi;
*/

#5
-- Hae tietokannasta alikyselyn avulla kaikki työntekijät, joiden rate-arvo on suurin mahdollinen.
/*
SELECT * 
FROM EMPS
WHERE EMPS.RATE =
	(SELECT MAX(EMPS.RATE) FROM EMPS);
*/

#6 
-- Hae tietokannasta sellaiset A-osastoon kuuluvat henkilöt, joilla on eri rate-arvo kuin B-osastolaisilla 
-- (Vinkki: Käytä IN-alikyselyä!)
/*
SELECT * FROM EMPS
WHERE EMPS.DEPT = 'A'
AND
EMPS.RATE NOT IN
	(SELECT EMPS.RATE FROM EMPS
	WHERE EMPS.DEPT = 'B');
*/
-- Yksi työntekijä nimeltä Peter Curry

#7 
-- Listaa osastoon A kuuluvat henkilöt vain jos A-osaston budjetti on suurempi kuin 50000.
/*
SELECT * FROM EMPS
WHERE EMPS.DEPT IN
	(SELECT DEPT.DEPT FROM DEPT
	WHERE DEPT.DEPT = 'A'
	AND DEPT.BUDGET > 50000);
*/

#8
-- Listaa työntekijät, jotka eivät ole managereina osastoilla 
-- (Vinkki: Muista tuoda työntekijöiden nimet vertailussa samaan formaattiin kuin managerien!).
/*
SELECT *
FROM EMPS INNER JOIN DEPT
ON EMPS.DEPT = DEPT.DEPT 
WHERE CONCAT(EMPS.SURNAME, ' ', SUBSTRING(EMPS.GNAME,1,1)) != DEPT.MANAGER
*/