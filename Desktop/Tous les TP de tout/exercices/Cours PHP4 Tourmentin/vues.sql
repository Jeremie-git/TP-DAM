--Créez une vueVComiteExecutifcontenant les noms, prénoms et fonctions des adhérents qui sont membres du comité exécutif de l'association (c'est-à-dire les membres du bureau(président, vice-présidents, secrétaire et trésorier) ainsi que les membres actifs). Affichez ensuite le nombre de personnes appartenant au comité exécutif.--
create VIEW VComiteExecutif AS
    SELECT nom, prenom, fonction
    FROM ADHERENT
    WHERE fonction = 'president' OR fonction = 'vice-president' OR fonction ='tresorier' OR fonction ='secretaire' OR fonction ='membre actif';

SELECT * FROM VComiteExecutif;

--En  utilisant  la  vue  précédente,  créez  une  vue VBureau contenant  uniquement  les membres du bureau. Affichez ensuite le résultat de cette vue. --
DROP VIEW VBureau;

CREATE VIEW VBureau AS
  SELECT nom, prenom, fonction
  FROM VComiteExecutif
  WHERE fonction = 'president' OR fonction ='vice-president' OR fonction = 'tresorier' OR fonction = 'secretaire';

SELECT * FROM VBureau;

  --Créez une  vue VAdherentsDebiteurs contenant  la  liste des adhérents qui n'ont pas payé (attribut paye = 'non') leur cotisation en 2019. Cette vue devra contenir le nom, le prénom et la fonction des adhérents ainsi que le montant de la cotisation à payer. Affichez ensuite le résultat de cette vue.--
DROP VIEW VAdherentsDebiteurs;

CREATE VIEW VAdherentsDebiteurs AS
select adherent.nom, adherent.prenom, adherent.fonction, cotisation.montant
from adherent,cotisation
where paye='non' and adherent.numadh=cotisation.numadh;

SELECT * FROM VAdherentsDebiteurs;
