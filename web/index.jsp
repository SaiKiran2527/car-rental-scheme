<%-- 
    Document   : index
    Created on : 27-Aug-2020, 2:23:45 pm
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
      <center><style>
body {
  background-color: black;
  
}

.glow {
  font-size: 80px;
  color: #fff;
  text-align: center;
  -webkit-animation: glow 1s ease-in-out infinite alternate;
  -moz-animation: glow 1s ease-in-out infinite alternate;
  animation: glow 1s ease-in-out infinite alternate;
}

@-webkit-keyframes glow {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
  }
  
  to {
    text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px #ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
  }
}
</style>



<h1 class="glow">CANTICARS</h1>
          <h6>CAR LENDING AND RENTING SCHEME</h6>
          <h6>THIS IS THE FUTURE AND THE FUTURE IS NOW!</h6><br>
        <h2 class="w3-text-light-grey">LOGIN</h2>
    <hr style="width:200px" class="w3-opacity"></center>

    

    <form action="loginCantiCars.jsp" method="post">
	

      <p><input class="w3-input w3-padding-16" type="text" placeholder="Username" name="username" required></p>
	  
      <p><input class="w3-input w3-padding-16" type="password" placeholder="Password" name="password" required></p>
      
</select>
	  <p><center>
	  <a href="Recoverpass.jsp"><p>FORGOT PASSWORD</a></p>
        <button class="w3-button w3-light-grey w3-padding-large" type="submit">
           LOGIN
        </button></center>
      </p>
    </form>
	
	<p><center>
            <a href="registerCantiCars.jsp"><button class="w3-button w3-light-grey w3-padding-large" type="submit">
           SIGNUP
                </button></a></center>
      </p>
	  
</body>
</html>
