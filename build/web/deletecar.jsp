<%-- 
    Document   : deletecar
    Created on : 27-Aug-2020, 6:08:58 pm
    Author     : sathvika
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
            int swe=0;
            
            
            String vvno=request.getParameter("hidd1");
            
            
            //String unn=request.getParameter("username");      
            
            String url="jdbc:mysql://localhost:3306/cars";
            String user="root";
            String pwd="";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, pwd);
            Statement st=conn.createStatement();
            String q="delete from carlends where vno='"+vvno+"';";
            st.executeUpdate(q);
            
            
            request.getRequestDispatcher("sucvehdel.jsp").include(request,response);
            
            
        } finally {
           out.print("</div>");
            out.close();
           
        }
        %>
    </body>
</html>
