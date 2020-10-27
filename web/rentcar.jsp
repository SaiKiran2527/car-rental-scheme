<%-- 
    Document   : rentcar
    Created on : 27-Aug-2020, 6:02:55 pm
    Author     : sathvika
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
            
            
            String vvno=request.getParameter("hidd1");
            String lno=request.getParameter("lno");
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
                   
                    pstmt.setString(1,"1");
                    pstmt.setString(2,vno);
                
                    pstmt.executeUpdate();
                    //String rname=(String)session.getAttribute("uname");
                    //String rno=(String)session.getAttribute("umno");
                    
                    
            
            pstmt.close();
            
            conn.close();
            
            
            
            //String unn=request.getParameter("username");      
            if(!(lno.equals(""))){
            Connection conn1=DriverManager.getConnection(url, user, pwd);
            String rname=(String)session.getAttribute("uname");
                    String rno=(String)session.getAttribute("umno");
                PreparedStatement pstmt1 = conn1.prepareStatement("insert into carrents(vno,vname,vtype,vbags,vcol,vcity,milage,vfuel,uname,umno,rname,rmno,licence,status,lstatus,rstatus,price)"+"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                   
                    pstmt1.setString(1, vno);
            pstmt1.setString(2,vmodal.toUpperCase());
            pstmt1.setString(3,vtype);
            pstmt1.setString(4,vbags);
            pstmt1.setString(5,vcol);
            pstmt1.setString(6,vcity);
            pstmt1.setString(7,milage);
            pstmt1.setString(8,vfuel);
            pstmt1.setString(9,lname);
            pstmt1.setString(10,lmno);
            pstmt1.setString(11,rname);
            pstmt1.setString(12,rno);
            pstmt1.setString(13,lno);
            pstmt1.setString(14,"0");
            pstmt1.setString(15,"0");
            pstmt1.setString(16,"0");
            pstmt1.setString(17,"--");
            pstmt1.executeUpdate();
            pstmt1.close();
            
            conn1.close();
            
            }
            request.getRequestDispatcher("rentsuc.jsp").include(request,response);
            }} finally {
           //request.getRequestDispatcher("renterhome.jsp").include(request,response);
            out.close();
           
        }
        %>
    </body>
</html>