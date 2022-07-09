 
              <%@ include file="link1.jsp" %>
              
            

<style>
/* menu de navigation repartition*/
.icon{
display:none;
}      
.aside_menu{
margin-bottom:5%;
}  
.ferme{
display:none;
}        
.rep_suiv{
    	

   width: 260px;
  position: absolute;
  top: 10;
  left: 0;
 
  background-image: url("images/2.PNG");
  z-index: 101;
  padding-left: 3%;
  padding-top: 1%;
  -webkit-transition: none;
  -o-transition: none;
  transition: none;
  
       } 
       .rep_suiv ,.rep_content{
       height:500px;
        margin-bottom:-1%;
       }
       
 .rep_suiv ul li{
 margin-bottom:5%;	

 }
 .rep_content{
 overflow-x:auto;
margin-top:1%;
  margin-left: 20%;
 
  padding: 3%;
 
 }
.rep_suiv_active{

}
.aside_menu{

}

@media only screen and (max-width : 991px) {
.rep_suiv{
    
display:none;    	
 width: 150px;
  position: absolute;
  top: 10;
  left: 0;
  height: auto;  
  z-index: 101;
 padding-left:0;
  padding-top: 0%;
  -webkit-transition: none;
  -o-transition: none;
  transition: none;
  background:cover;
       }
.icon{
display:block;
}        
 .rep_suiv ul li{
 margin-bottom:-10%;	

 }
.rep_suiv ul menuzord-menu{
background-color:none;
width: 15px;
left:0;
}
  .rep_content{
margin-top:1%;
margin-bottom:1%;
  margin-left: 5%;
 height:auto;
 
  padding: 3%;
 
 }
 
}
</style>


<script type="text/javascript">
<!--
var requete;
var donnees
var erreur
function valider(uv) {
	erreur=uv;
    donnees = document.getElementById("donnees"+uv);
   var url = "valider?valeur="+donnees.value;
   var url2 = "valider?valeur2="+donnees.value;
   if (window.XMLHttpRequest) {
       requete = new XMLHttpRequest();
       requete2 = new XMLHttpRequest();
   } else if (window.ActiveXObject) {
       requete = new ActiveXObject("Microsoft.XMLHTTP");
       requete2 = new ActiveXObject("Microsoft.XMLHTTP");
   }
   requete.open("GET", url, true);
   requete.onreadystatechange = majIHM;
   requete.send(null);
   requete2.open("GET", url2, true);
   requete2.onreadystatechange = majIHM2;
   requete2.send(null);
}



function majIHM2() {

	  if (requete.readyState == 4 && requete.status == 200) {
	      // exploitation des données de la réponse
	      var message = requete2.responseText;
	      mdiv = document.getElementById("sauve");
	      if (message=="invalide"){
	         mdiv.value ="true";
	      } else {
	         mdiv.value ="false";
	      }
	     
	    }
	  
	  
	}


function majIHM() {
	
  if (requete.readyState == 4 && requete.status == 200) {
      // exploitation des données de la réponse
      var message = requete.responseText;
      mdiv = document.getElementById("validationMessage"+erreur);
      if (message=="invalide") {
         mdiv.innerHTML = "not exist";
         mdiv.style.color="red";
      } else {
         mdiv.innerHTML = "exist";
         mdiv.style.color="green";
      }
     
    }
  
}


function valide(i){
	
		if(!duplicate(i)){
			return false;
		}else{
		for(var p=1; p<i+1; p++){
			
			var  mdiv = document.getElementById("validationMessage"+p).innerHTML;

			if(mdiv!="exist"){
				
				return false;}
			
			}

				return true;
		}

}


function duplicate(i){
	var j=1;
	while( j<=i){
		var prec=document.getElementById("donnees"+j);
		var k=j+1;
		var suiv=document.getElementById("donnees"+k);
		while( k<=i){
			var mdiv=document.getElementById("validationMessage"+j);
			if(prec.value==suiv.value){
				mdiv.innerHTML="code uv duplicate"
					mdiv.style.color="red";
				    return false;
			}
			
				
			
			k++;
		}
		j++;
	}
	return true;
}

function validesalle(){
   var ele=document.getElementsByName('salle');
   for(var i=0; i<ele.length; i++){
	   if(ele[i].checked){
		   return true;
	   }
   }
	return false;
}



function sauve(a){
	
	alert(a);
	if(a=="true")
	  return fasle;
	
	return true;
}


function continuer(){
	document.getElementById("from_sauve").submit();
}
//-->
</script>

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
                <li><a href="#">Nouveau</a></li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </section>
 <%@ include file="update_salle.jsp" %>
<%@ include file="delete_salle.jsp" %>  
<%@ include file="sauve_exist.jsp" %>  
  
   
    
    <!-- barre de taches a droite -->
    <div class="rep_suiv">
         <ul class="menuzord-menu ">
         
         <c:choose>
        <c:when test="${etape=='1'}"> 
              
              <li class="active"><a >CHARGE NOMBRE DE FILIERE</a></li> 
              </c:when>
              <c:when test="${etape!='1'}"> 
              <li ><a >CHARGE NOMBRE DE FILIERE</a></li> 
              </c:when>
              
         </c:choose>
         
          <c:choose>
         
        <c:when test="${etape=='2'}"> 
              <li class="active"><a >CHARGE LE CODE D'UV</a></li> 
              </c:when>
              <c:when test="${etape!='2'}"> 
              <li ><a >CHARGE LE CODE D'UV</a></li> 
              </c:when>
              
         </c:choose>
        
          <c:choose>
          
        <c:when test="${etape=='3'}"> 
              <li class="active"><a >CHARGER LES  SALLES</a></li> 
              </c:when>
              <c:when test="${etape!='3'}"> 
              <li ><a >CHARGER LES  SALLES</a></li> 
              </c:when>
             
         </c:choose>
          <c:choose>
         <c:when test="${etape=='4'}"> 
              <li class="active"><a >ENREGISTRER LA REPARTIRON</a></li> 
              </c:when>
              <c:when test="${etape!='4'}"> 
              <li ><a >ENREGISTRER LA REPARTIRON</a></li> 
              </c:when>
             
         </c:choose>
             
              
                          
            </ul>
    </div>
    <div class="rep_content">
     
    <c:if test="${etape=='1'}"> 
    <div class="info" id="fac">
    <form method="get" >   
      <div class="form-group">
    <label for="dure">Nombreux de filiere </label>
    <input type="number" class="form-control" id="dure" min=1 value="1" required max=3 title="entrer nombre de filiere" name="nbre_fil"placeholder="Entre le nombre de salle">
  </div>
        <br><br>   
        <nav>
  <ul class="pager">
    <li><button  class="btn btn-info">Suivant</button> </li>
  </ul>
</nav>  
   </form> 
    </div>
    </c:if>
    
 
    
    <c:if test="${etape=='2'}">
    <form method="get" > 
     <input type="hidden" name="sauve" id="sauve" value="aaaaa">
   
   <c:forEach var="i" begin="1" end="${nbre_fil }" step="1">
   <div class="form-group">
    <label for="dure">Entre l'uv${i} </label>
    <input type="text" class="form-control" id="donnees${i}"  onkeyup="valider('${i}');"  autocomplete="off" name="uv${i}" required="" placeholder="entre l'uv${i}">
    <label  id="validationMessage${i}"></label>
  </div>
</c:forEach>
<nav>
  <ul class="pager">
    <li><a href="Examens?examen=${session}">Previous</a></li>
    <li><button onclick="return valide(${nbre_fil })" class="btn btn-info">Suivant</button> </li>
  </ul>
</nav>    
   </form> 
    </c:if>
    
    
    <c:if test="${etape=='3'}">
        <c:if test="${erreur=='succes'}">
  <div class="alert alert-success alert-dismissible" role="alert">
 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong>Succes!</strong> operation effectuer avec succes.
</div>
</c:if>

<c:if test="${erreur=='erreur'}">
  <div class="alert alert-danger alert-dismissible" role="alert">
 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong>Oups!</strong> nom de la salle deja existant ou une erreur c est produit.
</div>
</c:if>
    <form method="get" >
     <c:forEach var="etudiant" items="${etudiants}">
    <label> le nombre d etudiant de l uv ${etudiant} </label><br/>
    </c:forEach>
   <label> veillez choisie les salles dans laquelle les repartir</label>
    <div class="table-responsive">
  <table class="table">
 <thead> <tr> <th>choix</th>    
 <th>nom de salle</th> 
 <th>capacite de salle</th> 
 <th>Action</th> </tr> 
 </thead> 
 <tbody>
 <c:forEach var="salle" items="${salles}">
  <tr> <th scope="row"><input type="checkbox" id="blankCheckbox" name="salle" value=${ salle.nom} aria-label="..."></th> 
 <td ><c:out value="${ salle.nom}" /></td>  <td ><c:out value="${ salle.capacite }" /></td>

  <td ><button href="#promoModal2" onclick="updates('${ salle.nom}','${ salle.capacite }')" data-lightbox="inline" class="btn btn-warning">update</button>
 <button style="margin-left:1%" href="#promoModal1" data-lightbox="inline"  onclick="deletes('${salle.nom}')"  class="btn btn-warning">delete</button></td> 
 <td id="td${salle.nom}"  style="display:none"><c:forEach var="faculte"  items="${salle.fac}"><c:if test="${faculte!=' '}">${faculte}</c:if></c:forEach>
</td>  
 </tr>
      
        </c:forEach>
 
   </tbody>
  </table>
</div>
<nav>
  <ul class="pager">
    <li><a href="Examens?nbre_fil=${nbre_fil}">Previous</a></li>
    <li><button onclick="return validesalle()" class="btn btn-info">Suivant</button> </li>
  </ul>
</nav> 
</form>
 </c:if>   
    
    <c:if test="${etape=='4'}">
    <form action="" id="from_sauve">
    
     ${affiche}
     <nav>
  <ul class="pager">
    <li><a href="Examens?nbre_fil=${nbre_fil}">Previous</a></li>
    <c:if test="${sauve=='true' }">
    <li><button href="#promoModal3" data-lightbox="inline" onclick="return sauve(${sauve});" class="btn btn-info">Sauvegarder</button> </li>
    </c:if>
    <c:if test="${sauve=='false' }">
    <li><button  class="btn btn-info">Sauvegarder</button> </li>
    </c:if>
  </ul>
</nav>
    </form>
    
    </c:if>
    
    <c:if test="${etape=='5'}">
    <form action="">
     <c:forEach var="pdf" items="${pdfs}">
     ${pdf}
     
     </c:forEach>
     <nav>
  <ul class="pager">
    <li><button class="btn btn-info"><a href="Examens?examen=${session}" >Terminer</a></button> </li>
  </ul>
</nav>
    </form>
    
    </c:if>
    
    
    </div>
  <!-- end main-content -->
 
  
<%@ include file="footer1.jsp" %>