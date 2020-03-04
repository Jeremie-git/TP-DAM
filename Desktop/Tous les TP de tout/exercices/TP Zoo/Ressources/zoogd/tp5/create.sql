-- cage(numc,lieu,typec)
create table cage(
	numc numeric primary key,
	lieu varchar,
	typec varchar constraint typecage check (typec in ('volière','fosse aux ours','cage à fauves','cage à poules','parc','aquarium','vivarium', 'infirmerie')));

-- animal(noma,espece,sexe,payes,datea,numc)
create table animal(
	noma varchar primary key,
	espece varchar,
	sexe character check(sexe in ('f','m')) default 'f',
	pays varchar,
	datea date,
	numc numeric references cage(numc));

-- gardien(numg,nomg,adresse,dateg)
create table gardien(
	numg numeric primary key,
	nomg varchar,
	adresse varchar,
	dateg date);

-- estmalade(noma,nommal,datem,remede)
create table estmalade(
	noma varchar references animal(noma),
	nommal varchar,
	datem date,
	dateguerison date constraint verifdates check(datem < dateguerison),
	ancnumc numeric references cage(numc),
	remede varchar,
	primary key (noma,nommal,datem));

--soccupe(numg,numc)
create table soccupe(
	numg numeric references gardien(numg),
	numc numeric references cage(numc),
	primary key (numg,numc));


