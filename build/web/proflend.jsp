<%-- 
    Document   : proflend
    Created on : 27-Aug-2020, 6:04:56 pm
    Author     : sathvika
--%>

<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    img.two {
  height: 25%;
  width: 25%;
}
body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
.w3-row-padding img {margin-bottom: 12px}
/* Set the width of the sidebar to 120px */
.w3-sidebar {width: 120px;background: #222;
overflow: hidden;}
/* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
#main {margin-left: 120px;}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {#main {margin-left: 0}}
</style>
<body class="w3-black">
    <% String username=(String)session.getAttribute("uname"); 
    String pass=(String)session.getAttribute("upass");
    String type=(String)session.getAttribute("utype");
    String mno=(String)session.getAttribute("umno");
    String eid=(String)session.getAttribute("ueid");
    String city=(String)session.getAttribute("ucity");
    %>

<!-- Icon Bar (Sidebar - hidden on small screens) -->
<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">
  <!-- Avatar image in top left corner -->
  
  <% String ty=(String)session.getAttribute("utype");
  if(ty.equals("renter")){
      out.print("<a href='renterhome.jsp' class='w3-bar-item w3-button w3-padding-large w3-hover-black'>"
              + "<i class='fa fa-home w3-xxlarge'></i>"
    +"<p>HOME</p></a>");
  }
  if(ty.equals("lender")){
      out.print("<a href='Lenderprof.jsp' class='w3-bar-item w3-button w3-padding-large w3-hover-black'>"
              + "<i class='fa fa-home w3-xxlarge'></i>"
    +"<p>HOME</p></a>");
  
  } %>
  <a href="proflend.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-user w3-xxlarge"></i>
    <p>PROFILE</p>
  </a>
  <a href="profchangepass.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-eye w3-xxlarge"></i>
    <p>CHANGE PASSWORD</p>
  </a>
  <a href="auth.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-upload w3-xxlarge"></i>
    <p>UPDATE PROFILE</p>
	<a href="Contactus.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-envelope w3-xxlarge"></i>
    <p>CONTACT ADMIN</p>
  </a>
  </a>
  
</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <% if(ty.equals("renter")){
      out.print("<a href='renterhome.jsp' class='w3-bar-item w3-button' style='width:25% !important'>HOME</a>");
  } 
 if(ty.equals("lenter")){
      out.print("<a href='Lenderprof.jsp' class='w3-bar-item w3-button' style='width:25% !important'>HOME</a>");
  } 
      %>
    <a href="proflend.jsp" class="w3-bar-item w3-button" style="width:25% !important">PROFILE</a>
    <a href="profchangepass.jsp" class="w3-bar-item w3-button" style="width:25% !important">CHANGE PASSWORD</a>
	<a href="auth.jsp" class="w3-bar-item w3-button" style="width:25% !important">UPDATE PROFILE</a>
    <a href="Contactus.jsp" class="w3-bar-item w3-button" style="width:25% !important">CONTACT ADMIN</a>
  </div>
</div>

<!-- Page Content -->
<div class="w3-padding-large" id="main">
  <!-- Header/Home -->
  <header class="w3-container w3-padding-32 w3-center w3-black" id="home">
      <h1 class="w3-jumbo"><span class="w3-hide-small">Hello</span> <% out.print(username); %>!!!</h1>
    <p>ACCOUNT TYPE : <% out.print(type); %></p>
    <img class="two" src="https://pecb.com/conferences/wp-content/uploads/2017/10/no-profile-picture.jpg" alt="boy" class="w3-image" width="992" height="1108">
  </header>

  <!-- About Section -->
  
  
    <center><h2 class="w3-text-light-grey">Mobile : <% out.print(mno); %></h2>
    <hr style="width:200px" class="w3-opacity">
    
    <h3 class="w3-padding-16 w3-text-light-grey">Email : <% out.print(eid); %></h3>
    <p class="w3-wide">City : <% out.print(city); %></p>
    
    <p class="w3-wide">Verified by CantiCars</p>
    
    <p class="w3-wide">Made In India</p></center>
    <div class="w3-white">
      <div class="w3-dark-grey" style="height:28px;width:80%"></div>
    </div><br>
	</body>
</html>
