var champ = document.getElementById("zone_affichage");
var saisie = champ.value;
var memory = 'undefined';
var edition = false;
var boutonsLibres = document.getElementsByClassName("bouton_libre");


// Vide la zone d'affichage quand on appuie sur le bouton CE//
function rab(){
  champ.value="";
}

function init(){
  var boutonsSimples=document.getElementsByClassName("bouton_simple");
  var boutonsClassiques=document.getElementsByClassName("bouton_classique");
for (i=0;i<boutonsSimples.length;i++) {
  // if(boutonsSimples[i].getAttribute("class","bouton_libre")){
  // }
  // else {
  boutonsSimples[i].setAttribute("id","btn"+boutonsSimples[i].value);
  boutonsSimples[i].setAttribute("onclick",("afficheBtn(this)"));
// }
}
for (i=0;i<boutonsClassiques.length;i++){
  boutonsClassiques[i].setAttribute("ondrop",("return false"));
}
}

// La touche "=" affiche le résultat de l'opération saisie dans la zone d'affichage//
function calcul(){
  var champ = document.getElementById("zone_affichage");
  var saisie = champ.value;
  var car;
  try {
    champ.value=eval(saisie);
    }
    catch(error) {
      alert("NON ! Ca ne marche pas parceque : "+error);
}
}

function afficheBtn(bouton){
  var saisie = champ.value;
    // console.log(bouton.value);
  champ.value=saisie+bouton.value;
}

function plusMoins(){
  var saisie = champ.value;
  champ.value="-"+saisie;
}

function rangeMemory(){
var saisie = champ.value;
var regex = new RegExp(/^-?\d+\.?\d*$/);
  if (regex.test(saisie)){
    memory=champ.value;
    console.log(champ+" est la valeur de champ");
    console.log(memory+" est stocké en mémoire");
  }
  else {
    alert ("On ne peut stocker qu'un nombre !");
  }
}

function afficheMemory(){
  var saisie=champ.value;
  if (memory == "undefined"){
    alert("Aucune valeur n'est stockée dans le bouton MS");
  }
  else {
    champ.value=saisie+memory;
  }
}

function razMemory(){
  memory = "undefined";
  console.log("plus aucune valeur en mémoire");
}

function fix(bouton){
  for (i=0;i<boutonsLibres.length;i++){
    boutonsLibres[i].setAttribute("type","button");
    boutonsLibres[i].removeAttribute("ondblclick");
    boutonsLibres[i].setAttribute("ondblclick","edit(this)");
  }
  save();
}

function edit(bouton){
  for (i=0;i<boutonsLibres.length;i++){
    boutonsLibres[i].setAttribute("type","text");
    boutonsLibres[i].removeAttribute("ondblclick");
    boutonsLibres[i].setAttribute("ondblclick","fix(this)");
  }
}

function modeCalcul(){
  edition = false;
  document.getElementById("E").style.color="black";
  document.getElementById("E").style.background="lightgrey";
  for (i=0;i<boutonsLibres.length;i++){
  boutonsLibres[i].setAttribute("type","button");
  boutonsLibres[i].removeAttribute("ondblclick");
  boutonsLibres[i].setAttribute("onclick","afficheBtn(this)");
}
}

function modeEdition(){
  if (edition === false){
    edition = true;
    document.getElementById("E").style.background="red";
    document.getElementById("E").style.color="white";

    var boutonsLibres = document.getElementsByClassName("bouton_libre");
    for (i=0;i<boutonsLibres.length;i++){
      boutonsLibres[i].removeAttribute("onclick");
      boutonsLibres[i].setAttribute("ondblclick","edit(this)");
    }
  }
  else {
    modeCalcul();
  }
}

function deplacementBas(){
  var calc = document.getElementById("calc");
  var zoneAffichage = document.getElementById("zone_affichage");
  calc.appendChild(zoneAffichage);
  zoneAffichage.removeAttribute("ondblclick");
  zoneAffichage.setAttribute("ondblclick","deplacementHaut()");
}

function deplacementHaut(){
  var ligneAffichage = document.getElementById("ligne_affichage");
  var zoneAffichage = document.getElementById("zone_affichage");
  ligneAffichage.appendChild(zoneAffichage);
  zoneAffichage.removeAttribute("ondblclick");
  zoneAffichage.setAttribute("ondblclick","deplacementBas()");
}

document.addEventListener("dragstart", function(event) {
  event.dataTransfer.setData("Text", event.target.id);
  event.target.style.color = "red";
  event.target.style.opacity = "0.8";
});

document.addEventListener("dragenter", function(event) {
  if ( event.target.className == "bouton_simple bouton_libre") {
    event.target.style.background = "green";
  }
});

document.addEventListener("dragleave", function(event) {
  if ( event.target.className == "bouton_simple bouton_libre") {
    event.target.style.background = "lightgrey";
  }
});

document.addEventListener("dragend", function(event) {
  event.target.style.opacity = "1";

});

document.addEventListener("dragover", function(event) {
  event.preventDefault();
});

document.addEventListener("drop", function(event) {
  // event.preventDefault();
  if ( event.target.className == "bouton_simple bouton_libre" ) {
    var data = event.dataTransfer.getData("Text");
    event.target.appendChild(document.getElementById(data));
    event.target.style.background="lightgrey";
}
  if(event.target.className == ""){

  }
});


// function save(){
//   function setCookie(nom, valeur, expire, chemin, domaine, securite){
//      document.cookie = nom + ' = ' + escape(valeur) + '  ' +
//                ((expire == undefined) ? '' : ('; expires = ' + expire.toGMTString())) +
//                ((chemin == undefined) ? '' : ('; path = ' + chemin)) +
//                ((domaine == undefined) ? '' : ('; domain = ' + domaine)) +
//                ((securite == true) ? '; secure' : '');
//    }
// }
