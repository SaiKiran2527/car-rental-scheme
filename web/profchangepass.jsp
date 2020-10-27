<%-- 
    Document   : profchangepass
    Created on : 27-Aug-2020, 6:05:48 pm
    Author     : sathvika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
.w3-row-padding img {margin-bottom: 12px}
/* Set the width of the sidebar to 120px */
.w3-sidebar {width: 120px;background: #222;
                overflow: hidden; }
/* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
#main {margin-left: 120px}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {#main {margin-left: 0}}
</style>
<body class="w3-black">

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

<!-- Contact Section -->
  <div class="w3-padding-64 w3-content w3-text-grey" id="contact">
    <h2 class="w3-text-light-grey">Change Password</h2>
    <hr style="width:200px" class="w3-opacity">

    

    <form action="profchangepswd.jsp" method="post">

      <p><input class="w3-input w3-padding-16" type="password" placeholder="Old Password" required name="password"></p>
      <p><input class="w3-input w3-padding-16" type="password" placeholder="New Password" required name="password1"></p>
      <p><input class="w3-input w3-padding-16" type="password" placeholder="Re-Enter Password" required name="password2"></p>
      <p>
        <input class="w3-button w3-light-grey w3-padding-large" type="submit" value="Apply changes">
          
        
      </p>
    </form>
</body>
</html>

