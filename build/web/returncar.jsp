<%-- 
    Document   : returncar
    Created on : 27-Aug-2020, 5:56:33 pm
    Author     : sathvika
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
            
            
            String vvno=request.getParameter("hidd1");
            String fare=request.getParameter("hidd2");
            
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
            Statement st=conn.createStatement();
            String q="select * from carlends where vno='"+vvno+"';";
            ResultSet re=st.executeQuery(q);
            if(re.next()){
                vno = re.getString("vno");
                vmodal = re.getString("vname");
                vtype = re.getString("vtype");
                vbags = re.getString("vbags");
                vcol = re.getString("vcol");
                vcity = re.getString("vcity");
                milage = re.getString("milage");
                vfuel = re.getString("vfuel");
                lname=re.getString("uname");
                lmno=re.getString("umno");
            
                PreparedStatement pstmt = conn.prepareStatement("update carlends set status=? where vno=?");
                   
                    pstmt.setString(1,"0");
                    pstmt.setString(2,vno);
                
                    pstmt.executeUpdate();
                    //String rname=(String)session.getAttribute("uname");
                    //String rno=(String)session.getAttribute("umno");
                    
                    
            
            pstmt.close();
            
            conn.close();
            
            
            
            //String unn=request.getParameter("username");      
            
            Connection conn1=DriverManager.getConnection(url, user, pwd);
            String rname=(String)session.getAttribute("uname");
                    String rno=(String)session.getAttribute("umno");
                PreparedStatement pstmt1 = conn1.prepareStatement("update carrents set status=?,rdate=?,price=? where vno=? and rname=? and status='0'");
                   
                    pstmt1.setString(1,"2");
                    java.util.Date date=new java.util.Date();
java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());
                    pstmt1.setTimestamp(2,timestamp);
                    pstmt1.setString(3,fare);
           
                    pstmt1.setString(4,vvno);
                    pstmt1.setString(5,rname);
                
                    pstmt1.executeUpdate();
            
            pstmt1.close();
            
            conn1.close();
            
            }
            request.getRequestDispatcher("feedback.jsp").include(request,response);
        } finally {
           //request.getRequestDispatcher("renterhome.jsp").include(request,response);
            out.close();
           
        }
        %>
    </body>
</html>
