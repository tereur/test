/**
 * 
 */
var requete;

function valideruv(g) {
	alert("je suis bien entre");
   var donnees = document.getElementById("donnees");
   var url = "valideruv?valeur=" + escape(donnees.value);
   if (window.XMLHttpRequest) {
       requete = new XMLHttpRequest();
   } else if (window.ActiveXObject) {
       requete = new ActiveXObject("Microsoft.XMLHTTP");
   }
   requete.open("GET", url, true);
   requete.onreadystatechange = majIHM;
   requete.send(null);
}

function majIHM() {
  var message = "";

  if (requete.readyState == 4) {
    if (requete.status == 200) {
      // exploitation des données de la réponse
      var messageTag = requete.responseXML.getElementsByTagName("message")[0];
      message = messageTag.childNodes[0].nodeValue;
      mdiv = document.getElementById("validationMessage");
      if (message == "invalide") {
         mdiv.innerHTML = "<img src='images/invalide.gif'>";
      } else {
         mdiv.innerHTML = "<img src='images/valide.gif'>";
      }
    }
  }
}