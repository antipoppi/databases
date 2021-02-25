#1
-- Hae kaikki osastotiedot siten, että hakutuloksessa näytetään kymmenen osastoa alkaen seitsemännestä osastosta.
#SELECT * FROM DEPT LIMIT 10 OFFSET 6; 

#2
-- Hae kaikki paikkakunnat, joista työntekijät ovat kotoisin. Lajittele tulokset paikkakunnan mukaan 
-- (HUOM: Samaa paikkakuntaa ei saa tulla listaukseen kahta kertaa!). 
#SELECT DISTINCT CITY FROM EMPS ORDER BY CITY

#3
-- Hae kaikki työntekijät, joiden arvo (rate) on suurempi kuin 9. Lajittele tulokset arvon mukaan siten, että pienin arvo esitetään ensin.
#SELECT * FROM EMPS WHERE RATE > 9 ORDER BY RATE;

#4
-- Hae työntekijät (nimi ja arvo), joiden arvo (rate) on välillä 8-12. Lajittele tulokset arvon mukaan siten, että suurin arvo esitetään ensin.
#SELECT GNAME, SURNAME, RATE FROM EMPS WHERE RATE BETWEEN 8 AND 12 ORDER BY RATE DESC;

#5
-- Hae kaikki työntekijät, joiden sukunimi alkaa S-kirjaimella. Lajittele tulokset ensisijaisesti sukunimen ja sitten etunimen mukaan.
#SELECT * FROM EMPS
#WHERE SURNAME LIKE '%S'
#GROUP BY SURNAME, GNAME;

#6
-- Hae kaikki työntekijät, joiden osasto ei ole A, B tai C. Koeta löytää kolme eri ratkaisuvaihtoehtoa. Mikä vaihtoehdoista on mielestäsi paras?

#SELECT * FROM EMPS WHERE DEPT NOT BETWEEN 'A' AND 'C'
#SELECT * FROM EMPS WHERE DEPT!='A' AND DEPT!='B' AND DEPT!='C'
#SELECT * FROM EMPS WHERE DEPT NOT LIKE 'A' AND DEPT NOT LIKE 'B' AND DEPT NOT LIKE 'C';
-- omasta mielestäni paras vaihtoehto on tietenkin ensimmäinen, koska se on lyhin kirjoittaa.

#7
-- Hae työntekijät, joiden puhelinnumeron kolmas numero on 7 ja joiden kaupunki on joko Edmonton tai Newton.
#SELECT * FROM EMPS
#WHERE PHONE LIKE '__7%'
#AND (CITY='Edmonton' OR CITY='Newton');


#8
-- Hae sellaiset osastot, joiden budjetti on välillä 16000-17000, vastuuhenkilön (manager) sukunimi ei lopu C-kirjaimeen ja 
-- jonka tehtävä on DIV (tehtävän nimen perässä voi olla mikä tahansa numero).

#Tätä tehtävänannossa varmaan haettiin?
/*
SELECT * FROM DEPT
WHERE (BUDGET BETWEEN 16000 AND 17000) 
AND MANAGER NOT LIKE '%C'
AND DUTY LIKE 'DIV%';
*/

#Kirjaimellisesti tehtävänannon mukaan pitäisi laittaa näin:
/*
SELECT DEPT.DEPT FROM DEPT
INNER JOIN EMPS
ON DEPT.DEPT = EMPS.DEPT
WHERE (BUDGET BETWEEN 16000 AND 17000)
AND EMPS.SURNAME NOT LIKE '%C'
AND DUTY LIKE 'DIV%';
*/