--Noms et prénoms des adhérents ayant cotisé en 2016.--
SELECT nom, prenom FROM adherent WHERE anneeadh=2016;

--Noms des skippers qui ne sont jamais chefs de bord.--
SELECT nom FROM adherent WHERE skipper='non';

--Prix moyens des cotisations payées par chaque adhérent.--
SELECT adherent.nom, avg(cotisation.montant)
FROM adherent, cotisation
WHERE paye='oui'
AND adherent.numadh=cotisation.numadh
GROUP BY adherent.nom
ORDER BY avg(cotisation.montant) DESC;

--Noms des adhérents qui ont payé le moins cher en 2016.--
SELECT adherent.nom
FROM adherent, cotisation
WHERE anneecot=2016
AND paye='oui'
AND cotisation.montant=(SELECT min(cotisation.montant) from cotisation where anneecot=2016)
AND adherent.numadh=cotisation.numadh;
