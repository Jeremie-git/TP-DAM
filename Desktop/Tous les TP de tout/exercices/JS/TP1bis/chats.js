function Chat(nom, couleur, age){
  this.nom = nom;
  this.couleur = couleur;
  this.age = age;
}
function ChatD(nom, couleur, age){
  this.nom = nom;
  this.couleur = couleur;
  this.age = age;
}

var lumo = new Chat ("Lumo","noir", 8);
var malo = new Chat ("Malo", "blanc", 3);
var pito = new Chat ("Pito", "orange", 6);
var teigne = new ChatD ("Teigne", "marron", 4);

Chat.prototype.miauler = function(){
console.log('Miaou !')  };
ChatD.prototype.miauler = function(){
console.log('uoaim !')  };


lumo.miauler();
malo.miauler();
pito.miauler();
teigne.miauler();
