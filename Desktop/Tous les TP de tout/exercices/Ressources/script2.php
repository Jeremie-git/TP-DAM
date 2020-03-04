<!DOCTYPE html>
<html lang="fr">
<head>
  <title>Page résultat</title>
  <meta charset="utf-8" />
</head>

<body>
  <h1> Les paramètres reçus par le serveur sont : </h1>
  <!--   Génration de la liste ul -->
  <?php
    echo "<ol>";
        foreach($_GET as $key => $value) {
          echo "<li> <strong>$key</strong> : ", htmlentities($value), "</li>";
        }
    echo "</ol>";
  ?>
 </body>
</html>
