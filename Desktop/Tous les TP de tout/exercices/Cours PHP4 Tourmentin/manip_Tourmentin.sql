--Le rallye  du  12  juillet 2020initialement  prévu  avec  un  départ  de Toulon,  partira finalement de Marseille.--
UPDATE activite SET depart = 'Marseille' WHERE depart = 'Toulon' AND numact=16;

--Le port de Saint Tropez est indisponible définitivement. Il faut donc modifier le départ et l’arrivée de  toutes  les  activités futures qui  y  étaient  prévues  et  les  faire  partir ou arriver de Sainte Maxime. --
UPDATE activite SET depart = 'Sainte-Maxime' WHERE depart = 'Ajaccio' AND datedebut>'24/01/2020';
UPDATE activite SET arrivee = "Sainte-Maxime" WHERE arrivee = "Ajaccio";

--L'activité  du 14 au  15 juillet 2020au  départ  d'Ajaccio sera  finalement  annulée.Que faut-il faire pour prendre en compte l'annulation de cette activité ?--
DELETE FROM chefdebord
WHERE numact=15;

DELETE FROM activite
WHERE numact=15;

--Le  bateau Cauchemar des mers n'est en  fait pas un  bateau de propriétaire. Il est  loué par l'agence plaisance.  Que faut-il faire pour prendre en compte cette erreur?--
DELETE FROM proprietaire
WHERE numbat=6;

INSERT INTO LOUEUR VALUES ('plaisance',6);
