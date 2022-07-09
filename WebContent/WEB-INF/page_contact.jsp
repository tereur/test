   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
  <c:choose>
         
        <c:when test="${session==null}"> 
              <%@ include file="/WEB-INF/link.jsp" %>
              </c:when>
              <c:when test="${session!=null}"> 
              <%@ include file="/WEB-INF/link1.jsp" %>
              </c:when>
              
         </c:choose>

    
   <!-- Section: inner-header -->
    <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/resultats.jpg">
      <div class="container pt-70 pb-20">
        <!-- Section Content -->
        <div class="section-content">
          <div class="row">
            <div class="col-md-12">
              <h2 class="title text-white">Contact</h2>
              <ol class="breadcrumb text-left text-black mt-10">
                <li><a href="#">Home</a></li>
                <li><a href="#">Pages</a></li>
                <li class="active text-gray-silver">Page Title</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </section>
  
    <!-- Divider: Contact -->
    <section class="divider layer-overlay overlay-white-9" data-bg-img="images/bg/resultats.jpg">
      <div class="container">
        <div class="row pt-30">
          <div class="col-md-8">
            <h3 class="line-bottom mt-0 mb-20">Interested in discussing?</h3>
            <!-- Contact Form -->
            <form id="contact_form" name="contact_form" class="form-transparent" action="https://html.kodesolution.live/s/studypress/v6.0/demo/includes/sendmail.php" method="post">
              <div class="row">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="form_name">Name <small>*</small></label>
                    <input name="form_name" class="form-control" type="text" placeholder="Enter Name" required="">
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="form_email">Email <small>*</small></label>
                    <input name="form_email" class="form-control required email" type="email" placeholder="Enter Email">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="form_name">Subject <small>*</small></label>
                    <input name="form_subject" class="form-control required" type="text" placeholder="Enter Subject">
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="form_phone">Phone</label>
                    <input name="form_phone" class="form-control" type="text" placeholder="Enter Phone">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="form_name">Message</label>
                <textarea name="form_message" class="form-control required" rows="5" placeholder="Enter Message"></textarea>
              </div>
              <div class="form-group">
                <input name="form_botcheck" class="form-control" type="hidden" value="" />
                <button type="submit" class="btn btn-dark btn-theme-colored btn-flat mr-5" data-loading-text="Please wait...">Send your message</button>
                <button type="reset" class="btn btn-default btn-flat btn-theme-colored">Reset</button>
              </div>
            </form>
            <!-- Contact Form Validation-->
            <script type="text/javascript">
              $("#contact_form").validate({
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
            </script>
          </div>
          <div class="col-md-4">
            <div class="row">
              <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="icon-box left media bg-black-333 p-25 mb-20"> <a class="media-left pull-left" href="#"> <i class="pe-7s-map-2 text-theme-color-2"></i></a>
                  <div class="media-body"> <strong class="text-white">OUR OFFICE LOCATION</strong>
                    <p class="text-white">OUEST , DSCHANG CAMEROUN</p>
                  </div>
                </div>
              </div>
              <div class="col-xs-12 col-sm-6 col-md-12 text-white">
                <div class="icon-box left media bg-black-333 p-25 mb-20"> <a class="media-left pull-left" href="#"> <i class="pe-7s-call text-theme-color-2"></i></a>
                  <div class="media-body"> <strong class="text-white">OUR CONTACT NUMBER</strong>
                    <p>+237 672084085</p>
                  </div>
                </div>
              </div>
              <div class="col-xs-12 col-sm-6 col-md-12 text-white">
                <div class="icon-box left media bg-black-333 p-25 mb-20"> <a class="media-left pull-left" href="#"> <i class="pe-7s-mail text-theme-color-2"></i></a>
                  <div class="media-body"> <strong class="text-white">OUR CONTACT E-MAIL</strong>
                    <p>recusd@gmail.com</p>
                  </div>
                </div>
              </div>
              <div class="col-xs-12 col-sm-6 col-md-12 text-white">
                <div class="icon-box left media bg-black-333 p-25 mb-20"> <a class="media-left pull-left" href="#"> <i class="fa fa-skype text-theme-color-2"></i></a>
                  <div class="media-body"> <strong class="text-white">Make a Video Call</strong>
                    <p>ThemeMascotSkype</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
   
  <!-- end main-content -->
  
<%@ include file="footer.jsp" %>