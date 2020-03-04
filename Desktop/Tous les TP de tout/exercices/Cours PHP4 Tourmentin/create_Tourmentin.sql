
create table adherent(
numadh numeric(4) primary key,
nom varchar(10),
prenom varchar(10),
fonction varchar(15) 	
	constraint c_fonction check (fonction in 
	('president','vice-president','tresorier','secretaire','membre actif','autre')),
adresse varchar(40),
telephone varchar(10),
skipper char(3) 
	constraint c_skipper check (skipper in ('oui','non')),
anneeadh numeric(4) default extract(year from now()));


create table bateau(
numbat numeric(4) primary key,
nombat varchar(20),
taille numeric(4,2),
typebat  varchar(10),
nbplaces numeric(2) check (nbplaces>=5));

create table activite(
numact numeric(4) primary key,
typeact varchar(6) 
	constraint c_typeact check (typeact in ('rallye','sortie')),
depart varchar(10) ,
arrivee varchar(10) ,
datedebut date,
datefin date,
constraint c_dates check (datedebut<=datefin));

create table cotisation (
numadh numeric(4) references adherent(numadh),
anneecot numeric(4),
montant real,
paye char(3) constraint c_paye check(paye in ('oui', 'non')),
primary key (numadh,anneecot));


create table  agence(
nomagence varchar(20) primary key,
telephone varchar(10),
fax varchar(10),
adresse varchar(40));

create table proprietaire(
numadh numeric(4) primary key references adherent(numadh),
numbat numeric(4) unique references bateau(numbat));

create table loueur(
nomagence varchar(10) references agence(nomagence),
numbat numeric(4) primary key references bateau(numbat));

create table chefdebord(
numact numeric(4) references activite(numact),
numadh numeric(4) references adherent(numadh),
numbat numeric(4) references bateau(numbat),
unique (numbat, numact),
primary key (numact, numadh));

create table equipage(
numact numeric(4),
numadh numeric(4) references adherent(numadh),
numbat numeric(4),
foreign key (numbat, numact) references chefdebord (numbat, numact),
primary key (numact, numadh));

create table regate(
numact numeric(4) references activite(numact),
numregate numeric(2),
forcevent numeric(2),
primary key (numact,numregate));

create table resultat(
numbat numeric(4),
numact numeric(4),
numregate numeric(2),
classement numeric(2),
points numeric(4),
foreign key (numact,numregate) references regate (numact, numregate),
foreign key (numact,numbat) references chefdebord(numact, numbat),
primary key (numbat, numact, numregate));
