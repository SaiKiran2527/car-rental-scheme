<%-- 
    Document   : Recoverpass
    Created on : 27-Aug-2020, 6:54:15 pm
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
.w3-sidebar {width: 120px;background: #222;}
/* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
#main {margin-left: 120px}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {#main {margin-left: 0}}
</style>
<body class="w3-black">



<!-- Contact Section -->
  <div class="w3-padding-64 w3-content w3-text-grey" id="contact">
    <center><h2 class="w3-text-light-grey">RECOVER PASSWORD</h2>
    <hr style="width:200px" class="w3-opacity"></center>

    

    <form action="Recovpass.jsp" target="_blank">
	

      <p><input class="w3-input w3-padding-16" type="text" placeholder="User Name" name="username" required></p>
      <p>SECURITY QUESTION :(Select the question that you have selected while registering)</p>
	  <p><select class="w3-input w3-padding-16" name="secquest" id="users" required>
  <option value="YOUR FIRST SCHOOL?">YOUR FIRST SCHOOL?</option>
  <option value="YOUR DREAM DESTINATION?">YOUR DREAM DESTINATION?</option>
  <option value="YOU ARE REALLY SCARED OF?">YOU ARE REALLY SCARED OF?</option></select>
  </p>
  <p class="w3-wide">NOTE : Space and Case sensitive</p>
  <p><input class="w3-input w3-padding-16" type="text" placeholder="Answer to security question" required name="secans"></p>
	  <p><center>
	  
        <input class="w3-button w3-light-grey w3-padding-large" type="submit" value="RECOVER PASSWORD">
           </center>
      </p>
    </form>
	
	<p><center>
            <a href="index.jsp"><input class="w3-button w3-light-grey w3-padding-large" type="submit" value="SIGNIN">
            </a></center>
      </p>
	  
</body>
</html>

