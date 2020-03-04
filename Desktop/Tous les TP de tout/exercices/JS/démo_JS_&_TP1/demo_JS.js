
//   alert("Aous a dit qu'on faisait une alerte qui dit qu'on utilise javascript, alors je créée l'alerte qui dit qu'on utilise javascript. L'alerte est créée dans son propre fichier et appelée dans le fichier html", message);
//
//   var message = ("Ceci est un test d'affichage de variable");
//   // alert (message);
//   var un = 65168;
//   var deux = "deuxième variable";
//   var trois = true;
//   var patate
//   = "Camille";
//
// console.log (message);
// console.log (typeof patate);
// console.log (un);
// console.log (typeof trois);

/////////////////////////////////////                     EXERCICE UN                           //////////////////////////////////


function frng(max){
   return Math.floor(Math.random(0) * Math.floor(max));
}
var rng=frng(11);
var nbEssai=0;

function tentativeRNG(nbEssaiMax){
  var reponsedial=prompt ("Vous avez "+nbEssaiMax+" essais pour deviner le nombre aléatoire, compris entre 0 et 10, généré par cette page." , "Essayez votre choix ici");
  while((reponsedial!=rng) && 1<nbEssaiMax){
  nbEssaiMax=nbEssaiMax-1;
  var  reponsedial=prompt ("Ce n'était pas ça. Il vous reste "+nbEssaiMax+" essais." , "Réessayez ici");
if (reponsedial>rng){
  alert ("Raté, votre choix est trop haut");
} else if (reponsedial<rng){
  alert ("Raté, votre choix ést trop bas");
} else {
  alert ("On a dit un nombre !");
}
}
if (reponsedial==rng){
  alert ("Bravo vous avez trouvé ! Le nombre a trouvé était bien "+rng);
}
else {
  alert ("Nombre de tentatives dépassé. Vous avez échoué. Il fallait deviner: "+rng);
}
}
console.log(rng);

//tentativeRNG(3);


//////////////////////////////                      EXERCICE DEUX                ////////////////////////////////


var france=['Paris', 'Lyon', 'Bordeaux', 'Chambéry', 'Meudon','Rouen','Nantes','Asnières','Genevilliers','Montpellier','Toulouse','Cannes','Nice'];
var canada=['Montréal','Toronto','Calgary','Québec','Ottawa','Vancouver','Whistler','Halifax','Edmonton','Calgary','Rosemont'];
var italie=['Rome','Milan','Turin','Florence','Venise',];
var allemagne=['Berlin','Munich','Krefeld','Mayence'];
var villesRestantesFrance = [];
var villesRestantesCanada = [];
var villesRestantesAllemagne = [];
var villesRestantesItalie = [];
var villesRestantes = [];
var villesEntreesFrance = [];
var villesEntreesCanada = [];
var villesEntreesAllemagne = [];
var villesEntreesItalie = [];
var villesEntrees = [];
    // function villeExiste(tableau,ville){
    //   for(var i=0; i<tableau.length;i++){
    //     if(tableau[i]===ville){
    //       return true;
    //     }
    //   }
    //   return false;
    // }
    //  if (villeExiste(France,ville)){
    //   alert("Bienvenue en France");
    // }
    // else if (villeExiste(Canada,ville)){
    //   alert ("Bienvenue au Canada");
    // }
    // else if (villeExiste(Italie,ville)){
    //   alert ("Bienvenue en Italie");
    // }
    // else if (villeExiste(Allemagne,ville)){
    //   alert ("Bienvenue en Allemagne");
    // }
    //  else {
    //   alert("Je ne connais pas "+ville)
    // }



//////////////////////////////////////////////////////////////////////////////////////////////////////
var champsVille = document.getElementById("champsVille");
var postclick=false;
// champsVille.value


function messageExisteOuPas(xExo1){
if (france.includes(xExo1)){
  alert("Bienvenue à "+xExo1+" en France");
}
else if(canada.includes(xExo1)){
  alert ("Bienvenue à "+xExo1+" au Canada");
}
else if(allemagne.includes(xExo1)){
  alert ("Bienvenue à "+xExo1+" en Allemagne");
}
else if(italie.includes(xExo1)){
  alert ("Bienvenue à "+xExo1+" en Italie");
}
else if(null){
  alert ("Vous n'avez pas saisi de destination");
}
else {
  alert ("Cette ville n'est pas dans mes donées");
}
}

function buttonClick1(){
  event.preventDefault();
  messageExisteOuPas(document.getElementById("champsVille").value);
}

////////////////////         EXERCICE 3           ///////////////////


function exo3RecherchePays(x){
if (france.includes(x)){
  for (var i=0;i<france.length;i++){
    if (x!=france[i]){
    villesRestantes[i]=france[i];
  }
  else {
    villesEntrees.push(x);
  }
  }
  return 'France';
}
else if(canada.includes(x)){
  for (var i=0;i<canada.length;i++){
    if (x!=canada[i]){
    villesRestantes[i]=canada[i];
  }
  else {
    villesEntrees[i]=canada[i];
  }
  }
  return 'Canada';
}
else if(allemagne.includes(x)){
  for (var i=0;i<allemagne.length;i++){
    if (x!=allemagne[i]){
    villesRestantes[i]=allemagne[i];
  }
  else {
    villesEntrees[i]=allemagne[i];
  }
  return 'Allemagne';
}
}
else if(italie.includes(x)){
  for (var i=0;i<italie.length;i++){
    if (x!=italie[i]){
    villesRestantes[i]=italie[i];
  }
    else {
      villesEntrees[i]=italie[i];
    }
    }
  return 'Italie';
}
else if(x==""){
  alert ("Vous n'avez pas saisi de destination");
}
else {
  alert ("Je ne connais pas cette ville");
}
}

function viderVilleRestantes(){
  for (i=0;i<villesRestantes.length;i++){
      villesRestantes[i]=null;
    }
}


function btnClicDest(){
  var divListeVille = document.createElement("div");
  divListeVille.setAttribute("id","divListeVille");
  var champsInput = document.createElement("input");
  champsInput.setAttribute("id","champsInput");
  champsInput.setAttribute("type","text");
  champsInput.setAttribute("placeholder","Votre choix");
  var text = document.createTextNode("Renseignez ici votre choix de destination ");
  var btn2 = document.createElement("button");
  btn2.setAttribute("id","btn2");
  btn2.setAttribute("type","button");
  btn2.setAttribute("onclick","btnClicFinal()");
  btn2.setAttribute("style","color:blue");
  var confirm = document.createTextNode("Confirmer");

  document.getElementById("Ex3").appendChild(divListeVille);
  document.getElementById("divListeVille").appendChild(text);
  document.getElementById("divListeVille").appendChild(champsInput);
  document.getElementById("divListeVille").appendChild(btn2);
  document.getElementById("btn2").appendChild(confirm);

  document.getElementById('triggerDestination').disabled=true;
  var retourInput = champsInput.value;
}

function btnClicFinal(){
  if(postclick){
    viderVilleRestantes();
    document.getElementById("listeUl").remove();
    var villeChoisie = document.getElementById("champsInput").value;
    var retourPays = exo3RecherchePays(villeChoisie);
    var ulVillesPossibles = document.createElement("ul");
    ulVillesPossibles.setAttribute("id","listeUl");
    document.getElementById("divDisplayVilles").appendChild(ulVillesPossibles);
    var confirmation = confirm("Etes vous sur de vouloir ajouter "+villeChoisie+" à votre liste de Destination ?");

    for (i=0;i<villesRestantes.length;i++){
      console.log(villesRestantes);
      console.log(villesEntrees);
      // if (villesRestantes[i] != villesEntrees[i]){
      if (!villesEntrees.includes(villesRestantes[i]) && villesRestantes[i]!=null){
        var ligneLi = document.createElement("li");
        var afficherVille = document.createTextNode(villesRestantes[i]);
        ulVillesPossibles.appendChild(ligneLi);
        ligneLi.appendChild(afficherVille);
      }

      else {

      }
    }
  }

  else{
    viderVilleRestantes();
    var villeChoisie = document.getElementById("champsInput").value;
    var retourPays = exo3RecherchePays(villeChoisie);
    var divDisplayVilles = document.createElement("div");
    divDisplayVilles.setAttribute("id","divDisplayVilles");
    var ulVillesPossibles = document.createElement("ul");
    ulVillesPossibles.setAttribute("id","listeUl");
    var textPreUl = document.createTextNode("Vous voulez voyager en "+retourPays+" . Pourquoi pas à :");

  for (i=0;i<villesRestantes.length;i++){
    if (villesRestantes[i] != null){
      var ligneLi=document.createElement("li");
      var afficherVille=document.createTextNode(villesRestantes[i]);
      ulVillesPossibles.appendChild(ligneLi);
      ligneLi.appendChild(afficherVille);
    }
  }

    document.getElementById("Ex3").appendChild(divDisplayVilles);
    divDisplayVilles.appendChild(textPreUl);
    divDisplayVilles.appendChild(ulVillesPossibles);
    // document.getElementById('btn2').disabled=true;
    document.getElementById("btn2").innerHTML="Ajouter une destination";
    console.log(villesRestantes);
    console.log(villesEntrees);
    postclick=true;
}
}
