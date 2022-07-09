/**
 * 
 */
<!--
 $("#appointment_form").validate({
    submitHandler: function(form) {
      var form_btn = $(form).find('button[type="submit"]');
      var form_result_div = '#form-result';
      $(form_result_div).remove();
      form_btn.before('<div id="form-result" class="alert alert-success" role="alert" style="display: none;"></div>');
      var form_btn_old_msg = form_btn.html();
      form_btn.html(form_btn.prop('disabled', true).data("loading-text"));
      $(form).ajaxSubmit({
        dataType:  'json',
        success: function(data) {
          if( data.status == 'true' ) {
            $(form).find('.form-control').val('');
          }
          form_btn.prop('disabled', false).html(form_btn_old_msg);
          $(form_result_div).html(data.message).fadeIn('slow');
          setTimeout(function(){ $(form_result_div).fadeOut('slow') }, 6000);
        }
      });
    }
  });

  document.getElementById("edit").style.display="none";
  
  function edit(){
    document.getElementById("edit").style.display="block";
    document.getElementById("edit").innerHTML="<div class='border-1px p-25' class='wow rotateIn' data-wow-duration='1.5s' data-wow-offset='10' style='background-color: #e2e8f0;'>"+
    "<a class='btn btn-info' onclick='ferme()'>x</a>"+
    "<h4 class='text-theme-colored text-uppercase m-0'>Make an Appointment</h4>"+
    "<div class='line-bottom mb-30'></div>"+
    "<p>c est modification seront prise encompte lorsque vous allez cliquez sur le bouton enregistrer les modifications.</p>"+
    "<form id='appointment_form' name='appointment_form' class='mt-30' method='post'>"+
      "<div class='row'>"+
        "<div class='col-sm-12'>"
          "<div class='form-group mb-10'>"+
            "<input name='nom' class='form-control' type='text' required='' placeholder='Enter Name' value='${user.nom}' aria-required='true'>"+
          "</div>"
        +"</div>"
        +"<div class='col-sm-12'>"
          +"<div class='form-group mb-10'>"
            "<input name='prenom' class='form-control' type='text' required='' placeholder='Enter Name' value='${user.prenom}' aria-required='true'>"+
          +"</div>"
        +"</div>"
        +"<div class='col-sm-12'>"
          +"<div class='form-group mb-10'>"
            +"<input name='email' class='form-control required email' type='email' placeholder='Enter Email' aria-required='true'>"
         +"</div>"
        +"</div>"
        +"<div class='col-sm-12'>"
        +"<div class='form-group mb-10'>"
            +"<input name='form_phone' class='form-control required' type='text' placeholder='Enter Phone' aria-required='true'>"
         +"</div>"
        +"</div>"
        +"<div class='col-sm-12'>"
        +"<div class='form-group mb-10'>"
            "<input name='form_appontment_date' class='form-control required date-picker' type='text' placeholder='Appoinment Date' aria-required='true'>"
            +"</div>"
        +"</div>"
        +"<div class='col-sm-12'>"
        +"<div class='form-group mb-10'>"
            +"<input name='form_appontment_time' class='form-control required time-picker' type='text' placeholder='Appoinment Time' aria-required='true'>"
         +"</div>"
        +"</div>"
        +"</div>"
        +"<div class='form-group mb-10'>"+
        "<textarea name='form_message' class='form-control required'  placeholder='Enter Message' rows='5' aria-required='true'></textarea>"
        +"</div>"
      +"<div class='form-group mb-0 mt-20'>"
      +"<input name='form_botcheck' class='form-control' type='hidden' value=''> <button type='submit' class='btn btn-dark btn-theme-colored' data-loading-text='Please wait...'>enregistrer les modifications</button>"
        +"</div>"
    +"</form>"
  +"</div>";
}
  function ferme(){
    document.getElementById("edit").style.display="none";
}
//-->