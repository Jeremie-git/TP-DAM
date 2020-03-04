
ALTER TABLE equipage ADD CONSTRAINT test FOREIGN KEY  (numact,numadh,numbat) REFERENCES chefdebord (numact,numadh,numbat);
alter table chefdebord drop constraint chefdebord_pkey
alter table chefdebord add primary key (numact,numbat,numadh)
---------------------------------------------------------------------------
-- A COMPLETER EN PRENANT EN COMPTE LES CONTRAINTES D'INTEGRITE CI1 à CI24
---------------------------------------------------------------------------

create table adherent(
	numadh numeric(4) ,
	nom varchar(10),
	prenom varchar(10),
	fonction varchar(15),
	adresse varchar(40),
	telephone varchar(10) ,
	skipper char(3),
	anneeadh numeric(4)
);

create table cotisation(
	numadh numeric(4) ,
	anneecot numeric(4),
	montant numeric ,
	paye char(3)
);

create table bateau(
	numbat smallint PRIMARY KEY,
	nombat varchar(20),
	taille numeric(4,2),
	typebat  varchar(10),
	nbplaces numeric(4)
);

create table  agence(
	nomagence varchar(20) UNIQUE,
	telephone varchar(10) PRIMARY KEY,
	fax varchar(10),
	adresse varchar(20)
);

create table proprietaire(
	numadh numeric(4) PRIMARY KEY,
	numbat smallint UNIQUE
);

create table loueur(
	numbat smallint UNIQUE,
	nomagence varchar(20) PRIMARY KEY
);

create table activite(
	numact numeric(4) PRIMARY KEY,
	typeact varchar(6),
	depart varchar(10),
	arrivee varchar(10),
	datedebut date,
	datefin date
);

create table chefdebord(
	numact numeric(4) UNIQUE,
	numadh numeric(4) PRIMARY KEY,
	numbat smallint UNIQUE
);

create table equipage(
	numact numeric(4) UNIQUE,
	numadh numeric(4) PRIMARY KEY,
	numbat smallint UNIQUE
);

create table regate(
	numact numeric(4) PRIMARY KEY,
	numregate smallint,
	forcevent smallint
);

create table resultat(
	numbat smallint PRIMARY KEY,
	numact numeric(4) UNIQUE,
	numregate smallint,
	classement smallint,
	points numeric(4)
);
