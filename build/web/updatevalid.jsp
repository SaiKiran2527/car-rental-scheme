<%-- 
    Document   : updatevalid
    Created on : 27-Aug-2020, 5:52:39 pm
    Author     : sathvika
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% int flag_pn=0,flag_email=0;
        String emailid=request.getParameter("emailid");
            String phonenumber=request.getParameter("phonenumber");
            String unn=session.getAttribute("uname").toString();
            String password=session.getAttribute("upass").toString();
            String city=request.getParameter("city").toLowerCase();
        Pattern pattern2 = Pattern.compile("^([a-z\\d\\.-]+)@([a-z\\d-]+)\\.([a-z]{2,8})$");
            Matcher matcher2 = pattern2.matcher(emailid);
            boolean matchFound2 = matcher2.find();
            if(matchFound2) {
                       flag_email=1;
            } else {
                    flag_email=0;
            }
            Pattern pattern3 = Pattern.compile("[6-9]{1}[0-9]{9}");
            Matcher matcher3 = pattern3.matcher(phonenumber);
            boolean matchFound3 = matcher3.find();
            if(matchFound3) {
                       flag_pn=1;
            } else {
                    flag_pn=0;
            }
            if(flag_pn==1 && flag_email==1){
                String url="jdbc:mysql://localhost:3306/cars";
            String user="root";
            String pwd="";
            PrintWriter outs=response.getWriter();
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, pwd);
            Statement st=conn.createStatement();
            String q="select username,password from userdetails where username='"+unn+"' and password='"+password+"';";
            ResultSet re=st.executeQuery(q);
            if(re.next()){
                String uu = request.getParameter("username");
                String pp = request.getParameter("password");
                PreparedStatement pstmt = conn.prepareStatement("update userdetails set phonenumber=?,emailid=?,city=? where username=? and password=?");
                    pstmt.setString(4,unn);
                    pstmt.setString(1,phonenumber);
                    pstmt.setString(2,emailid);
                    pstmt.setString(3,city);
                    pstmt.setString(5,password);
               
                    pstmt.executeUpdate();
                    request.getRequestDispatcher("index.jsp").include(request,response);
                out.println("<meta charset=\"UTF-8\">\n" +
"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
"<link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">\n" +
"<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Montserrat\">\n" +
"<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n" +
"<style>\n" +
"body, h1,h2,h3,h4,h5,h6 {font-family: \"Montserrat\", sans-serif}\n" +
".w3-row-padding img {margin-bottom: 12px}\n" +
"/* Set the width of the sidebar to 120px */\n" +
".w3-sidebar {width: 120px;background: #222;}\n" +
"/* Add a left margin to the \"page content\" that matches the width of the sidebar (120px) */\n" +
"#main {margin-left: 120px}\n" +
"/* Remove margins from \"page content\" on small screens */\n" +
"@media only screen and (max-width: 600px) {#main {margin-left: 0}}\n" +
"</style>\n" +
"<body class=\"w3-black\">\n" +
"\n" +
"\n" +
"\n" +
"<!-- Contact Section -->\n" +

"    <center><h2 class=\"w3-text-light-green\">Updated Successfully,Please login again</h2>\n" +
"    <hr style=\"width:200px\" class=\"w3-opacity\"></center>\n" +
"\n" +
"    \n" +
"\n" +
"    \n" +
"</body>");
            }
            }
        %>
    </body>
</html>
