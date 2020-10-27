<%-- 
    Document   : profchangepswd
    Created on : 27-Aug-2020, 2:59:01 pm
    Author     : sathvika
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            try {
            int flag_pass=0;
            String password=request.getParameter("password");
            String password1=request.getParameter("password1");
            String password2=request.getParameter("password2");
            session=request.getSession(false);
            String unn=session.getAttribute("uname").toString();
            out.println(unn);
            Pattern pattern1 = Pattern.compile("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
            Matcher matcher1 = pattern1.matcher(password1);
            boolean matchFound1 = matcher1.find();
            if(matchFound1) {
                       flag_pass=1;
            } else {
                    flag_pass=0;
            }
            
            //String unn=request.getParameter("username");      
            
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
                
                if(password1.equals(password2) && flag_pass==1){
                   PreparedStatement pstmt = conn.prepareStatement("update userdetails set password=? where username=? and password=?");
                    pstmt.setString(2,unn);
                    pstmt.setString(1,password1);
                    pstmt.setString(3,password);
               
                    pstmt.executeUpdate();
                
                   
                    
                    request.getRequestDispatcher("index.jsp").include(request,response);
                out.print("<meta charset=\"UTF-8\">\n" +
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

"    <center><h2 class=\"w3-text-light-green\">Updated Successfully,Please login with new password</h2>\n" +
"    <hr style=\"width:200px\" class=\"w3-opacity\"></center>\n" +
"\n" +
"    \n" +
"\n" +
"    \n" +
"</body>");
                
                
                    pstmt.close();
                    conn.close();
                }
                else{
                    //request.getRequestDispatcher("profchangepass.jsp").include(request,response);
                out.print("<meta charset=\"UTF-8\">\n" +
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

"    <center><h2 class=\"w3-text-red\">ERROR : Please check with entered passwords and try again</h2>\n" +
"    <hr style=\"width:200px\" class=\"w3-opacity\"></center>\n" +
"\n" +
"    \n" +
"\n" +
"    \n" +
"</body>");
                }
            }
            else{
                //request.getRequestDispatcher("profchangepass.jsp").include(request,response);
                out.print("<meta charset=\"UTF-8\">\n" +
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

"    <center><h2 class=\"w3-text-red\">ERROR : Entered Wrong Password</h2>\n" +
"    <hr style=\"width:200px\" class=\"w3-opacity\"></center>\n" +
"\n" +
"    \n" +
"\n" +
"    \n" +
"</body>");
            }
            
        } finally {
            out.close();
           
        }
            %>
    </body>
</html>
