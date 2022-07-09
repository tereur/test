<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <div class="col-md-12">

            <!-- popup modal -->
            <div id="promoModal1" align="center" class="modal-promo-box mfp-hide bg-img-cover" >
             <div class='wow zoomIn' data-wow-duration='1.5s' style="background-color:white;" data-wow-offset='10'>
              <h3 class="mt-0">CONFIRMATION</h3>
              <h5 id="h5"></h5>
              <form id="mailchimp-subscription-form" method="post" newsletter-form mt-30">
              <input type="hidden" value="jgkg" id="delete" name="delete">
              <input type="submit" value="Confirmer" class="btn btn-danger"/> 
              </form>
            </div>
            </div>

  </div>
  
  
 <script type="text/javascript">
<!-- 
  // bouton supprimer
function deletes(a){
	document.getElementById("h5").innerHTML=" voulez vous vaiment supprimer la salle "+ a;
	document.getElementById("delete").value=a;
	
}
//-->
</script>