<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Droits Tourmentin</title>
  </head>
  <body>
    <h1>Exercices sur les Droits depuis la BDD Tourmentin_solution</h1>
<?php



$utilisateur='postgres';
$mdp='jeremdam';
$connexion = pg_connect("host=localhost port=5432 dbname=Tourmentin_solution user=$utilisateur password=$mdp");

function login(){
  global $connexion;
  global $utilisateur;
  if ($connexion){
    echo "<br>L'utilisateur <u>=> ".$utilisateur." <=</u> est bien connecté !<br>";
  }
  else{
    echo "Souci de connexion.";
  }
}


////////////////////             EXERCICE 1           /////////////////////


echo '<b><br> 2 - Le président doit avoir tous les droits sur les relations de cette base. Pour cela, accordez au rôle presidenttous les droits d’interrogation et de manipulation  de données sur les  relations qui ont été créées par le fichier create.sql.<br></b>';

function toutPrivi(){
  global $connexion;
  $qry1=pg_query($connexion, 'GRANT ALL PRIVILEGES ON SCHEMA public TO president;');
  echo '<br>on a écrit "GRANT ALL PRIVILEGES ON SCHEMA public TO president;" dans Postgre <br>';
}
toutPrivi();

////////////////////////////////////////////////////////////////////////////
 echo "<b><br>Connectez-vous  en  tant  que aflau,  et  testez  quelques  commandes  sur  ces  relations. Quels  autres  droits  particuliers  avez-vous  sur  ces  relations  lorsque  vous  êtes  connecté  avec  votre  login postgresql (par exemple users2d01), que vous n’avez pas lorsque vous êtes connecté en tant que aflau?<br></b>";

login();

function testInsert(){
  global $connexion;
  $qry=pg_query($connexion, "INSERT INTO ADHERENT VALUES (22,'Ochon','Paul','membre actif','Vannes','0385472569','non',2020);");
  echo "testInsert réussi";
}

testinsert();
echo "<br> On test d'insérer des valeurs dans la table [adherent] en étant connecté avec le user [aflau] via la query 'INSERT INTO ADHERENT VALUES (1,'aflau','jean','president','grenoble','0476441250','oui',2014);'<br>";


////////////////////////////             EXERCICE 2              ///////////////////////////


echo "<b><br>3 - Le bureau(président,  secrétaire  et  trésorier)  doit  pouvoir  prendre  des  décisions,  donc  a  des  droits  de consultation sur tout ce qui n'est pas confidentiel. Seules les cotisations sont confidentielles.</b><br>";

function droitConsultation(){
  global $connexion;
  $qry=pg_query($connexion, "GRANT SELECT ON TABLE activite, adherent, agence, bateau, chefdebord, equipage, loueur, proprietaire, regate, resultat TO bureau;");
  echo "<br>droitConsultation réussi<br>";
}

echo "<br>On donne les droits de consultation aux membres du bureau, pour toutes les tables sauf [cotisation], via la query 'GRANT SELECT ON TABLE activite, adherent, agence, bateau, chefdebord, equipage, loueur, proprietaire, regate, resultat TO bureau;'<br>";
droitConsultation();


////////////////////////////            EXERCICE 4            //////////////////////////


echo "<br><b>4 - Le trésorier gère  les  cotisations.  Il  a  donc  tous  les  droits  sur  la  relation cotisation et  le  droit  de consultation sur les vues concernant les cotisations (en l’occurrence vadherentsdebiteurs créée lors du TP précédent).</b><br>";

function droitTresorier(){
  global $connexion;
  $qry=pg_query($connexion, "GRANT ALL ON TABLE cotisation TO tresorier;");
  echo "<br>droitTresorier réussi<br>";
}

echo "<br>On donne les pleins pouvoir au trésorier sur la table [cotisation] via la query 'GRANT ALL ON TABLE cotisation TO tresorier;'<br>";
droitTresorier();






pg_query($connexion, "CREATE VIEW Vrallye as SELECT typeact from activite where typeact='rallye';");

 ?>
  </body>
</html>
