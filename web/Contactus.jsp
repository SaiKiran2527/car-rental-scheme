<%-- 
    Document   : Contactus
    Created on : 27-Aug-2020, 6:56:13 pm
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
 <center> <div class="w3-padding-64 w3-content w3-text-grey" id="contact">
    <h2 class="w3-text-light-grey">Contact Admin</h2>
    <hr style="width:200px" class="w3-opacity">

    <div class="w3-section">
      <p><i class="fa fa-map-marker fa-fw w3-text-white w3-xxlarge w3-margin-right"></i> Telangana, India</p>
      <p><i class="fa fa-phone fa-fw w3-text-white w3-xxlarge w3-margin-right"></i> Phone: +91 9991999919</p>
      <p><i class="fa fa-envelope fa-fw w3-text-white w3-xxlarge w3-margin-right"> </i> Email: admin@gmail.com</p>
    </div></center>
	<center><div class="w3-panel w3-large">
	<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  width: 80%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0} 
  to {top:0; opacity:1}
}

@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}

/* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}
</style>
</head>
<body>


<center> 
    <h2 class="w3-text-light-grey">Click Below to Write to Admin</h2>
    <br>
<!-- Trigger/Open The Modal -->
<button id="myBtn" class="w3-button w3-white"><i class="fa fa-send-o" ></i>  COMPOSE TO ADMIN</button>
<br><br>
<hr style="width:200px" class="w3-opacity">
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>MESSAGE TO ADMIN</h2>
      <%
          String una=(String)session.getAttribute("uname");
          String uty=(String)session.getAttribute("utype");
	  out.println("<form action='queup.jsp' method='post'>");
          out.println("<p><input class='w3-input w3-padding-16' type='text' placeholder='Write your query here' name='query' required></p>");
      
      
          out.println("<input type='hidden' name='user' value='"+una+"'><input type='hidden' name='utype' value='"+uty+"'>");
        out.println("<p><button class='w3-button w3-light-grey w3-padding-large' type='submit'><i class='fa fa-paper-plane'></i> POST</button></p></form>");
        
      
    
    %>
    </div>
    
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</body>
	<p>Also Follow Us on</p>
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i></center>
  </div>
    
</body>
</html>
