# TEHTÄVÄ 1 (Liitokset)

-- Hae tiedot työntekijöistä siten, että tulosjoukossa esitetään työntekijän etu- ja sukunimi, osasto sekä osaston tehtävä (duty).
-- SELECT EMPS.GNAME, EMPS.SURNAME, EMPS.DEPT, DEPT.DUTY
-- FROM EMPS INNER JOIN DEPT
-- ON EMPS.DEPT = DEPT.DEPT; -- empsin viiteavain dept liitetään yhteen deptin pääavaimen kanssa

-- Suorita aiempi haku työntekijöiden osalta siten, että myös ne työntekijät haetaan tulosjoukkoon, joilla ei ole osastoa määritettynä.
-- Voit varmistua hausta poistamalla joltain työntekijältä osastotiedon ja tarkastamalla, että työntekijä haetaan mukaan tulosjoukkoon.
/*
SELECT EMPS.GNAME, EMPS.SURNAME, EMPS.DEPT, DEPT.DUTY
FROM EMPS INNER JOIN DEPT
ON EMPS.DEPT = DEPT.DEPT OR EMPS.DEPT IS NULL;
*/


# TEHTÄVÄ 2 (Yhdisteet)

-- Käytä yhdistettä (UNION), jotta voit hakea samaan tulosjoukkoon työntekijät, 
-- joiden osaston tunnus on välillä A-D ja työntekijät, joiden etunimi alkaa B-kirjaimella. 
-- Ilmoita tulosjoukossa työntekijöiden osaston tunnus, etu- ja sukunimi sekä kaupunki. 
/*
SELECT DEPT, GNAME, SURNAME, CITY 
FROM EMPS 
WHERE DEPT BETWEEN 'A' AND 'D'
	UNION
SELECT DEPT, GNAME, SURNAME, CITY 
FROM EMPS
WHERE GNAME LIKE 'B%';
*/
-- Käytä yhdistettä (UNION) ja liitosta (JOIN), jotta voit hakea samaan tulosjoukkoon seuraavat tiedot: 
-- - Työntekijät, jotka työskentelevät osastolla, jonka budjetti on välillä 50000-100000.
-- - Työntekijät, tietokoneen tunnus alkaa T-kirjaimella
-- Ilmoita lopullisessa tulosjoukossa työntekijöiden osaston tunnus, osaston budjetti, työntekijän etu- ja sukunimi sekä tietokoneen tunnus. 
-- Järjestele tulosjoukko osaston tunnuksen mukaan nousevaan järjestykseen. 
/*
SELECT EMPS.DEPT, DEPT.BUDGET, EMPS.GNAME, EMPS.SURNAME, EMPS.PC
FROM EMPS INNER JOIN DEPT
ON EMPS.DEPT = DEPT.DEPT
WHERE DEPT.BUDGET BETWEEN 50000 AND 100000
	UNION
SELECT EMPS.DEPT, DEPT.BUDGET, EMPS.GNAME, EMPS.SURNAME, EMPS.PC
FROM EMPS, DEPT
WHERE EMPS.PC LIKE 'T%'
ORDER BY 1;
*/


# TEHTÄVÄ 3 (Alikyselyt)

-- Hae tietokannasta kaikki työntekijät, joiden osaston tehtävä on sama kuin henkilöllä Peter Curry.
-- Ilmoita tulosjoukossa osaston tunnus, tehtävä sekä työntekijän etu- ja sukunimi.
/*
SELECT DEPT.DEPT, DEPT.DUTY, EMPS.GNAME, EMPS.SURNAME
FROM DEPT INNER JOIN EMPS
ON DEPT.DEPT = EMPS.DEPT
WHERE DEPT.DUTY =
	(SELECT DEPT.DUTY
    FROM DEPT INNER JOIN EMPS
    ON DEPT.DEPT = EMPS.DEPT
    WHERE CONCAT(EMPS.GNAME, ' ', EMPS.SURNAME)='Peter Curry');
*/

-- Hae niiden työntekijöiden etu- ja sukunimet sekä puhelinnumerot,
-- joiden osaston tehtävä on markkinointi (MARKETING) tai joiden osaston manageri on Mark G.
-- SELECT EMPS.GNAME, EMPS.SURNAME, EMPS.PHONE, DEPT.DUTY, DEPT.MANAGER
-- FROM EMPS INNER JOIN DEPT 
-- ON EMPS.DEPT = DEPT.DEPT 
-- WHERE DEPT.DUTY='MARKETING' OR DEPT.MANAGER='MARK G'
#OIKEA VASTAUS
SELECT GNAME, SURNAME, PHONE
FROM EMPS
WHERE DEPT IN
	(SELECT DEPT FROM DEPT
    WHERE DUTY='MARKETING' OR MANAGER='MARK G');