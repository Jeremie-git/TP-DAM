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

function addition(valeurEntrees){
  var somme=0;
  for (i=0;i<valeurEntrees.length;i++){
    somme = parseInt(somme) + parseInt(valeurEntrees[i]);
  }
  return somme;

}
var moyenne = addition(valeurEntrees)/parseInt(valeurEntrees.length);
console.log(addition(valeurEntrees));
console.log(valeurEntrees.length);

alert ("La somme de toutes les valeurs saisies est : "+addition(valeurEntrees)+"\n"+"Et la moyenne est : "+moyenne+"\n"+"0");
