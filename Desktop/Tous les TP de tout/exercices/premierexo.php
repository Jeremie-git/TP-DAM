<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>TEST PHP</title>
  </head>
  <body>

    <?php
    // définir la constante
    const VERSION = 'PHP 5.3';

    // définir des variables
    $TEXTE = "Bonjour le monde";
    $a = 5 ;
    $b = 11 ;
    $c = 32.7 ;
    $d = 63.3 ;

    // définir un tableau trigonométrique
    $tableauun = array(0.5, 1.5, 1.44, 0.1);

    //définir un tablau associatif
    $tableaupays= array(
      "Europe" => "France",
      "Asie" => "Japon",
      "Amérique du Nord" => "Canada"
    );
    $tableaucapitale= array(
      "France" => "Paris",
      "Allemagne" => "Berlin",
      "Angleterre" => "Londres",
      "Espagne" => "Madrid",
      "Italie" => "Rome" ,
      "Finlande" => "Helsinki",
      "Japon" => "Tokyo",
      "Canada" => "Ottawa"
    );

    //définir un texte qui aura les lettre initiale en majuscule
    $phraseenmaj = 'ce texte devra avoir des majuscules à chaque mot';

    // afficher la constante
    echo '' . $TEXTE;
    echo '<br>' .VERSION;

    // définir un calcul
    $resultat1= $a / $a * $c - $d;
    $resultat2= $a + $c * $d * $a;
    $resultat3= ($c + $b) / ($b - $a);
   echo "<br>".$resultat1;
   echo '<br>'.$resultat2;
   echo '<br>'.$resultat3;

   //afficher un tableau trigonométrique
   echo '<br>' ;
   for($i=0;$i<4;$i++){
   echo '  '.$tableauun[$i];
}
  //afficher un tableau associatif
  echo '<br>';
  foreach ($tableaupays as $key => $value) {
      echo ' '.'continent : '.$key.' et pays : '.$value ;
      // .$tableaupays;
  }
  // For($i = 0; $i < count($tableaupays); $i++){
  // echo '  '.$tableaupays[$i];
  // }
  echo '<br>';
  echo "La plus beau pays en Europe est " .$tableaupays['Europe'] ." dont la capitale est " .$tableaucapitale['France'];

  //afficher une phrase en majuscules initiales
  echo '<br>';
  echo ucwords($phraseenmaj);
  echo '<br>';
  echo ucfirst('test pour voir');
  echo '<br>';
  echo "PHP est en version " .phpversion();

     ?>
  </body>
</html>
