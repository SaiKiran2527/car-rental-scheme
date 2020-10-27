<%-- 
    Document   : registerCantiCars
    Created on : 27-Aug-2020, 2:35:01 pm
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
    <center><h2 class="w3-text-light-grey">REGISTRATION</h2>
    <hr style="width:200px" class="w3-opacity"></center>

    

    <form action="regiCantiCars.jsp" method="post">

      <p><input class="w3-input w3-padding-16" type="text" placeholder="Username" name="username" required pattern="^([A-Za-z|' ']{1,45})$"></p>
	  <p class="w3-wide">NOTE : The password should contain a minimum of 8 character,with one Capital letter</p>
      <p><input class="w3-input w3-padding-16" type="password" placeholder="Password" name="password" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"></p>
      <p><input class="w3-input w3-padding-16" type="password" placeholder="Re-Enter Password" name="passwordconf" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"></p>
      <p><input class="w3-input w3-padding-16" type="text" placeholder="Mobile Number" name="phonenumber" required pattern="[6-9]{1}[0-9]{9}"></p>
	  <p><input class="w3-input w3-padding-16" type="text" placeholder="Email" name="emailid" required pattern="^([A-Z\a-z\d\.-]+)@([a-z\d-]+)\.([a-z]{2,8})$"></p>
	  <p><input class="w3-input w3-padding-16" type="text" placeholder="City(full name)" name="city" required></p>
      <p>USER TYPE :</p>
	  <p><select class="w3-input w3-padding-16" name="usertype" id="users" required>
  <option value="lender">LENDER</option>
  <option value="renter">RENTER</option></select>
  </p>
  <p>SECURITY QUESTION :(Select one)</p>
	  <p><select class="w3-input w3-padding-16" name="secquest" id="users" required>
  <option value="YOUR FIRST SCHOOL?">YOUR FIRST SCHOOL?</option>
  <option value="YOUR DREAM DESTINATION?">YOUR DREAM DESTINATION?</option>
  <option value="YOU ARE REALLY SCARED OF?">YOU ARE REALLY SCARED OF?</option></select>
  </p>
  <p class="w3-wide">NOTE : Space and Case sensitive(memorize your answer)</p>
  <p><input class="w3-input w3-padding-16" type="text" placeholder="Answer to security question" name="secans" required></p>

	  <p><center>
        <input class="w3-button w3-light-grey w3-padding-large" type="submit" value="REGISTER">
           
        </center>
      </p>
    </form>
</body>
</html>

