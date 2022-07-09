<c:if test="${sauve=='true'}">
<div class="content">
            <!-- popup modal -->
            <div id="promoModal3" align="center" class="modal-promo-box mfp-hide bg-img-cover" >
           <div class='wow zoomIn'  data-wow-duration='1.5s' style="background-color:white; padding:1% 1% 1% 1%;" data-wow-offset='10'>
              <h3 class="mt-0">Confirmation</h3>
              <h5 id="h52">Cette repartition existe deja souhaitez vous continuer</h5>
              
              <nav>
  <ul class="pager">
    <li><a href="Examens?nbre_fil=${nbre_fil}">Annuler</a></li>
    <li><button  class="btn btn-info" >Continuer</button> </li>
  </ul>
</nav> 
              
              
            </div>
            </div>
</div>
</c:if>