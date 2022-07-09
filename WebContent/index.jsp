     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
  <c:choose>
         
        <c:when test="${session==null}"> 
              <%@ include file="/WEB-INF/link.jsp" %>
              </c:when>
              <c:when test="${session!=null}"> 
              <%@ include file="/WEB-INF/link1.jsp" %>
              </c:when>
              
         </c:choose>
  <!-- Start main-content -->
  <div class="main-content">
    <!-- Section: inner-header -->
    <section  data-bg-img="images/bg/resultats.jpg">
      <div class="container pt-50 pb-50">
        <!-- Section Content -->
        <div class="section-content">
         
               <h3 class="title text-theme-colored">Home</h3>
              <ol class="breadcrumb text-left text-black mt-10">
                <li><a href="#">Uds</a></li>
                <li><a href="#">consulter ma salle</a></li>
                <li class="active text-gray-silver"> Emploi de temps</li>
              </ol>
            
        </div>
      </div>
    </section>
    
    <!-- Section: About -->
   
    <section>
      <div class="container pb-0">
        <marquee><p class="lead">REPARTITION DES ETUDIANTS DANS LES SALLES DURANT LES PERIODES D'EXAMENS <a href="http://daneden.github.io/animate.css/" target="_blank"></a> </p></marquee>
        
          <div class="heading-line-bottom mb-0">
          <h4 class="heading-title">fadeIn Animation</h4>
        </div>
        <div class="row">
          <div class="text-justify col-md-7 p-30 pl-20">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
          </div>
          <div class="col-md-5">
            <img class="wow zoomIn" data-wow-duration="1.5s" data-wow-offset="10" src="images/photos/campus.jpg" alt="ifheuggh" style="visibility:visible">
          </div>
        </div>
        <div class="heading-line-bottom mb-0">
          <h4 class="heading-title">fadeIn Animation</h4>
        </div>
        <div class="row">
          <div class="text-justify col-md-7 p-30 pl-20">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
          </div>
          <div class="col-md-5">
            <img class="wow zoomIn" data-wow-duration="1.5s" data-wow-offset="10" src="images/photos/campus.jpg" alt="ifheuggh" style="visibility:visible">
          </div>
        </div>
        <div class="heading-line-bottom mb-0">
          <h4 class="heading-title">fadeIn Animation</h4>
        </div>
        <div class="row">
          <div class="text-justify col-md-7 p-30 pl-20">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
          </div>
          <div class="col-md-5">
            <img class="wow fadeInLeftBig" data-wow-duration="2s" data-wow-offset="10" src="images/photos/ohot_edtdiantes_composer.jpg" alt="ifheuggh" style="visibility:visible">
          </div>
        </div>
        </div>
    
    </section>
       
  </div>
  <!-- end main-content -->
  
    <div class="foot">

    <br><table style="border-bottom-color: #006699;  margin: auto;">
        <tr>
            <td>   
            <a href="#">             

                <img  title="FASA -> Facult&eacute; d'Agronomie et des Sciences Agricoles" src="images/photos/fasa.png" border="0" width="69" alt="FASA" />
            </a>
            </td>

            <td>                
             <a href="#"> 
                <img   title="FLSH -> Facult&eacute; des Lettres et des Sciences Humaines" src="images/photos/flsh.png" border="0" width="69" alt="FLSH" />
             </a>
            </td>
			 <td>
			   <a href="#"> 
                <img  title="FMSP -> Facult&eacute; de M&eacute;decine et des Sciences Pharmaceutiques" src="images/photos/fmsp2.png" border="0" width="69" alt="FMSP" />
               </a>
            </td> 	

            <td>                
                <a href="#"> 
                    <img title="FS -> Facult&eacute; des Sciences" src="images/photos/fs.png" border="0" width="69" alt="FS" />
                </a>                
            </td>

            <td>                
                <a href="#"> 
                <img  title="FSEG -> Facult&eacute; des Sciences Economiques et de Gestion" src="images/photos/fseg.png" border="0" width="69" alt="FSEG" />
                 </a>
            </td>

            <td>                
              <a href="">
                <img   title="FSJP -> Facult&eacute; des Sciences Juridiques et Politiques" src="images/photos/fsjp.png" border="0" width="69" alt="FSJP" />
              </a>
            </td>

           		

        </tr>

    </table>
    <div class="cleaner"></div>
    </div>
<%@ include file="/WEB-INF/footer.jsp" %>