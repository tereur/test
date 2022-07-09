<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
function valider1() {
    donnees = document.getElementById("email");
   var url = "validemail?email="+donnees.value;
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
    	  mdiv.innerHTML="";
      } else {
         mdiv.innerHTML = "email deja utilise";
         mdiv.style.color="red";
      }
     
    }
  
}

function valide1(){
	    donnees = document.getElementById("email").value;
		var  mdiv = document.getElementById("validationMessage").innerHTML;
		if(mdiv=="email deja utilise" || !donnees.match(/[a-zA-Z0-9]+@gmail.com/) ){
			if(mdiv!="email deja utilise"){
				document.getElementById("validationMessage").style.color="red";
				document.getElementById("validationMessage").innerHTML ="email incorrect exemple <tt>abcdhjk@gmail.com</tt>";
			}
			return false;}
		
			return true;

}
//-->
</script>
<link href="css/dashboard.css" rel="stylesheet"/>
<%@ include file="link1.jsp" %>
<section>

	<div class="main">
	
<div class="content">
			<h3>Dashboard</h3>
<div  class="tab-content">
  <div class="tab-pane fade in active" >
    <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
  </div>
  </div>
  <br>
  <c:if test="${erreur=='succes'}">
  <div class="alert alert-success alert-dismissible" role="alert">
 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong>Succes!</strong> Ajout d'un Nouveau Administrateur avec succes.
</div>
</c:if>
<c:if test="${erreur2=='succes'}">
  <div class="alert alert-success alert-dismissible" role="alert">
 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong>Succes!</strong> operation effectuee avec succes.
</div>
</c:if>
<c:if test="${erreur=='erreur'}">
  <div class="alert alert-danger alert-dismissible" role="alert">
 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong>Oups!</strong> Email non existatnt ou deja Enregistrer.
</div>
</c:if>
<c:if test="${erreur2=='erreur'}">
  <div class="alert alert-danger alert-dismissible" role="alert">
 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong>Oups!</strong> une erreur est survenu lors de l'operation.
</div>
</c:if>

  <div class="row">
          
            <div id="accordion1" class="panel-group accordion transparent">
              <div class="panel">
                <strong style="margin-left:20%;">Ajout d'un nouveau Administrateurs</strong> <span class="open-sub"></span><a data-parent="#accordion1" data-toggle="collapse" href="#accordion11"  aria-expanded="false"><button class="btn btn-info"  style="margin-left:20%;">New admins</button>  </a> 
                 <br>
                 <div id="accordion11" class="panel-collapse collapse" role="tablist" aria-expanded="false" >
                  <div class="panel-content">
                   <p> <form method="post">
                    
              <input type="hidden" value="jgkg"  name="add">
				      <div class="input-group">
				        <span class="input-group-addon">@</span>
				        <input type="email" required class="form-control" name="email" onkeyup="valider1()" placeholder ="Entrer l'email" id="email" aria-describedby="inputGroupSuccess2Status">
				      </div>
				      <div id="validationMessage"></div>
				       <div class="form-group">
                          <label for="exampleInputEmail2">Phone Contact</label>
					      <input type="number" required class="form-control" name="mobile" id="inputEmail3" placeholder ="Entrer le contact" min=622000000 max=699999999>
					    </div>
                    <div class="radio">
					  <label>
					    <input type="radio" name="role" id="optionsRadios4" value="Admins" checked>
					    Admins
					  </label>
					  <label>
					    <input type="radio" name="role" id="optionsRadios4" value="SuperAdmins" >
					    SuperAdmins
					  </label><br>
					</div>
					<div align="center">
					<button type="submit" class="btn btn-info"  onclick="return valide1()">Confirm add</button>
                    </div>
                    </form></p>
                     </div>
                </div>
              </div>
          
          </div>
        </div>
  
  </br>
            <h4  align="center"> Liste Des Administrateurs </h4>
 </br>
<div class="table-responsive">
			<table class="table">
			
  <thead>
    <tr>
      <th scope="col" width="350px" >Email</th>
      <th scope="col" width="200px" >Phone</th>
      <th scope="col" width="200px" >Date</th>
      <th scope="col"  width="200px" >Grade</th>
      <th scope="col"  width="200px" >Status</th>
      <th scope="col" >Action</th>
    </tr>
  </thead>
  
  <tbody>
  <c:forEach var="user" items="${users}">
    <tr height="60px">
      <td data-label="Due Date"><img src="profil/index.png" class="tab-img">${user.email}</td>
      <td data-label="Amount">${user.phone}</td>
      <td data-label="Period">${user.date}</td>
      <td data-label="Due Date" >${user.role}</td>
      <td data-label="Amount" style="position: relative;"><span class="pe">Horsligne</span></td>
      <td ><button href="#promoModal2" data-lightbox="inline" onclick="promu('${user.email}')" ><i class="fa fa-gear ticon"></i></button>
 <button style="margin-left:1%" href="#promoModal1" data-lightbox="inline" onclick="deletes('${user.email}')"><i class="fa fa-angle-down ticon"></i></button></td> </tr>
     
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



<br>
<br>
<br>
<%@ include file="delete_admins.jsp" %>
<%@ include file="para_admins.jsp" %>
<%@ include file="footer1.jsp" %>