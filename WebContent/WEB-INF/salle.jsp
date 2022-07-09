<%@ include file="link1.jsp" %>
<script type="text/javascript">
<!--
var requete;
var donnees;
var erreur;

      
    //verification du formulaire  d ajout
      
function valider1() {
    donnees = document.getElementById("donnees");
   var url = "validersalle?valeur="+donnees.value;
   if (window.XMLHttpRequest) {
       requete = new XMLHttpRequest();
   } else if (window.ActiveXObject) {
       requete = new ActiveXObject("Microsoft.XMLHTTP");
   }
   requete.open("GET", url, true);
   requete.onreadystatechange = majIHM1;
   requete.send(null);
}

function majIHM1() {

  if (requete.readyState == 4 && requete.status == 200) {
      // exploitation des donn�es de la r�ponse
      var message = requete.responseText;
      mdiv = document.getElementById("validationMessage");
      if (message=="invalide") {
         mdiv.innerHTML = "not exist";
         mdiv.style.color="green";
      } else {
         mdiv.innerHTML = "exist";
         mdiv.style.color="red";
      }
     
    }
  
}

function valide1(){
	    donnees = document.getElementById("donnees").value;
		var  mdiv = document.getElementById("validationMessage").innerHTML;
		if(mdiv=="exist" || !donnees.match(/^[a-zA-Z]{1,}[0-9]{1,}$/) ){
			if(mdiv!="exist"){
				document.getElementById("validationMessage").style.color="red";
				document.getElementById("validationMessage").innerHTML ="nom mal saisir <tt>exemple <b>NS1</b></tt> commencer par une lettre et termine par une valeur";
			}
			return false;}
		
			return true;

}







//-->
</script>

<style>
    form{
    margin-top:3%;
    padding-left:3%;
    
    }
    .corps{
    margin:5% 5% 5% 5%;
    }
    .info {
font-style: italic;
color: #E8A22B;
} 
</style>

   <!-- Section: inner-header -->
    <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/resultats.jpg">
      <div class="container pt-70 pb-20">
        <!-- Section Content -->
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
              <h2 class="title text-white">Salle</h2>
              <ol class="breadcrumb text-left text-black mt-10">
                <li><a href="#">Salle</a></li>
                <li><a href="#">Nouveau</a></li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </section>

 
 <div class="corps">   
    
    <div  class="tab-content">
  <div class="tab-pane fade in active" >
    <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
  </div>
  </div>
  <br>
     <c:if test="${erreur=='succes'}">
  <div class="alert alert-success alert-dismissible" role="alert">
 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong>Succes!</strong> operation effectuer avec succes.
</div>
</c:if>

<c:if test="${erreur=='erreur'}">
  <div class="alert alert-danger alert-dismissible" role="alert">
 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong>Oups!</strong> nom de la salle deja existant ou une erreur c'est porduit.
</div>
</c:if>


  <div class="row">
          
            <div id="accordion1" class="panel-group accordion transparent">
              <div class="panel">
                <strong style="margin-left:20%; margin-top:5%">Ajout d'une nouvelle salle</strong> <span class="open-sub"></span><a data-parent="#accordion1" data-toggle="collapse" href="#accordion11"  aria-expanded="false"><button class="btn btn-info"  style="margin-left:20%;">New Room</button>  </a> 
                 <div id="accordion11" class="panel-collapse collapse" role="tablist" aria-expanded="false" >
                  <div class="panel-content">
                   <p> <form method="post" class="form-horizontal">
                   <input type="hidden" name="add" value="add"/>
         <div class="form-group">
              <label class="col-sm-2 control-label" for="amphi">nom de l'amphi</label>
                 <div class="col-sm-10">

                   <input id="donnees" type="text" required="" onkeyup="valider1()" autocomplete="off" class="form-control" name="nom" placeholder="entre la ou les salle(s)">  
                 <div id="validationMessage"></div>
                 </div>

   
         </div>
         
         <div class="form-group">
              <label class="col-sm-2 control-label" for="capacite">nombres de place assise</label>
                 <div class="col-sm-10">

                   <input id="capacite" type="number" min=30 class="form-control"  name="capacite" placeholder="entrer la capacite de la salle" required="">

           
             </div>
         </div>
         <div class="form-group" align="center">
         <p> Veuillez coches la ou les faculte quelle(s) appartiennent</p>
			         <label class="checkbox-inline">
			  <input type="checkbox" id="inlineCheckbox7" name="fac" value="FS"> FS
			</label>
			<label class="checkbox-inline">
			  <input type="checkbox" id="inlineCheckbox8" name="fac" value="FLSH"> FLSH
			</label>
			<label class="checkbox-inline">
			  <input type="checkbox" id="inlineCheckbox9" name="fac" value="FSEG"> FSEG
			</label>
			<label class="checkbox-inline">
			  <input type="checkbox" id="inlineCheckbox10" name="fac" value="FASA"> FASA
			</label>
			<label class="checkbox-inline">
			  <input type="checkbox" id="inlineCheckbox11" name="fac" value="FSJP"> FSJP
			</label>
			<label class="checkbox-inline">
			  <input type="checkbox" id="inlineCheckbox12" name="fac" value="FMSP"> FMSP
			</label>
         </div>
         
        <div align="center">
					<button type="submit" onclick="return valide1()"class="btn btn-info">Confirm add</button>
                    </div>
      </form>  </p>
                     </div>
                </div>
              </div>
          
          </div>
        </div>
 <br><br>
 <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
 <br>
    <table class="table">
  
  <thead>
    <tr>
      <th scope="col" >Nom</th>
      <th scope="col" >Capacite</th>
      <th scope="col" >Faculte Assigner</th>
      <th scope="col">Option</th>
   

    </tr>
  </thead>
  <tbody>
  
  <c:forEach var="salle" items="${salles}">
  <tr> 
 <td ><c:out value="${ salle.nom}" /></td>  <td ><c:out value="${ salle.capacite }" />
 </td> <td data-lightbox="inline"  id="td${salle.nom}"><c:forEach var="faculte"  items="${salle.fac}"><c:if test="${faculte!=' '}">${faculte}</c:if></c:forEach>
<td ><button href="#promoModal2" data-lightbox="inline" onclick="updates('${ salle.nom}','${ salle.capacite }')" class="btn btn-warning">update</button>
 <button style="margin-left:1%" href="#promoModal1" data-lightbox="inline" onclick="deletes('${salle.nom}')"class="btn btn-danger">delete</button></td> </tr>
        
        </c:forEach>
  
  </tbody>
  
  </table>
</div>              
<%@ include file="update_salle.jsp" %>
<%@ include file="delete_salle.jsp" %>           
<%@ include file="footer1.jsp" %>
                            