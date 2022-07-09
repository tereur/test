<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="content">
            <!-- popup modal -->
            <div id="promoModal2" class="modal-promo-box mfp-hide bg-img-cover" >
           <div class='wow zoomIn'  data-wow-duration='1.5s' style="background-color:white; padding:3% 3% 3% 3%;" data-wow-offset='10'>
              <h3 class="mt-0">Promotion</h3>
              <h5 id="h51"></h5>
              <div style="display:flex" align="center" >
              <form id="mailchimp-subscription-form" style="margin-left:25%;"  method="post" newsletter-form mt-30">
              <input type="hidden" value="" id="compte1"  name="compte">
              <input type="hidden" value="Admins"  name="role">
              <input type="submit" title="rendre l utilisateur simple admins" value="Depromouvoir" class="btn btn-danger"/> 
              </form>
              <form id="mailchimp-subscription-form" style="margin-left:5%;" method="post" newsletter-form mt-30">
              <input type="hidden" value="" id="compte"  name="compte">
              <input type="hidden" value="SuperAdmins"  name="role">
              <input type="submit" title="rendre l utilisateur simple superadmins" value="Promouvoir" class="btn btn-success"/> 
              </form>
              </div>
            </div>
            </div>
</div>
 <script type="text/javascript">
<!-- 

function promu(a){
	document.getElementById("h51").innerHTML=" voulez vous Depremouvoir ou Premouvoir le compte "+ a;
	document.getElementById("compte").value=a;
	document.getElementById("compte1").value=a;
}
//-->
</script>