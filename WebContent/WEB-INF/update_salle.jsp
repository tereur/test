<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-12">

            <!-- popup modal -->
            <div id="promoModal2"   class="modal-promo-box mfp-hide bg-img-cover" >
           <div class='wow zoomIn' data-wow-duration='1.5s' style="background-color:white; padding:3% 3% 3% 3%;" data-wow-offset='10'>
              <h3 class="mt-0">Modification salle</h3>
              <div class='line-bottom mb-30'></div>
              <form method="post" align="center" class="form-horizontal" newsletter-form mt-30">
              <input type="hidden" name="update" id="update" value="update">
         <div class="form-group">
              <label class="col-sm-2 control-label" for="amphi">nom de l'amphi</label>
                 <div class="col-sm-10">

                   <input id="donneesupdate" disabled  type="text"   class="form-control" name="nom" >  
                 <div id="validationMessageupdate"></div>
                 </div>

   
         </div>
         
         <div class="form-group">
              <label class="col-sm-2 control-label" for="capacite">nombres de place assise</label>
                 <div class="col-sm-10">

                   <input id="capaciteupdate" type="number" min=30 class="form-control"  name="capacite" placeholder="entrer la capacite de la salle" required="">

           
             </div>
         </div>
         <div class="form-group" align="center">
         <p> Veuillez coches la ou les faculte quelle(s) appartiennent</p>
			         <label class="checkbox-inline">
			  <input type="checkbox" id="inlineCheckbox1"  name="fac" value="FS"> FS
			</label>
			<label class="checkbox-inline">
			  <input type="checkbox" id="inlineCheckbox2" name="fac" value="FLSH"> FLSH
			</label>
			<label class="checkbox-inline">
			  <input type="checkbox" id="inlineCheckbox3"  name="fac" value="FSEG"> FSEG
			</label>
			<label class="checkbox-inline">
			  <input type="checkbox" id="inlineCheckbox4"  name="fac" value="FASA"> FASA
			</label>
			<label class="checkbox-inline">
			  <input type="checkbox" id="inlineCheckbox5"  name="fac" value="FSJP"> FSJP
			</label>
			<label class="checkbox-inline">
			  <input type="checkbox" id="inlineCheckbox6"   name="fac" value="FMSP" > FMSP
			</label>
         </div>
         
        <div align="center">
					<button type="submit"  class="btn btn-info">Confirm update</button>
                    </div>
              </form>
            </div>
            </div>

  </div>
  <script type="text/javascript">
<!--
//verification du formulaire de mise a jour

function updates(a,b){
	document.getElementById("donneesupdate").value=a;
	document.getElementById("update").value=a;
	document.getElementById("capaciteupdate").value=b;
	fac=document.getElementById("td"+a).innerHTML;
	console.log(fac);
	tabfac=fac.split(" ");
	for(j=1; j<=6; j++){
	document.getElementById("inlineCheckbox"+j).checked=false;
	}
	for(j=1; j<=6; j++){
		check=document.getElementById("inlineCheckbox"+j);
	for(i=0; i< tabfac.length; i++){
		if(tabfac[i]!=""){
			if(check.value==(tabfac[i].replace("\n",""))){
				check.checked=true;
				
			}
			
			console.log(check.value+"="+tabfac[i].replace("\n","")+";");
		}
		
	}
	}
}

  //-->
  </script>