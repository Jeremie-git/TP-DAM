function mafonction(){
  i=i*10;return (i+j);}
  var i,j;i=prompt("entrez une valeur");
  i=parseInt(i);
  j=parseInt(prompt("entrez une valeur"));
  r=mafonction();
  resultat=document.createTextNode("resultat:"+r);
  document.getElementById("h1").innerHTML="resultat : "+r;
  console.log(r);
