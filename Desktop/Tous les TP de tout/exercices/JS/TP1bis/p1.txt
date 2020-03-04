/////////////////              EXERCICE 1            ////////////////////


valeurEntrees = [];
var valeur = 0;

while (valeur!=-1){
  var valeur=prompt("Saisir une valeur. Tapez -1 pour ne plus entrer de valeurs");
    if (isNaN(valeur)){
      alert("Vous n'avez pas saisi un nombre");
    }
    else if (valeur!=-1){
      valeurEntrees.push(valeur);
      console.log(valeurEntrees);
    }
    else {

    }
}

function addition(){
  var somme=0;
  for (i=0;i<valeurEntrees.length;i++){
    somme = parseInt(somme) + parseInt(valeurEntrees[i]);
  }
  return somme;

}
var moyenne = addition()/parseInt(valeurEntrees.length);
console.log(addition());
console.log(valeurEntrees.length);

alert ("La somme de toutes les valeurs saisies est : "+addition()+"\n"+"Et la moyenne est : "+moyenne+"\n"+"0");


//////////////////         EXERCICE 2        ///////////////////////
// if (isNaN(valeur)) {alert ("Vous n'avez pas saisi de nombre")};
