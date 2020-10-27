<%-- 
    Document   : VehReg
    Created on : 27-Aug-2020, 3:12:24 pm
    Author     : sathvika
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.io.PrintWriter"%>
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
            int temp=0;
            String vno=request.getParameter("vno");
            int flag_vno=0,flag_vmodal=0,flag_vmile=0;
            String vmodal=request.getParameter("vmodal");
            String vmile=request.getParameter("vmile");
            String vtype=request.getParameter("vtype");
            String vbags=request.getParameter("vbags");
            String vfuel=request.getParameter("vfuel");
            String vcol=request.getParameter("vcol");
            String vcity=request.getParameter("vcity");
            if(vno.isBlank()){
                flag_vno=0;
            }
            else{
                flag_vno=1;
            }
            if(vmodal.isBlank()){
                flag_vmodal=0;
            }
            else{
                flag_vmodal=1;
            }
            Pattern pattern1 = Pattern.compile("[0-9/'.']{1,}");
            Matcher matcher1 = pattern1.matcher(vmile);
            boolean matchFound1 = matcher1.find();
            if(matchFound1) {
                       flag_vmile=1;
            } else {
                    flag_vmile=0;
            }
            String url="jdbc:mysql://localhost:3306/cars";
            String user="root";
            String pwd="";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=(Connection) DriverManager.getConnection(url, user, pwd);
            Statement st=conn.createStatement();
            String q="select * from carlends where vno='"+vno+"';";
            ResultSet re=st.executeQuery(q);
            if(re.next()){
                temp=1;
            }
            if(temp==1){
                request.getRequestDispatcher("Lenderprof.jsp").include(request,response);
                out.print("");
            }
            
            /*if(password.equals(passwordconf)){
                flag_cong=1;
                out.println("<h2>Swe is babba</h2>");
            }
            else{
                flag_cong=0;
                out.println("<h2>Passwords did not match</h2>");
            }*/
        if(temp==0 && flag_vmile==1 && flag_vno==1 ){
            
            PrintWriter outs=response.getWriter();
            
            PreparedStatement pstmt=(PreparedStatement) conn.prepareStatement("insert into carlends(vno,vname,vtype,vbags,vcol,vcity,mileage,vfuel)"+"values(?,?,?,?,?,?,?,?)");
            pstmt.setString(1, vno);
            pstmt.setString(2,vmodal);
            pstmt.setString(3,vtype);
            pstmt.setString(4,vbags);
            pstmt.setString(5,vcol);
            pstmt.setString(6,vcity);
            pstmt.setString(7,vmile);
            pstmt.setString(8,vfuel);
            int count=pstmt.executeUpdate();
            
            if(count>0)
            {
                request.getRequestDispatcher("Lenderprof.jsp").include(request,response);
                
            }
            pstmt.close();
            outs.close();
            conn.close();
            /* TODO output your page here. You may use following sample code. */
        }  
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            out.close();
        }
            %>
    </body>
</html>
