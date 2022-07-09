<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>

<html dir="ltr" lang="en">

<!-- Mirrored from html.kodesolution.live/s/studypress/v6.0/demo/page-404-style2.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 31 Mar 2022 00:40:16 GMT -->
<head>

<!-- Meta Tags -->
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<meta name="description" content="StudyPress | Education & Courses HTML Template" />
<meta name="keywords" content="academy, course, education, education html theme, elearning, learning," />
<meta name="author" content="ThemeMascot" />

<!-- Page Title -->

<title>REC~${option}</title>

<!-- Favicon and Touch Icons -->
<link href="images/Untitled-2.png" sizes="16x16" rel="icon" type="image/png">

<!-- Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css">
<link href="css/animate.css" rel="stylesheet" type="text/css">
<link href="css/css-plugin-collections.css" rel="stylesheet"/>
<!-- CSS | menuzord megamenu skins -->
<link id="menuzord-menu-skins" href="css/menuzord-skins/menuzord-rounded-boxed.css" rel="stylesheet"/>
<!-- CSS | Main style file -->
<link href="css/style-main.css" rel="stylesheet" type="text/css">
<!-- CSS | Preloader Styles -->
<link href="css/preloader.css" rel="stylesheet" type="text/css">
<!-- CSS | Custom Margin Padding Collection -->
<link href="css/custom-bootstrap-margin-padding.css" rel="stylesheet" type="text/css">
<!-- CSS | Responsive media queries -->
<link href="css/responsive.css" rel="stylesheet" type="text/css">
<!-- CSS | Style css. This is the file where you can place your own custom css code. Just uncomment it and use it. -->
<link href="css/style.css" rel="stylesheet" type="text/css"> 

<!-- CSS | Theme Color -->
<link href="css/colors/theme-skin-color-set-1.css" rel="stylesheet" type="text/css">

<!-- external javascripts -->
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- JS | jquery plugin collection for this theme -->
<script src="js/jquery-plugin-collection.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<div id="wrapper" class="clearfix">
  <!-- preloader -->
  <div id="preloader">
    <div id="spinner">
      <div class="preloader-dot-loading">
        <div class="cssload-loading"><i></i><i></i><i></i><i></i></div>
      </div>
    </div>
    <div id="disable-preloader" class="btn btn-default btn-sm">Disable Preloader</div>
  </div> 
  </div>
  <!-- Header -->
  <header id="header" class="header">
    <div class="header-top bg-theme-color-2 sm-text-center p-0">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <div class="widget no-border m-0">
              <ul class="list-inline font-13 sm-text-center mt-5">
                <li>
                  <a class="text-white" href="FAQs">FAQ</a>
                </li>
                <li class="text-white">|</li>
                <li>
                  <a class="text-white" href="#">Help Desk</a>
                </li>
                <li class="text-white">|</li>
                <li>
                  <a class="text-white" href="login">Login</a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-md-8">
            <div class="widget m-0 pull-right sm-pull-none sm-text-center">
              <ul class="list-inline pull-right">
                
                <li class="mb-0 pb-0">
                  <div class="top-dropdown-outer pt-5 pb-10">
                    <a class="top-search-box has-dropdown text-white text-hover-theme-colored"><i class="fa fa-search font-13"></i> &nbsp;</a>
                    <ul class="dropdown">
                      <li>
                        <div class="search-form-wrapper">
                          <form method="get" class="mt-10">
                            <input type="text" onfocus="if(this.value =='Enter your search') { this.value = ''; }" onblur="if(this.value == '') { this.value ='Enter your search'; }" value="Enter your search" id="searchinput" name="s" class="">
                            <label><input type="submit" name="submit" value=""></label>
                          </form>
                        </div>
                      </li>
                    </ul>
                  </div>
                </li>
              </ul>
            </div>
           
          </div>
        </div>
      </div>
    </div>
     <div class="header-nav">
      <div class="header-nav-wrapper navbar-scrolltofixed bg-lightest">
        <div class="container">
          <nav id="menuzord-right" class="menuzord orange">
            <a class="menuzord-brand pull-left flip mt-15" href="javascript:void(0)">
              <img src="images/Untitled-2.png" alt="">
            </a>
            <ul class="menuzord-menu dark">
            <c:choose>
         
        <c:when test="${option=='home' }"> 
             <li class="active"><a href="home_admins">Home</a> </li>
              </c:when>
              <c:when test="${option!='home'}"> 
              <li ><a href="home_admins">Home</a> </li>
              </c:when>
              
         </c:choose>
          <c:choose>
         
        <c:when test="${option=='faq' }"> 
              <li class="active"><a href="FAQs">FAQ <span class="label label-info">New</span></a></li>
              </c:when>
              <c:when test="${option!='faq' }"> 
               <li><a href="FAQs">FAQ <span class="label label-info">New</span></a></li>
              </c:when>
              
         </c:choose>
          <c:choose>
         
        <c:when test="${option=='contact' }"> 
             <li class="active"><a href="page_contact">Contact</a></li>
              </c:when>
              <c:when test="${option!='contact' }"> 
               <li><a href="page_contact">Contact</a></li>
              </c:when>
              
         </c:choose>
              
             
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </header>