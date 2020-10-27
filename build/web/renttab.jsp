<%-- 
    Document   : tenttab
    Created on : 27-Aug-2020, 5:58:46 pm
    Author     : sathvika
--%>

<%@page import="java.sql.Timestamp"%>
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
    <a href="renterhome.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-th-large fa-fw w3-margin-right"></i>AVAILABLE</a> 
    <a href="proflend.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>PROFILE</a> 
	<a href="mybor.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-columns w3-margin-right"></i>MY BORROWS</a>
    <a href="renttab.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-list-alt w3-margin-right"></i>LENDS/RENTS</a>
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
  
<body>
<div class="w3-container">

  <h2>LIST OF CARS THAT YOU HAVE RENTED</h2>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {margin:0;}

.icon-bar {
  width: 100%;
  background-color: #555;
  overflow: auto;
}

.icon-bar a{
  float: left;
  width: 20%;
  text-align: center;
  padding: 2px 0;
  transition: all 0.3s ease;
  color: white;
  font-size: 36px;
}

.icon-bar a:hover {
  background-color: #000;
}

.active {
  background-color: #4CAF50;
}
</style>
<body>

<div class="icon-bar">

  <a href="#"></a> 
  <a href="#"></a> 
  <a href="#"></a> 
  <a href="#"></a>
  <a class="active" href="clearrenttable.jsp"><i class="fa fa-trash"></i></a> 
</div>

</body>
  <p>NOTE: Click on the Delete button to clear LENDS/RENTS details that are currently not active</p>
  <div class="p-3 mb-2 bg-warning text-dark">-<em>Yellow for Vehicles that are currently at service</em></div>
  <div class="p-3 mb-2 bg-success text-white">-<em>Green for Vehicles that are currently idle</em></div>
  

  <table class="w3-table-all">
    <thead>
      <tr class="w3-black">
        <th>Vehicle no</th>
        <th>Vehicle name</th>
        <th>Lender Name</th>
        <th>Lender Number</th>
		<th>On(date)</th>
        <th>Till(date)</th>
        <th>Price</th>
        <th>Payment Status</th>
      </tr>
    </thead>
  


  
    
   
    <!-- Pricing Tables -->
    <%
        
       try {
            int swe=0;
            
            
            String unn=session.getAttribute("uname").toString();
            String uty=session.getAttribute("utype").toString();
            
            
            //String unn=request.getParameter("username");      
            
            String url="jdbc:mysql://localhost:3306/cars";
            String user="root";
            String pwd="";
            //String rname=(String)session.getAttribute("uname");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, pwd);
            Statement st=conn.createStatement();
            String q="select * from carrents where rname='"+unn+"' and rstatus='0' order by tid desc;";
            ResultSet re=st.executeQuery(q);
            
            //out.print();
            while(re.next()){
                String vno = re.getString("vno");
                String vname=re.getString("vname");
                String uname = re.getString("uname");
                String umno = re.getString("umno");
                Timestamp date= re.getTimestamp("date");
                Timestamp rdate= re.getTimestamp("rdate");
                String price = re.getString("price");
                String status = re.getString("status");
                String paid = re.getString("paid");
                if(status.equals("2")){
                    out.print("<tr class='w3-hover-yellow'>");
                }
                if(status.equals("1")){
                    out.print("<tr class='w3-hover-red'>");
                }
                if(status.equals("0")){
                    out.print("<tr class='w3-hover-green'>");
                }
                out.print("<td>"+vno+"</td><td>"+vname+"</td><td>"+uname+"</td><td>"+umno+"</td><td>"+date+"</td><td>"+rdate+"</td><td>"+price+"</td><td>"+paid+"</td></tr>");
                
            }
            
        } finally {
           out.print("</table></div>");
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

