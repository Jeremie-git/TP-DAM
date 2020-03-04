<!DOCTYPE html>
<html lang="fr">
<head>
  <title>Page résultat</title>
  <meta charset="utf-8" />
</head>

<body>
  <h2> Résultat de l'éxécution de script1.php</h2>
    <?php
    echo "<p>";
    if(!empty($_POST)) {
      $prenom = htmlentities($_POST['prenom']);
      $nom = htmlentities($_POST['nom']);
      echo "Bonjour $prenom $nom";
    }
    else {
        $prenom = htmlentities($_GET['prenom']);
        $nom = htmlentities($_GET['nom']);
        echo "Bonjour $prenom $nom";
    }
    echo "</p>";
    ?>
 </body>
</html>
