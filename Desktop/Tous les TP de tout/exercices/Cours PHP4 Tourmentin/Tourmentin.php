<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Tourmentin</title>
  </head>
  <body>
    <?php

  //On se connecte à MySQL et on sélectionne la base de données//
      $jeremstagiaire = mysqli_connect("localhost","root","","stagiaires");

  //On vérifie si on est bien connecté à la base de données//
      if ($jeremstagiaire)
      echo 'connexion ok';
      else {
        echo "connexion échouée";
      }

  //on crée la requête SQL//
      $sql = "SELECT sigle, adresse, logo FROM entreprises";



    ?>

  </body>
</html>
