<%-- 
    Document   : auth1
    Created on : 27-Aug-2020, 6:51:41 pm
    Author     : sathvika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String password=request.getParameter("psw");
            String pass=(String)session.getAttribute("upass");
            if(pass.equals(password)){
                 request.getRequestDispatcher("Updateprof.jsp").include(request,response);
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

"    <center><h2 class=\"w3-text-light-green\">Access granted to modify</h2>\n" +
"    <hr style=\"width:200px\" class=\"w3-opacity\"></center>\n" +
"\n" +
"    \n" +
"\n" +
"    \n" +
"</body>");
            }
            else{
                request.getRequestDispatcher("auth.jsp").include(request,response);
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

"    <center><h2 class=\"w3-text-red\">Incorrect Password</h2>\n" +
"    <hr style=\"width:200px\" class=\"w3-opacity\"></center>\n" +
"\n" +
"    \n" +
"\n" +
"    \n" +
"</body>");
    }%>
    </body>
</html>
