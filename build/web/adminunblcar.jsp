<%-- 
    Document   : adminunblcar
    Created on : 02-Sep-2020, 11:08:56 pm
    Author     : sathvika
--%>

<%@page import="java.sql.PreparedStatement"%>
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
            PreparedStatement pstmt = conn.prepareStatement("update carlends set status=? where vno=?");
                   
                    pstmt.setString(1,"0");
                    pstmt.setString(2,vvno);
                
                    pstmt.executeUpdate();
                    //String rname=(String)session.getAttribute("uname");
                    //String rno=(String)session.getAttribute("umno");
                    
                    
            
            pstmt.close();
            
            
            request.getRequestDispatcher("adminsucvedel.jsp").include(request,response);
            
            
        } finally {
           out.print("</div>");
            out.close();
           
        }
        %>
    </body>
</html>


