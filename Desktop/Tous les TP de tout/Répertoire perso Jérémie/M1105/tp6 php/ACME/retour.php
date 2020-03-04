<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Page retour</title>
  </head>
  <body>

    <?php
    $prenom = "Sylvie";
    $nom="Pesty";
    $mail="";

    $puboui="oui";
    $pubnon="non";

    $opt1="Enclume";
    $opt2="Patins à roulettes fusées";
    $opt3="Tremplin géant";
    $opt4="Rails de train";

    $choix1="Coyotte en peluche";
    $choix2="Coyotte en sucre";
    $choix3="Coyotte en plastique";

    echo "Merci ""$prenom $nom" "pour votre commande <br>";
      <br>
      "Conformément à votre commande, nous vous enverrons prochainement :<br>
      <br>
      - $opt2 <br>
      - $opt3 <br>
      <br>
      Nous n'oublierons pas votre cadeau : un $choix2 ... <br>
      ... ni de vous envoyer nos publicités (si $puboui) !! <br>
      <br>
      A bientôt sur notre site!";
    ?>

  </body>
</html>
