<%-- 
    Document   : queup
    Created on : 02-Sep-2020, 10:31:56 pm
    Author     : sathvika
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% try {
            int temp=0;
            String uname=(String)session.getAttribute("uname");
            String que=request.getParameter("query");
            
            String una=request.getParameter("user");
            String utype=request.getParameter("utype");
            String email=(String)session.getAttribute("ueid");
            String mob=(String)session.getAttribute("umno");
           
            
            String url="jdbc:mysql://localhost:3306/cars";
            String user="root";
            String pwd="";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=(Connection) DriverManager.getConnection(url, user, pwd);
            
            
            /*if(password.equals(passwordconf)){
                flag_cong=1;
                out.println("<h2>Swe is babba</h2>");
            }
            else{
                flag_cong=0;
                out.println("<h2>Passwords did not match</h2>");
            }*/
        if(!(que.equals(""))){
            
            PrintWriter outs=response.getWriter();
            
            PreparedStatement pstmt=(PreparedStatement) conn.prepareStatement("insert into queries(user,usertype,query,email,mobile)"+"values(?,?,?,?,?)");
            pstmt.setString(1, una);
            pstmt.setString(2,utype);
            pstmt.setString(3,que);
            pstmt.setString(4,email);
            pstmt.setString(5,mob);
            //pstmt.executeUpdate();
            
            if(pstmt.executeUpdate()>0)
            {
                request.getRequestDispatcher("sucquesend.jsp").include(request,response);
            }
            pstmt.close();
            outs.close();
            conn.close();
            /* TODO output your page here. You may use following sample code. */
        }  
        }
        catch(Exception e){
            e.printStackTrace();
        }finally{
            //request.getRequestDispatcher("suvvehup.jsp").include(request,response);
        }
         %>
    </body>
</html>
