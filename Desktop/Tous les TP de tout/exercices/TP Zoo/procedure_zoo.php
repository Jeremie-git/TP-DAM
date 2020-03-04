<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>TD N°1 - Procédures</title>
  </head>
  <body>
  <?php

  $connexion = pg_connect("host=localhost port=5432 dbname=Zoo user=postgres password=jeremdam");
?>
<p>
<?php
//Définition des foonctions

  function testerMaConnexion(){
    global $connexion;
    if ($connexion){
      echo ('connexion réussie avec appel de fonction. <br>');
    }
    else {
      echo ('échec de connexion');
    }
  }

  testerMaConnexion();
?>
</p>
<p><?php
////////////////       PREMIER EXERCICE           /////////////////////////////


echo "<b>Ecrire une fonction DernierCas qui, étant donné le nom d’une maladie, retourne la date à laquelle cette maladie a été contractée par un animal du zoo pour la dernière fois. </b><br>";
  function dernierCas(string $maladie){
    global $connexion;
    $qry= pg_query($connexion, "SELECT datem FROM estmalade WHERE nommal='$maladie' ORDER BY datem DESC");
    $tableauMaladies = pg_fetch_assoc($qry);
    foreach ($tableauMaladies as $key => $value) {
      echo ("La dernière date à laquelle la maladie : =>".$maladie."<= est apparue est : [".$value."] <br>");
    }
  }
    dernierCas('grippe');
    dernierCas('gale');

//Appeler la fonction précédente pour le‘typhus’.
    dernierCas('typhus');


/////////////////////              TROISIEME EXERCICE          //////////////////


echo "<br><b>3. Modifier  la  fonction  pour  lever  une  exception  si  la  maladie  n’a  encore  jamais  été  contractée par aucun animal du zoo.</b><br>";

  $maladieExo3='Burn-out';

  function dernierCasModif(string $pasmaladie){
    global $connexion;
    $requete = pg_query($connexion, "SELECT datem FROM estmalade WHERE nommal='$pasmaladie' ORDER BY datem DESC");
    $tableauMaladies = pg_fetch_assoc($requete);

    if ($tableauMaladies==NULL){
      throw new Exception(" Sauf que [".$pasmaladie."] n'a jamais été contractée par les animaux du zoo. Et c'est tant mieux on a déjà assez de problème avec le typhus, la gale et la grippe.");
    }
    else {
      foreach ($tableauMaladies as $key => $value) {
        echo ("la dernière date à laquelle la maladie : [".$pasmaladie."] est apparue est : =>".$value." <br>");}
      return $pasmaladie;
    }
  }
  try {
        dernierCasModif($maladieExo3);
  }
  catch (Exception $e) {
      echo "On veut savoir si la maladie : =>".$maladieExo3."<= a déjà affetctée un animal du zoo.",  $e->getMessage(), " <br>";
  }


//////////////////           QUATRIEME EXERCICE       //////////////////////



echo "<b><br>Ecrire une fonction DerniersCasqui, étant donné le nom d’une maladie, retourne la liste des animaux ayant  déjà contracté  cette  maladie,  de  la  date  la  plus  récente  à  la  plus  ancienne.  Chacun  animal  sera affiché autant de fois qu’il a contracté la maladie.</b><br>";

  function derniersCas(string $maladie){
    global $connexion;
    $qry = pg_query($connexion,"SELECT noma, datem FROM estmalade WHERE nommal='$maladie' ORDER BY datem DESC");
    // $tabAnimalMalade=pg_fetch_assoc($qry);
    while ($row = pg_fetch_assoc($qry)) {
      echo $row['noma']."  ";
      echo $row['datem']." <br>";
    }
  }
echo ("L'historique des maladies suivant affiche les cas à partir de la plus récente. <br>");

derniersCas('typhus');

///////  BONUS //////
// echo $row['datem']." <br>"; //


/////////////////        CINQUIEME EXERCICE       //////////////////


echo "<br><b>Ecrire une fonction CageDispo qui, étant donné un type de cage, renvoie le numéro de la cage de ce type contenant le moins d’animal. On supposera que toute cage contient au moins un animal.</b><br>";

  function cageDispo(string $typeCage){
    global $connexion;
    $numCage=0;
    $qry=pg_query($connexion,"SELECT numc FROM cage WHERE typec='$typeCage' ORDER BY numc DESC");
    $tabResultat=pg_fetch_assoc($qry);
    foreach($tabResultat as $key => $value) {
            $numCage=$value;
    }
    return $numCage;
  }

  $num=cageDispo($typeCage='aquarium');
  echo "La cage numéro =>".$num."<= est un.e [".$typeCage."] qui contient le moins d'animaux. <br>";



/////////////////          SIXIEME EXERCICE        /////////////////////////


echo "<br><b>Ecrire une fonction InsererLionFauves qui, étant donné le nom, le sexe, le pays d’origine et la date de naissance d’un  nouveau  lion, l’enregistre  dans  la  table animal avec  le  numéro  de  la  cage  de  type ‘fauves’ la moins remplie. Indication: utiliser la fonction CageDispo.</b><br>";

$nomAnimal = 'cédric';
$especeAnimal = 'brochet';
$sexeAnimal = "m";
$paysAnimal = "france";
$dateAnimal = "14/02/1989";
$minCage = cageDispo('aquarium');

  function InsererLionFauves(string $nomAnimal, string $especeAnimal, string $sexeAnimal, string $paysAnimal, string $dateAnimal){
    global $connexion;
    $minCage=cageDispo('cage à fauves');
    pg_query($connexion,"DELETE FROM animal WHERE noma='$nomAnimal'");
    pg_query($connexion,"INSERT INTO animal VALUES ('$nomAnimal', '$especeAnimal', '$sexeAnimal', '$paysAnimal', '$dateAnimal', $minCage)");
  }

  InsererLionFauves($nomAnimal, $especeAnimal, $sexeAnimal, $paysAnimal, $dateAnimal);
  echo "Le ".$especeAnimal. " nommé ".$nomAnimal." né le ".$dateAnimal." est entré au zoo, et placé dans la cage ".$minCage." . <br>";


  /////////////////////              SEPTIEME EXERCICE        /////////////////////////////


  echo "<br><b>Ecrire une fonction InsererLionFauvesAdv qui fasse le même travail que InsererLionFauves mais ajoute un numéro au nom du lion si un autre animal possède le même nom. Par exemple, s’il existe déjà un animal nommé gilderoy, un nouveau lion de même nom sera enregistré avec le nom gilderoy2, le suivant avec le nom gilderoy3 etc.</b><br>";

// CES VARIABLES SONT DEJA DEFINIES EN GLOBAL PLUS HAUT (LIGNE 128) //
  // $nomAnimal = 'gilderoy';
  // $especeAnimal = 'lion';
  // $sexeAnimal = "m";
  // $paysAnimal = "france";
  // $dateAnimal = "14/02/1989";
  // $minCage = cageDispo('cage à fauves');

  function InsererLionFauvesAdv(string $nomAnimal, string $especeAnimal, string $sexeAnimal, string $paysAnimal, string $dateAnimal){
    global $connexion;
    $minCage=cageDispo('cage à fauves');
    $qry=pg_query($connexion,"SELECT noma FROM animal WHERE noma='$nomAnimal'");
    $tabNomAnimal=pg_fetch_assoc($qry);
    $x=1;
    $nomAnimalPlus=$nomAnimal;
    // pg_query($connexion,"DELETE FROM animal WHERE noma='$nomAnimal'");

    while ($tabNomAnimal!=NULL){
      $x++;
      $nomAnimalPlus=$nomAnimal.$x;
      $qry2=pg_query($connexion,"SELECT noma FROM animal WHERE noma='$nomAnimalPlus'");
      $tabNomAnimal=pg_fetch_assoc($qry2);
    }

    pg_query($connexion,"INSERT INTO animal VALUES ('$nomAnimalPlus', '$especeAnimal', '$sexeAnimal', '$paysAnimal', '$dateAnimal', $minCage)");
    echo "On veut entrer l'animal => ".$nomAnimal." <= dans le zoo, mais il existe déjà. On le rentre donc en tant que => ".$nomAnimalPlus." <=, dans la cage ".$minCage." <br>";
  }


  InsererLionFauvesAdv($nomAnimal, $especeAnimal, $sexeAnimal, $paysAnimal, $dateAnimal);

  ?>
  </body>
</html>
