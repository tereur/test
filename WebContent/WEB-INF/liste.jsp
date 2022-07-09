<%@ include file="link1.jsp" %>
<link href="css/dashboard.css" rel="stylesheet"/>
<!-- Section: inner-header -->
    <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/resultats.jpg">
      <div class="container pt-70 pb-20">
        <!-- Section Content -->
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
              <h2 class="title text-white">Examen</h2>
              <ol class="breadcrumb text-left text-black mt-10">
                <li><a href="#">Examen</a></li>
                <li><a href="#">Liste</a></li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </section>
   <section>
   <div class="main">
	
<div class="content"> 
<h1>Upload de fichiers via AJAX</h1>
<form id="form1" name="monForm">
<div class="bloc">
<label>Choisissez votre photo :</label>
</div>
<div id="depose">Déposez votre image ou cliquez pour la choisir</div>
<input type="file" name="monFichier" id="file" accept="image/*" required  style="display:none"/>
<div class="bloc" id="preview"></div>
</form>
<div  class="tab-content">
  <div class="tab-pane fade in active" >
    <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
  </div>
  </div>
  <br>
 
<div class="table-responsive">
			<table class="table">
			
  <thead>
    <tr>
      <th scope="col"  >Uv</th>
      <th scope="col"  >Salle</th>
      <th scope="col" >Session</th>
      <th scope="col"   >User</th>
      <th scope="col"   >Date</th>
      <th scope="col" >Action</th>
    </tr>
  </thead>
  
  <tbody>
  <c:forEach var="eva" items="${evas}">
    <tr height="60px">
      <td data-label="Amount">${eva.uvs}</td>
      <td data-label="Period">${eva.salles}</td>
      <td data-label="Due Date" >${eva.email}</td>
      <td data-label="Due Date" >${eva.sessionEva}</td>
      <td data-label="Due Date" >${eva.date}</td>
      <td ><a href="${eva.nomeva}" class="btn btn-info"  target="_blank"> Dowload</a> <button class="btn btn-danger" > Delete</button></td> 
      </tr>
     
</c:forEach>
   <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
  </tbody>
  
  
</table>
</div>
<br>
<br>

<nav>
  <ul class="pager">
    <li><a href="#">Previous</a></li>
    <li><a href="#">Next</a></li>
  </ul>
</nav>
</div>
</div>
</section>

<script>
var depose=document.getElementById("depose");
/* Gestion du clic */
depose.addEventListener("click", function(evt) {
  evt.preventDefault();
  document.getElementById("file").click();
});
/* Gestion du DRAG AND DROP */
depose.addEventListener("dragover", function(evt) {
  evt.preventDefault(); /* Pour autoriser le drop par JS */
});
depose.addEventListener("dragenter", function(evt) {
  this.className="onDropZone"; /* Passe en surbrillance */
});
depose.addEventListener("dragleave", function(evt) {
  this.className=""; /* La surbrillance s'efface */
}); 
depose.addEventListener("drop", function(evt) {
  evt.preventDefault();
  /* Tranfert de la liste des fichiers du drag and drop dans input file */
  document.getElementById("file").files=evt.dataTransfer.files;
  this.className=""; /* Surbrillance supprimée */
});
document.getElementById("file").addEventListener("change", function(evt){
  var p=document.getElementById("preview"); /* Bloc d'affichage de la liste des fichiers */
  p.innerHTML=""; /* Effacer le contenu initial de #preview */
  for (var i=0; i<this.files.length; i++) {
    var f=this.files[i];
    /* Créer les élements de prévisualisation */
    var div=document.createElement("div");
    div.className="fichier";
    var span=document.createElement("span");
    span.innerHTML=f.name+" ("+getHumanSize(f.size)+")";
    var vignette=document.createElement("img");
    vignette.src = window.URL.createObjectURL(f); 
    var barre=document.createElement("div"); /* Barre de progression */
    barre.className="progress";
    barre.setAttribute("id", "progress"+i);
    barre.innerHTML="<span class=\"progress\" style=\"width:0%\"></span>";
    var clear=document.createElement("div");
    clear.className="clear";
    /* Attacher les élements HTML au DOM */
    div.appendChild(vignette);
    div.appendChild(span);
    div.appendChild(barre);
    div.appendChild(clear);
    p.appendChild(div);
    /* Démarrer l'appel AJAX d'upload */
    uploadFileAjax(f, i);
  }
  p.style.display="block";  
});
/* Lance l'upload et le suivi de progression */
function uploadFileAjax(file, numero) {
  var ajax=new XMLHttpRequest();
  
  /* Ajout du suivi de la progression */
  ajax.upload.onprogress = function(evt) {
    /* Le navigateur supporte le suivi de progression */
    if (evt.lengthComputable) { 
      var pct = (evt.loaded / evt.total) * 100;
      var bar=document.querySelector("#progress"+numero).querySelector("span");
      bar.style.width=Math.round(pct)+"%";
      console.log(pct + " % envoyé");
    }
  };
  
  /* Détection de la fin de l'appel */
  ajax.onload = function() {
    if (this.status == 200) { /* Le service a bien répondu */
      document.querySelector("div#progress"+numero).innerHTML="Envoi réussi";
    }
  }
  /* Détection d'une erreur */
  ajax.onerror = function() {
    console.log("Le fichier n'a pas été reçu correctement...");
    /* Informer l'utilisateur par une notification */ 
      document.querySelector("div#progress"+numero).innerHTML="Echec de l'envoi";
  }
  /* Préparation de la requête et envoi */
  ajax.open("POST", "/api/uploadFileAjax.php", true);
  var data=new FormData();
  data.append("monFichier", file);
  ajax.send(data);
}
/* Retourne une taille de fichier en mode lisible par un humain */
function getHumanSize(s) {
  s=parseInt(s); /* Pour s'assurer que le paramètre d'entrée est entier */
  if (s<1024) {
    return s+" o";  
  } else if (s<1024*1024) {
    return (s/1024).toFixed(1)+" ko";  
  } else if (s<1024*1024*1024) {
    return (s/1024/1024).toFixed(1)+" Mo";  
  } else {
    return (s/1024/1024/1024).toFixed(1)+" Go";  
  }
}
</script>
<style>

/* CSS de la zone de dé;pose drag and drop */    
div#depose {
  height:80px;
  font-size:20px;
  line-height: 80px;
  color:#999;    
  text-align: center;
  padding:10px;
  margin:10px;
  border:2px dashed #999;
  border-radius: 5px;
  overflow: hidden;
  cursor: pointer;
}    
div#depose.onDropZone {
  color:#000;
  border:5px solid #6f6;
  padding:7px;
}    
/* CSS pour la pré;visualiation des images sé;lectionné;es */
div#preview {
  display:none;
}
div.fichier {
  padding:5px;
  background: #ccc;    
  margin-top:1px;
}
div.fichier img {
  max-height: 80px;
  max-width: 80px;
  margin-right:10px;
  vertical-align: middle;
  float:left;
}
div.clear {
  clear:both;
}
/* CSS de la barre de progression */
div.progress {
  display:block;
  width:200px;
  height:15px;
  border:1px solid #666;
  padding:3px;    
  margin:4px;
  margin-left: 90px;
  border-radius: 4px;
  background-color:#fff;
}
div.progress span.progress {
  display:block;
  background-color:#0b4bd8;
  height:15px;
}
</style>
<%@ include file="footer1.jsp" %>