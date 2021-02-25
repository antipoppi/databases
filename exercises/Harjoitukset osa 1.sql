-- Harjoitukset osa 1 (Harjoitukset -> Harjoitus 1 (SQL-perusteet osa1)
-- --- Tehtävä 1 (Henkilötietojen kerääminen) ---

-- Hae niiden työntekijöiden etu- ja sukunimi,
-- joiden etunimen kaksi ensimmäistä kirjainta ovat MI
-- SELECT GNAME, SURNAME FROM EMPS WHERE GNAME LIKE 'MI%';

-- Hae kaikki työntekijät, joiden työntekijänumero on
-- välillä 50 ja 70
-- SELECT * FROM EMPS WHERE EMPNUM BETWEEN 50 AND 70;

-- Hae työntekijätaulusta kaikki erilaiset kaupungit siten,
-- että hakutulokset järjestetään laskevaan järjestykseen (Z-A)
-- SELECT DISTINCT CITY FROM EMPS ORDER BY CITY DESC;


-- --- Tehtävä 2 (Osastotietojen kerääminen) ---

-- Hae kaikki osastot siten, että hakutuloksissa näytetään 
-- viisi osastoa alkaen 10. riviltä.
-- SELECT * FROM DEPT LIMIT 5 OFFSET 9;

-- Hae osastot, joiden budjetti on 57000 ja 93000. Määritä sarakenimeksi Rajattu
-- SELECT DEPT AS Rajattu FROM DEPT WHERE BUDGET IN (57000, 93000);

-- Hae sen osaston tiedot, jonka managerina työskentelee ABEY M
-- select * from DEPT where MANAGER='ABEY M';

-- Hae ne osastot, joiden managerin nimi alkaa S-kirjaimella 
-- ja joiden budjetti on suurempi kuin 100000
-- select * from DEPT where MANAGER like 'S%' and budget>100000;


-- --- Tehtävä 3 (Lisätehtävät) ---

-- Hae osastot, joiden tunnus ei ole välillä H-T (esitä hakutuloksissa osaston tunnus ja manageri)
-- SELECT DEPT, MANAGER FROM DEPT 
-- WHERE DEPT NOT BETWEEN 'H' AND 'T';

-- Hae henkilöt, joiden etunimen toinen kirjain on A, 
-- sukunimen viimeinen kirjain on N ja 
-- tietokoneen (PC) tunnus alkaa merkeillä T0
-- SELECT * FROM EMPS 
-- WHERE GNAME LIKE '_A%' 
-- AND SURNAME LIKE '%N'
-- AND PC LIKE 'T0%';

-- Hae henkilöt, jotka asuvat paikkakunnalla Edmonton ja joiden rate-arvo on välillä 8-10
-- SELECT * FROM EMPS
-- WHERE CITY = 'Edmonton'
-- AND RATE BETWEEN 8 AND 10;