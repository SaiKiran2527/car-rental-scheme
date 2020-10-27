<%-- 
    Document   : mybor
    Created on : 27-Aug-2020, 6:06:39 pm
    Author     : sathvika
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
    <a href="renterhome.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-th-large fa-fw w3-margin-right"></i>AVAILABLE</a> 
    <a href="proflend.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>PROFILE</a> 
	<a href="mybor.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-columns w3-margin-right"></i>MY BORROWS</a>
    <a href="renttab.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-list-alt w3-margin-right"></i>LENDS/RENTS</a>
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
    <h1><b>Want a Car for Rent?</b></h1>
	<p class="w3-text-grey">Select a car by clicking on one of the tabs below</p>
    <div class="w3-section w3-bottombar w3-padding-16">
      <span class="w3-margin-right">Filter:</span> 
      <button class="w3-button w3-black">ALL</button>
      <button class="w3-button w3-white">Low-to-High</button>
      <button class="w3-button w3-white w3-hide-small">High-to_Low</button>
      <button class="w3-button w3-white w3-hide-small">Location</button>
    </div>
    </div>
  </header>
  
 


  
    
    <h4>Your Borrows</h4>
    <!-- Pricing Tables -->
    <%
        
       try {
            int swe=0;
            
            
            String unn=session.getAttribute("uname").toString();
            
            
            //String unn=request.getParameter("username");      
            
            String url="jdbc:mysql://localhost:3306/cars";
            String user="root";
            String pwd="";
            //String rname=(String)session.getAttribute("uname");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, pwd);
            Statement st=conn.createStatement();
            String q="select * from carrents where rname='"+unn+"' and status='0' order by tid desc;";
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
                if(swe%3==0){
                    out.print("<div class='w3-row-padding' style='margin:0 -16px'>");
                }
                out.print("<div class='w3-third w3-margin-bottom'>");
                out.print("<ul class='w3-ul w3-border w3-white w3-center w3-opacity w3-hover-opacity-off'>");
                out.print("<li class='w3-black w3-xlarge w3-padding-32'>");
                out.print(vtype+"</li>");
                out.print("<li class='w3-padding-16'><img src=");
                out.print("'"+vtype+".JPG' width='270'></li>");
            out.print("<li id='type' class='w3-padding-16'>VEHICLE NO: ");
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
                out.print("<form action='confret.jsp' method='post'><input type='hidden' name='hid' value='"+re.getString("vno")+"'><input type='hidden' name='hid1' value='"+re.getString("vtype")+"'><input type='submit' value='RETURN' class='w3-button w3-teal w3-padding-large w3-hover-black'></form>");
                out.print("</li></ul></div>");
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

