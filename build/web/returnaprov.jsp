<%-- 
    Document   : returnaprov
    Created on : 03-Sep-2020, 9:53:52 pm
    Author     : sathvika
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
            
            
            String vvno=request.getParameter("hid");
            String fare=request.getParameter("hidd");
            
            String vno;
                String vmodal;
                String vtype;
                String vbags;
                String vcol;
                String vcity;
                String milage;
                String vfuel;
                String lname;
                String lmno;
            
            //String unn=request.getParameter("username");      
            
            String url="jdbc:mysql://localhost:3306/cars";
            String user="root";
            String pwd="";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, pwd);
           
            
                PreparedStatement pstmt = conn.prepareStatement("update carrents set paid=?,status=? where vno=?");
                   
                    pstmt.setString(1,"RETURNED AND PAID");
                    pstmt.setString(2,"1");
                    pstmt.setString(3,vvno);
                    pstmt.executeUpdate();
                    //String rname=(String)session.getAttribute("uname");
                    //String rno=(String)session.getAttribute("umno");
                    
                    
            
            pstmt.close();
            
            conn.close();
            
            
            
            
            
            request.getRequestDispatcher("succomprent.jsp").include(request,response);
        } finally {
           //request.getRequestDispatcher("renterhome.jsp").include(request,response);
            out.close();
           
        }
        %>
    </body>
</html>
