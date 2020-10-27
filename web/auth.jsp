<%-- 
    Document   : auth
    Created on : 27-Aug-2020, 6:52:21 pm
    Author     : sathvika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 28px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
.w3-row-padding img {margin-bottom: 12px}
/* Set the width of the sidebar to 120px */
.w3-sidebar {width: 120px;background: #222;
overflow: hidden;}
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
  <center><div class="w3-padding-64 w3-content w3-text-grey" id="contact">
    <h2 class="w3-text-light-grey">UPDATE PROFILE</h2>
    <hr style="width:200px" class="w3-opacity">
	<h4 class="w3-text-grey">Are you sure about updating the profile</h4>
	<h4 class="w3-text-grey">Click below to Change your details</h4>
	<button class="w3-bar-item w3-button" onclick="openForm()">CHANGE</button>

<div class="form-popup" id="myForm">
  <form action="auth1.jsp" class="form-container">
    <h1>Security</h1>


    <label for="psw"><b>purpose</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>

    <button type="submit" class="btn">Confirm</button>
    <button type="button" class="btn cancel" onclick="closeForm()">Cancel</button>
  </form>
</div>

<script>
function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}
</script></center>

    

    
</body>
</html>