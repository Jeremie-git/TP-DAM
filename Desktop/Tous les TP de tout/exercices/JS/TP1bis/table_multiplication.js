var valeur=0;
var lignes=0;
valeur=prompt("Veuillez saisir votre table de multiplication","ici");
lignes=prompt("Combien de lignes voulez vous afficher pour votre table de multiplication ?");


document.write('<table>');
document.write("<caption>Table de multiplication de "+valeur+"</caption");
document.write("<tr><th>Nombre à multiplier</th><th>Par</th><th>Votre choix de table</th><th>Est égal à</th><th>Résultat</th></tr>");
for (var i = 1; i <= lignes; i++) {
document.write("<tr><td>"+parseInt(i)+"</td><td>x</td><td>"+valeur+"</td><td>=</td><td>"+(parseInt(i))*(parseInt(valeur))+"</td></tr>")}
document.write("</table>");
