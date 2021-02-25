#1
-- Montako työntekijää on tietokannassa? Anna tulosjoukon sarakkeelle aliasnimi HloLkm.
#SELECT COUNT(*) AS HloLkm FROM EMPS;
-- vastaus: 500 henkilöä

#2
-- Paljonko on rate-arvojen keskiarvo? Ilmoita tulos tulosjoukossa kahden desimaalin tarkkuudella.
#SELECT ROUND(AVG(RATE),2) AS RateKeskiarvo FROM EMPS;

#3
-- Mitkä ovat suurin ja pienin rate-arvo työntekijöiden taulussa? Anna sarakkeille tulosjoukkoon kuvaavat nimet.
#SELECT MAX(RATE) AS MaxRate, MIN(RATE) AS MinRate FROM EMPS;

#4
-- Mikä on osastoilla A-G työskentelevien työntekijöiden rate-arvojen summa?
#SELECT SUM(RATE) AS RateSum FROM EMPS WHERE DEPT BETWEEN 'A' AND 'G';

#5
-- Etsi ne osastot (osaston tunnus riittää), joiden työntekijöiden arvojen summa on yli 100. Lisää tulosjoukon listaukseen arvojen summa mukaan.
/*
SELECT DEPT, SUM(RATE) AS RateSum
FROM EMPS
GROUP BY DEPT
HAVING SUM(RATE) > 100;
*/

#6
-- Kuinka monesta eri kaupungista on työntekijöitä?
#SELECT COUNT(DISTINCT CITY) FROM EMPS;

#7
-- Tee luokittelu työntekijöille siten, että työntekijät, joiden kotikaupunki alkaa kirjaimilla A-M, ilmaistaan arvolla "ekat" ja kaikki muut arvoilla "muut". 
-- Anna tulosjoukon sarakkeelle jokin kuvaava nimi. 
-- Tuo lisäksi tulosjoukkoon työntekijöiden etu- ja sukunimet, kaupungit ja puhelinnumerot.
/*
SELECT GNAME AS Etunimi, SURNAME AS Sukunimi, CITY AS Kaupunki, PHONE AS Puhelinnumero,
 CASE 
	WHEN CITY BETWEEN 'A' AND 'M' THEN 'ekat'
	WHEN CITY NOT BETWEEN 'A' AND 'M' THEN 'muut'
 END AS Prioriteetti
FROM EMPS;
*/

#8 
-- Tee lista työntekijöistä siten, että tulosjoukon listauksessa esitetään työntekijät muodossa: Aaltonen, M (sukunimi ja etunimen ensimmäinen kirjain).
#SELECT CONCAT(SUBSTRING(EMPS.SURNAME,1,1), LOWER(SUBSTRING(EMPS.SURNAME,2)),', ', SUBSTRING(EMPS.GNAME,1,1)) AS Työntekijä FROM EMPS;

#9
-- Mitä seuraava SELECT-käsky palauttaa ja miksi (HUOM: ei liity Ocelot-harjoitustietokantaan!):
#Palauttaa 'Tarkastus'-nimisen sarakkeen Kohdetaulusta jossa on CURRENT_USERin kohdalla teksti OK tai Myöhässä sen mukaan, 
#onko tämä päivämäärä (CURRENT_DATE) pienempi/yhtäsuuri kuin 2011-02-22. Eli jos on pienempi tai yhtäsuuri, tällöin 'OK' ja jos eri niin tällöin 'Myöhässä'
