<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>

<!-- Meta Tags -->
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>

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
<!-- <link href="css/style.css" rel="stylesheet" type="text/css"> -->

<!-- CSS | Theme Color -->
<link href="css/colors/theme-skin-color-set-1.css" rel="stylesheet" type="text/css">

<!-- external javascripts -->
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script src="js/jquery-plugin-collection.js"></script>

</head>
<body class="">
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
  
  <!-- Header -->
  <header id="header" class="header">
    
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
             <li class="active"><a>Home</a> </li>
              </c:when>
              <c:when test="${option!='home'}"> 
              <li ><a href="home_admins">Home</a> </li>
              </c:when>
              
         </c:choose>
        
                <c:choose>
         
        <c:when test="${option=='examen' }"> 
             <li class="active" > <a>Examen</a> 
              </c:when>
              <c:when test="${option!='examen'}"> 
              <li><a>Examen</a> 
              </c:when>
              
         </c:choose>
              <ul class="dropdown">
                  <li><a href="#">New</a>
                   <ul class="dropdown">
                      <li><a href="Examens?examen=normal">Session normale</a></li>
                      <li><a href="Examens?examen=rattrapage">Session Rattrapage</a></li>
                    </ul>
                  </li>
                  <li><a href="#">Liste</a> 
                  <ul class="dropdown">
                     <li><a href="download?session=normal">Session normale</a></li>
                      <li><a href="download?session=rattrapage">Session Rattrapage</a></li>
                    </ul>
                  </li>
                  
                </ul>
              </li>
              <li ><li><a href="page_404">Courses</a></li>
          <c:choose>
         
        <c:when test="${option=='room' }"> 
             <li class="active"><a >Room <span class="label label-info">New</span></a> </li>
              </c:when>
              <c:when test="${option!='room'}"> 
             <li><a href="salle">Room <span class="label label-info">New</span></a> </li>
              </c:when>
              
         </c:choose> 
              
                
              

              <li><a href="#">Teachers</a></li>
            
              
          <li>
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="images/index.png" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
            <ul class="dropdown" aria-labelledby="dropdownUser2">
            
                <c:choose>
         
        <c:when test="${user.role=='SuperAdmins'}"> 
             <li><a class="dropdown-item" href="admins">New admins...</a></li>
              </c:when>
              <c:when test="${user.role!='superAdmins'}"> 
                
              </c:when>
              
         </c:choose>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="profil">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="deconnect">Sign out</a></li>
          </ul>
        </li>
        
            </ul>
             
          </nav>
        </div>
      </div>
    </div>
    </header>