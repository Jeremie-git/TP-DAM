<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Merci d'avoir passé commande chez nous!</title>
  </head>
  <body>

    <?php
    $prenom = $_GET['L2'];
    $nom = $_GET['L1'];
    $mail = $_GET['L3'];

    $choix= $_GET["coyotte"];


    echo "Merci  <strong>" .$prenom ." ".$nom ."</strong> pour votre commande <br>";
    echo "<br>";
    if (isset($_GET["C1"])||isset($_GET["C2"])||isset($_GET["C3"])||isset($_GET["C4"])){
    echo "Conformément à votre commande, nous vous enverrons prochainement :<br>";
    if (isset ($_GET["C1"])){
      echo "-<strong>Une enclume </strong><br>";
    }
    if (isset ($_GET["C2"])){
      echo "-<strong>Des patins à roulettes à fusées </strong><br>";
    }
    if (isset ($_GET["C3"])){
      echo "-<strong>Un tremplin géant </strong><br>";
    }
    if (isset ($_GET["C4"])){
      echo "-<strong>Des rails de train </strong><br>";
    }
  }

  echo "<br>";

      echo  "Nous n'oublierons pas votre cadeau : un <strong>".$choix. "</strong>... <br>";


    if($_GET["OPT"] == "oui")
      {
          echo("...ni de vous envoyer nos publicités <br>");
      }
      else if ($_GET["OPT"] == "non")
      {
          echo(" ");
      }


    echo "<br>A bientôt sur notre site!";
    ?>

  </body>
</html>
