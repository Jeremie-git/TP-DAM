<?php
session_start();

$_SESSION["prenom"] = $_POST["prenom"];
$_SESSION["nom"] = "Voyer";
$_SESSION["age"] = 32;

setcookie("pseudo","Jey79");
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>réponse au html</title>
  </head>
  <body>
    <p><strong>Exercices du cous 2 "Interface WEB"</strong></p>
  <p>
    Le nom du serveur est <?php echo $_SERVER['SERVER_NAME']; ?>, et est localisé à l'adresse IP suivante : <?php $_SERVER['REMOTE_ADDR']; ?>
  </p>

  <p>
    Bienvenue sur la session de <?php echo $_SESSION["prenom"]; ?>
  </p>

    <?php
    $nom = $_POST["nom"];
    $prenom = $_POST["prenom"];
    $age = $_POST["age"];

    echo "<br>";

    echo "Bonjour ".$prenom." ".$nom .", avez vous bien ".$age."ans ?";
    ?>

    <p><strong>Exercices du cours 3 "Fonctions intégrées"</strong></p>

    <?php
    define("BONJOUR","coucou");

    echo "BONJOUR"." <br>";
    echo "coucou <br>";

    $tableau = array("nom"=>"napo", "prénom"=>"léon", "lieu_de_naissance" => "Martigues") ;
    count($tableau);
    echo "le tableau appelé '\$tableau' contient ".count($tableau)." cases <br>";

    $x = 180;
    $y = 79.79;
    $annimoi = (1987/07/15);
    $annifrere = (1989/12/17);
    echo "le cosinus de ".$x." est ".cos($x). " <br>";
    echo "l'arc tangente de ".$x." est ".atan($x)." <br>";
    echo "la multiplication de ".$x." par ".$y." est ".$x*$y." <br>";
    echo "l'abs de ".$x." est ".abs($x)." <br>";
    echo "la racine carré de ".$x." est ".sqrt($x)." <br>";
    echo "le decbin de ".$x." est ".decbin($x)." <br>";
    echo "le decoct de ".$y." est ".decoct($y)." <br>";
    echo "le dechex de ".$y." est ".dechex($y)." <br>";
    echo  "génération de nombre aléatoire: ".mt_rand ( $y , $x );
    echo " <br>";
    echo date("H :i , A l")." <br>";
    echo "checkdate: ".checkdate( 01, 22, 2020);
    echo "combien de jours s'écoulent entre mon Anniversaire et celui de mon frère: ".date_diff($annifrere ,$annimoi)." <br>";

    $texte1=" .Une première chaine de caractères avec espace à gauche.";
    $texte2=".Une deuxième chaine de caractères avec espace à droite. ";
    $texte3=" .Une troisième chaine de caractères avec espaces à gauche et à droite. ";
    $courte="pouet pouet";

    echo ucwords($texte1) .trim($texte2) .trim($texte3);
    echo " <br>";
    echo $texte1.$texte2.$texte3;
    echo " <br>";
    echo strlen($courte) ;
    echo " <br>";

    $couleurs =("bleu jaune vert gris rouge blanc noir rose");
    $tabcouleur = explode(" ", $couleurs);
    echo  "affiche la couleur demandée à la place i du tableau : ".$tabcouleur[2];
    ?>

  </body>
</html>
