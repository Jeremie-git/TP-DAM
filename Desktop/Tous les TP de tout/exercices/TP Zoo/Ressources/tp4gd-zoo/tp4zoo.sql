/*----------------------------------------------------------------------------------

	ETAPE 1 : Création du schéma, Insertion de données, et Premiers tests

------------------------------------------------------------------------------------*/
/*
------------------------------------------------------------------------------------
1.1 - Création des tables de la base (le schéma de la BD)
	=> Cf. fichier create.sql
------------------------------------------------------------------------------------
1.2 - Création du fichier de suppression des relations de la BD Zoo
	=> Cf. fichier drop.sql
------------------------------------------------------------------------------------
*/

/*
----------------------------------------------------------------------------------
1.3 - Insertion de données (après avoir exécuté : \i create.sql)
----------------------------------------------------------------------------------
------------------------------------------------------------------
 a) Test du schéma initial (à faire une instruction après l'autre)

	Méthode pour chaque instruction INSERT proposée ci-dessous : 
		- Copiez l'instruction et collez-là dans votre terminal
		- Si vous n'obtenez pas le résultat attendu, détruisez votre schéma (en faisant : \i drop.sql)
		  puis corrigez-le (corrigez le fichier insert.sql puis refaire : \i create.sql)
		  et enfin, re-testez TOUTES les instructions INSERT depuis le début pour
		  vérifier votre correction
------------------------------------------------------------------*/

INSERT INTO cage VALUES (1,'lieu1','volière');
/* Résultat attendu : 
	INSERT 0 1
*/

INSERT INTO cage VALUES (1,'lieu2','volière');
/* Résultat attendu : 
	ERROR:  duplicate key value violates unique constraint "cage_pkey"
	DETAIL:  Key (numc)=(1) already exists.
*/
/* QUESTION : Qu'est-ce qui fait échouer cette insertion ?
=> TODO ...
*/

INSERT INTO animal VALUES ('titi','oiseau','m','france','1/08/1950',1);
/* Résultat attendu : 
	INSERT 0 1
*/

INSERT INTO animal VALUES ('grominet','chat','m','france','1/08/1950',2);
/* Résultat attendu : 
	ERROR:  insert or update on table "animal" violates foreign key constraint "animal_numc_fkey"
	DETAIL:  Key (numc)=(2) is not present in table "cage".
*/
/* QUESTION : Qu'est-ce qui fait échouer cette insertion ?
=> TODO ...
*/

INSERT INTO cage VALUES (2,'lieu1','parc');
/* Résultat attendu : 
	INSERT 0 1
*/

INSERT INTO animal VALUES ('grominet','chat','m','france','1/08/1950',2);
/* Résultat attendu : 
	INSERT 0 1
*/

INSERT INTO animal (noma,espece,pays) VALUES ('baloo','ours','afrique');
/* Résultat attendu : 
	INSERT 0 1
*/

INSERT INTO gardien (nomg, adresse, dateg) VALUES ('maton','chezlui','1/01/1984');
/* Résultat attendu : 
	ERROR:  null value in column "numg" violates not-null constraint
	DETAIL:  Failing row contains (null, maton, chezlui, 1984-01-01).
*/
/* QUESTION : Qu'est-ce qui fait échouer cette insertion ?
=> TODO ...
*/

INSERT INTO gardien VALUES (1,'maton','chezlui','1/01/1984');
/* Résultat attendu : 
	INSERT 0 1
*/

INSERT INTO gardien (numg,nomg,adresse) VALUES (2,'zorro','chezluiaussi');
/* Résultat attendu : 
	INSERT 0 1
*/

INSERT INTO soccupe VALUES (1,3);
/* Résultat attendu : 
	ERROR:  insert or update on table "soccupe" violates foreign key constraint "soccupe_numc_fkey"
	DETAIL:  Key (numc)=(3) is not present in table "cage".
*/
/* QUESTION : Qu'est-ce qui fait échouer cette insertion ?
=> TODO ...
*/

INSERT INTO soccupe VALUES (1,1);
/* Résultat attendu : 
	INSERT 0 1
*/

INSERT INTO soccupe VALUES (1,2);
/* Résultat attendu : 
	INSERT 0 1
*/

INSERT INTO estmalade VALUES ('titi','gale',current_date,'lotion');
/* Résultat attendu : 
	INSERT 0 1
*/

INSERT INTO estmalade VALUES ('toto','gale','yesterday','lotion');
/* Résultat attendu : 
	ERROR:  insert or update on table "estmalade" violates foreign key constraint "estmalade_noma_fkey"
	DETAIL:  Key (noma)=(toto) is not present in table "animal".
*/
/* QUESTION : Qu'est-ce qui fait échouer cette insertion ?
=> TODO ...
*/

INSERT INTO estmalade VALUES ('baloo','grippe','yesterday','doliprane');
/* Résultat attendu : 
	INSERT 0 1
*/

-- Et enfin, pour vérifier qu'il y a bien le bon nombre de lignes dans chaque table :
SELECT * FROM
	(SELECT COUNT(*) as nb_animal FROM animal) as a,
	(SELECT COUNT(*) as nb_cage FROM cage) as c,
	(SELECT COUNT(*) as nb_estmalade FROM estmalade) as e,
	(SELECT COUNT(*) as nb_gardien FROM gardien) as g,
	(SELECT COUNT(*) as nb_soccupe FROM soccupe) as s;
/* Résultat attendu :
	 nb_animal | nb_cage | nb_estmalade | nb_gardien | nb_soccupe 
	-----------+---------+--------------+------------+------------
	         3 |       2 |            2 |          2 |          2
	(1 row)
*/

/*------------------------------------------------------------------
 b) Ajout de contraintes (fichier create.sql) :
------------------------------------------------------------------*/

-- Ajoutez la contrainte sur le sexe d'un animal dans la table animal 
-- Ajoutez la contrainte sur sur le type des cages dans la table cage
-- Détruisez les relations de la BD Zoo (\i drop.sql)
-- Recréez la BD Zoo avec les contraintes (\i create.sql)

/*------------------------------------------------------------------
 c) Insertion des données (fichier insert.sql) : 
--------------------------------------------------------------------*/

-- Exécutez le fichier insert.sql (\i insert.sql)
-- Tant qu'il y reste une ou plusieurs erreurs, corrigez le schéma (fichier create.sql)
-- Puis exécutez à nouveau les trois instructions : \i drop.sql \i create.sql \i insert.sql

-- Vérifiez le nombre de lignes de chaque table avec la requête :
SELECT * FROM
	(SELECT COUNT(*) as nb_animal FROM animal) as a,
	(SELECT COUNT(*) as nb_cage FROM cage) as c,
	(SELECT COUNT(*) as nb_estmalade FROM estmalade) as e,
	(SELECT COUNT(*) as nb_gardien FROM gardien) as g,
	(SELECT COUNT(*) as nb_soccupe FROM soccupe) as s;
/* Résultat attendu :
	 nb_animal | nb_cage | nb_estmalade | nb_gardien | nb_soccupe 
	-----------+---------+--------------+------------+------------
	        23 |      11 |           13 |          6 |         22
	(1 row)
*/

-- Vérifiez le contenu des tables de la BD Zoo :
/*
-----------------------------------------------------
CONTENU DE LA TABLE cage

 numc | lieu |     typec      
------+------+----------------
    1 | A1   | volière
    2 | B1   | fosse aux ours
    3 | B3   | cage à fauves
    4 | A2   | cage à poules
    5 | B2   | parc
    6 | C1   | aquarium
    7 | C2   | vivarium
    8 | A3   | volière
    9 | B4   | cage à fauves
   10 | C3   | aquarium
   11 | D1   | infirmerie
(11 rows)

-----------------------------------------------------
CONTENU DE LA TABLE animal

     noma      |  espece  | sexe |  pays   |   datea    | numc 
---------------+----------+------+---------+------------+------
 dumbo         | éléphant | m    | inde    | 2000-01-12 |    5
 kalanag       | éléphant | m    | inde    | 1957-01-17 |    5
 bimbo         | éléphant | m    | afrique | 2000-01-12 |    5
 baghera       | panthère | f    | afrique | 2008-03-24 |    3
 roi lion      | lion     | m    | afrique | 2000-02-02 |    3
 simba         | lion     | f    | afrique | 1998-03-11 |    3
 leo           | lion     | m    | afrique | 1986-01-01 |    3
 shere khan    | tigre    | m    | asie    | 2003-01-17 |    3
 titi          | oiseau   | m    | europe  | 2010-02-02 |    1
 coco          | oiseau   | m    | asie    | 2009-08-03 |    1
 lyre          | oiseau   | f    | europe  | 2010-02-12 |    1
 cui-cui       | oiseau   | m    | europe  | 2010-11-17 |    1
 niko          | requin   | m    | asie    | 2007-05-16 |    7
 brice         | serpent  | m    | europe  | 2007-05-16 |    7
 fifi          | serpent  | m    | europe  | 2007-05-16 |    7
 cotcot        | poule    | f    | europe  | 2011-06-06 |    4
 cocorico      | coq      | m    | europe  | 2012-06-06 |    4
 baloo         | ours     | m    | oceanie | 2006-06-06 |    2
 lulu          | poule    | f    | europe  | 2010-06-06 |    8
 arc en ciel   | poisson  | f    | asie    | 2015-06-16 |    6
 poisson panné | poisson  | m    | europe  | 2016-03-11 |    6
 gaulois       | coq      | m    | europe  | 2015-03-11 |    4
 ovni          | poisson  | f    | asie    | 2016-01-03 |   10
(23 rows)

-----------------------------------------------------
CONTENU DE LA TABLE gardien

 numg |      nomg      |  adresse  |   dateg    
------+----------------+-----------+------------
    1 | Gaston Lagaffe | Dupuis    | 1986-03-11
    2 | Spirou         | Dupuis    | 1990-08-15
    3 | Fantasio       | Dupuis    | 1990-08-15
    4 | Asterix        | Dargaud   | 1992-12-11
    5 | Barbapapa      | Dupuis    | 1991-09-12
    6 | tintin         | Casterman | 1988-03-11
(6 rows)

-----------------------------------------------------
CONTENU DE LA TABLE soccupe
 numg | numc 
------+------
    1 |    1
    1 |    2
    1 |    3
    1 |    4
    1 |    5
    1 |    6
    1 |    7
    1 |    8
    1 |    9
    1 |   10
    2 |    1
    2 |    2
    3 |    3
    3 |    4
    3 |    5
    3 |    6
    4 |    7
    4 |    8
    6 |    1
    6 |    6
    6 |   10
    1 |   11
(22 rows)

-----------------------------------------------------
CONTENU DE LA TABLE estmalade

   noma   | nommal |   datem    |  remede   
----------+--------+------------+-----------
 cotcot   | typhus | 2012-01-25 | medoc
 cotcot   | typhus | 2012-05-04 | medoc
 cotcot   | typhus | 2012-06-05 | medoc
 cotcot   | gale   | 2013-06-10 | medoc
 cotcot   | typhus | 2013-06-10 | medoc
 cocorico | typhus | 2013-06-10 | medoc
 cocorico | typhus | 2014-06-10 | medoc
 cocorico | typhus | 2015-06-10 | medoc
 cocorico | gale   | 2015-06-10 | medoc
 gaulois  | typhus | 2015-06-10 | medoc
 baloo    | grippe | 2015-06-10 | doliprane
 baloo    | gale   | 2016-02-23 | medoc
 baloo    | typhus | 2016-02-23 | medoc
(13 rows)
*/

/*------------------------------------------------------------------------------------

	ETAPE 2 : Manipulations sur la base

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
2.1 - Modification de données (écrivez les instructions nécessaires)
----------------------------------------------------------------------------------*/

-- Les animaux malades doivent être transférés à l'infirmerie :

-- TODO ...

/* Résultat attendu : 
	UPDATE 4
*/

-- Le gardien Asterix est en congés...
-- => Récupérer le numéro du gardien qui ne s'occupe d'aucune cage :

-- TODO ...

/* Résultat attendu :
	 numg 
	------
	    5
	(1 row)
*/

-- => Faire en sorte que le gardien qui ne s'occupe d'aucune cage, s'occupe des cages d'Asterix :

-- TODO ...

/* Résultat attendu :
	INSERT 0 2
*/

-- => Enlever Asterix de la gestion de ses cages :

-- TODO ...

/* Résultat attendu :
	DELETE 2
*/

-- BONUS : Faire en sorte que Asterix récupère la gestion des cages que géraient Barbapapa
--	en ne faisant qu'une seule instruction UPDATE.
--	(Barbapapa doit donc de nouveau se retrouver au "chomage technique")

-- TODO ...

/* Résultat attendu :
	UPDATE 2
*/

/*----------------------------------------------------------------------------------
2.2 - Modification du schéma de la base
----------------------------------------------------------------------------------*/

-- Ajout d'un attribut dateguerison de type date dans la table estmalade :

-- TODO ...

/* Résultat attendu :
	ALTER TABLE
*/

-- Vérification du schéma à l'aide de la commande \d estmalade
/* Résultat attendu :
	           Table "public.estmalade"
	    Column    |       Type        | Modifiers 
	--------------+-------------------+-----------
	 noma         | character varying | not null
	 nommal       | character varying | not null
	 datem        | date              | not null
	 remede       | character varying | 
	 dateguerison | date              | 
	Indexes:
	    "estmalade_pkey" PRIMARY KEY, btree (noma, nommal, datem)
	Foreign-key constraints:
	    "estmalade_noma_fkey" FOREIGN KEY (noma) REFERENCES animal(noma)
*/

-- Ajout d'une contrainte 'c_guerison' assurant que la date de guérison
-- soit ultérieure à celle de la maladie :

-- TODO ...

/* Résultat attendu :
	ALTER TABLE
*/

-- Vérification du schéma à l'aide de la commande \d estmalade
/* Résultat attendu :
	           Table "public.estmalade"
	    Column    |       Type        | Modifiers 
	--------------+-------------------+-----------
	 noma         | character varying | not null
	 nommal       | character varying | not null
	 datem        | date              | not null
	 remede       | character varying | 
	 dateguerison | date              | 
	Indexes:
	    "estmalade_pkey" PRIMARY KEY, btree (noma, nommal, datem)
	Check constraints:
	    "c_guerison" CHECK (datem < dateguerison)
	Foreign-key constraints:
	    "estmalade_noma_fkey" FOREIGN KEY (noma) REFERENCES animal(noma)
*/
