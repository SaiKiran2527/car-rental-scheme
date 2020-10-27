<%-- 
    Document   : Lenderprof
    Created on : 27-Aug-2020, 6:55:14 pm
    Author     : sathvika
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>
<body class="w3-light-grey w3-content" style="max-width:1600px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:290px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <img src="pp1.png" style="width:45%;" class="w3-round"><br><br>
    <h4><b>Hello <% String name=(String)session.getAttribute("uname"); %><% out.print(name); %>,</b></h4>
    <p class="w3-text-grey">Logged in as <% String type=(String)session.getAttribute("utype"); %><% out.print(type); %></p>
  </div>
  <div class="w3-bar-block">
    <a href="Lenderprof.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>MY CARS</a> 
    <a href="proflend.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>PROFILE</a> 
	<a href="rentcarstabup.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-columns w3-margin-right"></i>CARS RENTED</a>
        <a href="lendtab.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-list-alt w3-margin-right"></i>LENDS/RENTS</a>
    <a href="index.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-sign-out w3-margin-right"></i>LOGOUT</a>
  </div>
  <div class="w3-panel w3-large">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">

  <!-- Header -->
  <header id="portfolio">
    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container">
    <h1><b>Want to Rent a Car?</b></h1>
    
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
  color: black;
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


<!-- Trigger/Open The Modal -->
<button id="myBtn" class="w3-button w3-teal w3-padding-large w3-hover-black">ADD CAR</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>LEND YOUR CAR</h2>
	  <form action="vehicleregg.jsp" method="post">

      <p><input class="w3-input w3-padding-16" type="text" placeholder="Vehicle Number" name="vno" required></p>
      <p><input class="w3-input w3-padding-16" type="text" placeholder="Vehicle Model" name="vmodal" required></p>
      <p><input class="w3-input w3-padding-16" type="text" placeholder="Mileage" name="vmile" pattern="[0-9/'.']{1,}" required></p>
	  
      <p>VEHICLE TYPE :</p>
	  <p><select class="w3-input w3-padding-16" name="vtype" id="users" required>
  <option value="SEDAN">SEDAN</option>
  <option value="HATCHBACK">HATCHBACK</option>
  <option value="SUV">SUV</option>
<option value="CONVERTIBLE">CONVERTIBLE</option>
<option value="MINIVAN">MINIVAN</option></select>
  </p>
  <p>AIR BAGS :</p>
	  <p><select class="w3-input w3-padding-16" name="vbags" id="users" required>
  <option value="NO">NO</option>
  <option value="YES">YES</option></select>
  </p>
  <p>FUEL :</p>
	  <p><select class="w3-input w3-padding-16" name="vfuel" id="users" required>
  <option value="PETROL">PERTOL</option>
  <option value="DIESEL">DIESEL</option></select>
  </p>
  <p>COLOUR :</p>
	  <p><select class="w3-input w3-padding-16" name="vcol" id="users" required>
  <option value="BLACK">BLACK</option>
  <option value="WHITE">WHITE</option>
              <option value="RED">RED</option>
              <option value="BLUE">BLUE</option>
              <option value="GREY">GREY</option>
              <option value="BROWN">BROWN</option></select>
  </p>
  <p>CITY :</p>
	  <p><select class="w3-input w3-padding-16" name="vcity" id="users" required>
  <option value="HYDERABAD">HYDERABAD</option>
  <option value="MUMBAI">MUMBAI</option>
  <option value="GOA">GOA</option>
  <option value="BANGALORE">BANGALORE</option>
  <option value="KOLKATA">KOLKATA</option>
  <option value="DELHI">DELHI</option></select>
  </p>

	  <p><center>
              <a href="Lenderprof.jsp"><input class="w3-button w3-light-grey w3-padding-large" type="submit" value="REGISTER"></a>
           </center>
      </p>
    </form>
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
  modal.style.zIndex="100"
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
    
    <div class="w3-section w3-bottombar w3-padding-16">
      
    </div>
    </div>
 
  </header>
  
  <!-- First Photo Grid-->
  


  
    
    <h4>Your Cars</h4>
    <!-- Pricing Tables -->
    
    <%
        
       try {
            int swe=0;
            
            
            String unn=session.getAttribute("uname").toString();
            
            
            //String unn=request.getParameter("username");      
            
            String url="jdbc:mysql://localhost:3306/cars";
            String user="root";
            String pwd="";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, pwd);
            Statement st=conn.createStatement();
            String q="select * from carlends where uname='"+unn+"' order by tid desc;";
            ResultSet re=st.executeQuery(q);
            
            
            while(re.next()){
                String vno = re.getString("vno");
                String vmodal = re.getString("vname");
                String vtype = re.getString("vtype");
                String vbags = re.getString("vbags");
                String vcol = re.getString("vcol");
                String vcity = re.getString("vcity");
                String milage = re.getString("milage");
                String vfuel = re.getString("vfuel");
                String status = re.getString("status");
                if(swe%3==0){
                    out.print("<div class='w3-row-padding' style='margin:0 -16px'>");
                }
                out.print("<div class='w3-third w3-margin-bottom'>");
                out.print("<ul class='w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off'>");
                out.print("<li class='w3-black w3-xlarge w3-padding-32'>");
                out.print(vtype+"</li>");
                out.print("<li class='w3-padding-16'><img src=");
                out.print("'"+vtype+".JPG' width='270'></li>");
            out.print("<li class='w3-padding-16'>VEHICLE : ");
            out.print(vno+"</li>");
                out.print("<li class='w3-padding-16'>MILEAGE : ");
                out.print(milage+"</li>");
                out.print("<li class='w3-padding-16'>AIRBAGS : ");
                out.print(vbags+"</li>");
                out.print("<li class='w3-padding-16'>");
                out.print("<span class='w3-opacity'>");
                out.print(vfuel+"</span>");
                out.print("<h2>"+vmodal+"</h2>");
                out.print("<span class='w3-opacity'>");
                out.println(vcol+"</span><br>");
                out.print("<span class='w3-opacity'>");
                out.print(vcity+"</span>");
                out.print("</li><li class='w3-light-grey w3-padding-24'>");
                String s="";
                if(status.equals("0")){
                out.print("<form action='confdel.jsp' method='post'><input type='hidden' name='hid' value='"+re.getString("vno")+"'><input type='submit' value='DELETE' class='w3-button w3-teal w3-padding-large w3-hover-black'></form>");
                out.print("</li></ul></div>");}
                if(status.equals("3")){
                out.print("<form action='' method='post'><input type='hidden' name='hid' value='"+re.getString("vno")+"'><input type='submit' value='REMOVED BY ADMIN' class='w3-button w3-teal w3-padding-large w3-hover-black' disabled></form>");
                out.print("</li></ul></div>");}
                if(status.equals("1")){
                out.print("<form action='' method='post'><input type='hidden' name='hid' value='"+re.getString("vno")+"'><input type='submit' value='RENTED' class='w3-button w3-teal w3-padding-large w3-hover-black' disabled></form>");
                out.print("</li></ul></div>");}
                if(swe%3==2){
                    out.print("</div>");
                }
                swe=swe+1;
            }
            
            
        } finally {
           out.print("</div>");
            out.close();
           
        }
        %>
    
    
  
  
    

<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>

</body>
</html>