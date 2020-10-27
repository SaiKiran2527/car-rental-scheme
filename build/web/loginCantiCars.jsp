<%-- 
    Document   : loginCantiCars
    Created on : 27-Aug-2020, 2:40:59 pm
    Author     : sathvika
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            
            String url="jdbc:mysql://localhost:3306/cars";
            String user="root";
            String pwd="";
            PrintWriter outs=response.getWriter();
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, pwd);
            Statement st=conn.createStatement();
            String q="select * from userdetails where username='"+username+"' and password='"+password+"';";
            ResultSet re=st.executeQuery(q);
            if(re.next()){
                
                
                if(re.getString(4).equals("lender")){
                    
                   //out.println("REDIRECTED TO LENDER PAGE");
                    session=request.getSession();
                    session.setAttribute("uname",username);
                    session.setAttribute("upass",password);
                    session.setAttribute("utype",re.getString(4));
                    session.setAttribute("umno",re.getString(3));
                    session.setAttribute("ueid",re.getString(5));
                    session.setAttribute("ucity",re.getString(8));
                    //response.sendRedirect("Lenderprof.jsp");
                    request.getRequestDispatcher("Lenderprof.jsp").include(request, response);
                }
                
                if(re.getString(4).equals("renter")){
                    
                    session=request.getSession();
                    session.setAttribute("uname",username);
                    session.setAttribute("upass",password);
                    session.setAttribute("utype",re.getString(4));
                    session.setAttribute("umno",re.getString(3));
                    session.setAttribute("ueid",re.getString(5));
                    session.setAttribute("ucity",re.getString(8));
                    //response.sendRedirect("renterhome.jsp");
                    request.getRequestDispatcher("renterhome.jsp").include(request, response);
                }
                if(re.getString(4).equals("admin")){
                    
                    session=request.getSession();
                    session.setAttribute("uname",username);
                    session.setAttribute("upass",password);
                    session.setAttribute("utype",re.getString(4));
                    session.setAttribute("umno",re.getString(3));
                    session.setAttribute("ueid",re.getString(5));
                    session.setAttribute("ucity",re.getString(8));
                    //response.sendRedirect("renterhome.jsp");
                    request.getRequestDispatcher("adminprof.jsp").include(request, response);
                }
                }
                
            
            else
            {
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
"  <div class=\"w3-padding-64 w3-content w3-text-grey\" id=\"contact\">\n" +
"    <center><h2 class=\"w3-text-red\">Invalid Credentials</h2>\n" +
"    <hr style=\"width:200px\" class=\"w3-opacity\"></center>\n" +
"\n" +
"    \n" +
"\n" +
"    \n" +
"</body>");
            
            }
            
            
            //PreparedStatement pstmt=conn.prepareStatement("select * from sample where username");
        }
                finally {
            out.close();
        }
            %>
    </body>
</html>
