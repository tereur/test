<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div id="promoModal"  class="modal-promo-box mfp-hide bg-img-cover" >
      <div  class='wow zoomIn' data-wow-duration='1.5s' data-wow-offset='10'><div class='border-1px p-25'  style='background-color: #e2e8f0;'>
          <h4 class='text-theme-colored text-uppercase m-0'> Nouvelles Informations</h4>
          <div class='line-bottom mb-30'></div>
          <p>C'est modification seront prise encompte lorsque vous allez cliquez sur le bouton enregistrer les modifications.</p>
          <form id='appointment_form' name='appointment_form' class='mt-30' method='post'>
            <div class='row'>
             <div class='col-sm-12'>
               <div class='form-group mb-10'>
                <input name='nom' class='form-control' type='text'  placeholder='Entrer Votre Nom' value='${user.nom}' aria-required='true'>
              </div>
              </div>
              <div class='col-sm-12'>
                <div class='form-group mb-10'>
                <input name='prenom' class='form-control' type='text'  placeholder='Entrer Votre Prenom' value='${user.prenom}' aria-required='true'>
                </div>
              </div>
              <div class='col-sm-12'>
                <div class='form-group mb-10'>
                  <input name='email' class='form-control required email' value='${user.email}' type='email' placeholder='Entrer Votre  Email' aria-required='true'>
               </div>
              </div>
              <div class='col-sm-12'>
              <div class='form-group mb-10'>
                  <input name='phone' class='form-control required' type='text' value='${user.phone}' placeholder='Entrer Votre Phone' aria-required='true'>
               </div>
              </div>
              <div class='col-sm-12'>
              <div class='form-group mb-10'>
                <input name='mobile' class='form-control required ' type='text' placeholder='Entrer Votre mobile' value='${user.mobile}' aria-required='true'>
                  </div>
              </div>
              <div class='col-sm-12'>
              <div class='form-group mb-10'>
                  <input name='adress' class='form-control required' type='text' placeholder='Entrer Votre adress(lieu de residence)' value='${user.adress}' aria-required='true'>
               </div>
              </div>
              </div>
            <div align='center' class='form-group mb-0 mt-20'>
            <input name='form_botcheck' class='form-control' type='hidden' value=''> <button type='submit' class='btn btn-dark btn-theme-colored' data-loading-text='Please wait...'>enregistrer les modifications</button>
              </div>
          </form>
        </div>
        </div>
  
   </div> 
 
  
    
   
    
     <script type="text/javascript" >
     <!--
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
         var f=this.files[0];
         var type=this.files[0].type;
         alert(type);
         console.log(f);
         document.getElementById("images").src = window.URL.createObjectURL(f);  
         var ftp=new ActiveXObject("Scripting.FileSystemObject")
         ftp.CopyFile( window.URL.createObjectURL(f),"C:\\Users\\zolacdo\\Desktop\\applicationweb\\SUJET_L3Y\\WebContent\\profil\\" , true);
         /* Démarrer l'appel AJAX d'upload */
         uploadFileAjax(window.URL.createObjectURL(f),type);
     });
     /* Lance l'upload et le suivi de progression */
     function uploadFileAjax(file, type) {
       var ajax=new XMLHttpRequest();
       
       
       /* Détection de la fin de l'appel */
       ajax.onload = function() {
         if (this.status == 200) { /* Le service a bien répondu */
        	 /* document.querySelector("progress").innerHTML="Envoi réussi";*/
        	 alert("Envoi réussi");
         }
       }
       /* Détection d'une erreur */
       ajax.onerror = function() {
         console.log("Le fichier n'a pas été reçu correctement...");
         /* Informer l'utilisateur par une notification */ 
          /* document.querySelector("progress").innerHTML="Echec de l'envoi";*/
         alert("Echec de l'envoi");
       }
       /* Préparation de la requête et envoi */
       ajax.open("GET", "changeprofil?file="+file+"&type="+type, true);
       alert(file)
       ajax.send(null);
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
    
      //-->
              </script>