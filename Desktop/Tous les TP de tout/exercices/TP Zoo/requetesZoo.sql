--1.D’afficher tous les cas de typhus, dans l’ordre anti-chronologique. Il n’est pas demandé d’afficher le remède prescrit.--
select noma from estmalade
where nommal='typhus'
order by datem desc;

--2.D’afficherle numéro des cages vides.--
SELECT numc
FROM cage
EXCEPT
SELECT numc
FROM animal;

--3.D’afficher,  pour  chacune  des  cages  non  vides  de  type ‘fauves‘,  le  nombre d’animaux qu’elle contient.Les cages seront affichées de la moins remplie à la plus remplie.--
SELECT count(*)
FROM animal, cage
WHERE animal.numc=cage.numc AND cage.typec='cage à fauves'
GROUP BY cage.numc
ORDER BY count ASC;

--4.Même question mais en ne considérant que les cages contenant au moins deux animaux.--
SELECT count(*)
FROM animal, cage
WHERE animal.numc=cage.numc
GROUP BY cage.numc
having count(*) >= 2
ORDER BY count ASC;

--5.D’insérer le lion écossais gilderoy, né le 15/06/1965, dans la cage 5.--
INSERT INTO animal VALUES ('gilderoy','lion','m','écosse','15/06/1965',5);

--6.D’enregistrer le fait que tous les animaux de la cage 5 ont contracté aujourd’hui le typhus, mais sans remède.--
INSERT INTO estmalade (noma,nommal,datem)
select animal.noma,'typhusx','28/01/2020'
from animal where animal.numc=5;

--Aussi possible --
INSERT INTO estmalade (noma,nommal,datem,remede) values (FROM (select animal.noma from animal where animal.numc=5) AS subquery WHERE estmalade.noma=subquery.noma,'ok') ;
UPDATE estmalade
SET nommal='typhus',datem='28/01/2020'
FROM (select animal.noma from animal where animal.numc=5) AS subquery
WHERE estmalade.noma=subquery.noma;--

--7.Que tous les animaux d’origine inconnue (pays=’inconnu’), deviennent français.--
UPDATE animal
SET pays='france' where pays='inconnu';

--8.D’effacer tous les animaux de la cage 5.--
ALTER TABLE estmalade DROP CONSTRAINT estmalade_noma_fkey;
DELETE FROM animal
WHERE numc=5;
