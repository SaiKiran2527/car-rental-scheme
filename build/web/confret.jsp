<%-- 
    Document   : confret
    Created on : 27-Aug-2020, 6:24:19 pm
    Author     : sathvika
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: block; /* Hidden by default */
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
  background-color: white;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  width: 30%;
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


<% String vvno=request.getParameter("hid");  %>
<% String vvtype=request.getParameter("hid1"); 
String uname=(String)session.getAttribute("uname"); %>
<% java.util.Date date=new java.util.Date();
java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());%>
<% 
    String pric="";
    Timestamp tm;
    int tm2;
    int fare=0;
    if(vvtype.equals("HATCHBACK")){
        fare=50;
    }
    if(vvtype.equals("SEDAN")){
        fare=60;
    }
    if(vvtype.equals("SUV")){
        fare=80;
    }
    if(vvtype.equals("CONVERTIBLE")){
        fare=85;
    }
    if(vvtype.equals("MINIVAN")){
        fare=105;
    }
    
                String url="jdbc:mysql://localhost:3306/cars";
            String user="root";
            String pwd="";
            PrintWriter outs=response.getWriter();
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, pwd);
            Statement st=conn.createStatement();
            String q="select date from carrents where rname='"+uname+"' and vno='"+vvno+"' and status='0';";
            ResultSet re=st.executeQuery(q);
            if(re.next()){
                tm=re.getTimestamp(1);
                Statement st1=conn.createStatement();
                String q1="SELECT TIMESTAMPDIFF(HOUR,'"+tm+"',CURRENT_TIMESTAMP);";
                ResultSet re1=st1.executeQuery(q1);
                if(re1.next()){
                    tm2=re1.getInt(1);
                    int pri=Math.abs(tm2-1)*fare; 
                    if(pri==0){
                        pri=fare;
                    }
                    pric=Integer.toString(pri);
                }
                
            
            }
            
            
            
            
                //request.getRequestDispatcher("index.jsp").include(request,response);
                
            
        %>
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <center><h2 class="w3-text-white">CONFIRMATION</h2></center>
	  
    </div>
	<div class="modal-body">
      
	  <br>
          <br>
                <% out.print("<center><h1 class='w3-text-green'>₹ "+pric+"</h1><center>"); %> 
          <br>      
	  <br>
    </div>
    
    <div class="modal-footer">
        <center><h5 class="w3-text-white">PAY TO RETURN THE CAR</h5><center>
                <center><h6 class="w3-text-white">(NOTE : Click on pay within 30 secs</h6><center>
                <center><h6 class="w3-text-white">Else payment will be incremented)</h6><center>
         <center><form action="returncar.jsp" method="post">
                  <% out.print("<input type='hidden' name='hidd1' value='"+vvno+"'>"); %>
                  <% out.print("<input type='hidden' name='hidd2' value='"+pric+"'>"); %>
      <input type="submit" class="w3-btn w3-red" value="PAY"></form></center>
    </div>

</div>

<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];



// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  window.location.replace("mybor.jsp");
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    window.location.replace("mybor.jsp");
  }
}
</script>
<script>
         setTimeout(function(){
            window.location.href = 'mybor.jsp';
         }, 5000);
      </script>

</body>
</html>


