<%-- 
    Document   : clearlendtab
    Created on : 27-Aug-2020, 6:50:49 pm
    Author     : sathvika
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
            
            
           String uname=(String)session.getAttribute("uname");
            
                 
            
            String url="jdbc:mysql://localhost:3306/cars";
            String user="root";
            String pwd="";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, pwd);
            
            
            PreparedStatement pstmt = conn.prepareStatement("update carrents set lstatus=? where uname=? and status=?");
                   
                    pstmt.setString(1,"1");
                    pstmt.setString(2,uname);
                    pstmt.setString(3,"1");
                    pstmt.executeUpdate();
                    
                    //String rno=(String)session.getAttribute("umno");
                    
                    
            
            pstmt.close();
            
            conn.close();
            
            
            
            //String unn=request.getParameter("username");      
            
            
            
            request.getRequestDispatcher("lendtab.jsp").include(request,response);
        } finally {
           //request.getRequestDispatcher("renterhome.jsp").include(request,response);
            out.close();
            }
            %>
    </body>
</html>
