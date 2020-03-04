<?php
// affectation
$a="bonjour \n";
?>
------------------------------
affichage de chaînes de caractères
------------------------------
<?php
/* affichage, concaténation de chaînes de caractères,
caractère d'échappement */
echo "valeur de \$a : $a";
echo "valeur de".' $a : '.$a;
echo "valeur de $"."a : ".$a;
?>
------------------------------
------------------------------
instruction conditionnelle
------------------------------
<?php
echo "valeur de \$a : $a";
$a=45;
echo "valeur de \$a : $a \n";
$b=12;
echo "valeur de \$b : $b \n";

// instruction conditionnelle
if ($a>$b) { echo "le maximum est : \$a\n"; }
else { echo "le maximum est : \$b\n";}
// initialisation d'un tableau $tab
$tab=array(15,"chat",-6.3,'a');
?>
------------------------------
------------------------------
parcours du tableau $tab avec un "for"
------------------------------
<?php
for ($i = 0; $i<count($tab); $i++) {
	echo "$i : ";
    echo $tab[$i];
	echo "\n";
}
?>
------------------------------
------------------------------
parcours du tableau $tab avec foreach (forme 1) 
------------------------------
<?php
// parcours avec foreach (forme 1)
foreach ($tab as $v) {
    echo "$v";
	echo "\n";
}
?>
------------------------------
------------------------------
parcours du tableau $tab avec foreach (forme 2) 
------------------------------
<?php
// parcours avec foreach (forme 2)
foreach ($tab as $k=>$v) {
	echo "$k : ";
	echo $v;
    echo "\n";
}
?>
------------------------------
------------------------------
parcours du tableau $menu avec foreach (forme 2) 
------------------------------
<?php
// initialisation d'un tableau $menu avec des indices non numériques
$menu=array("entrée"=>"salade composée","plat"=>"émincée de volaille","dessert"=>"tarte maison");
// parcours avec foreach (forme 2)
foreach ($menu as $k=>$v) {
	echo "$k : ";
	echo $v;
    echo "\n";
}
?>
------------------------------

