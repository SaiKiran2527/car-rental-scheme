<%-- 
    Document   : regiCantiCars
    Created on : 27-Aug-2020, 2:37:12 pm
    Author     : sathvika
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
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
            String username=request.getParameter("username");
            int flag_name=0,flag_pass=0,flag_cong=0,flag_email=0,flag_pn=0;
            String password=request.getParameter("password");
            String passwordconf=request.getParameter("passwordconf");
            String emailid=request.getParameter("emailid");
            String phonenumber=request.getParameter("phonenumber");
            String usertype=request.getParameter("usertype");
            String city=request.getParameter("city").toLowerCase();
            String secquest=request.getParameter("secquest");
            String secans=request.getParameter("secans");
            String url="jdbc:mysql://localhost:3306/cars";
            String user="root";
            String pwd="";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=(Connection) DriverManager.getConnection(url, user, pwd);
            Statement st=conn.createStatement();
            String q="select * from userdetails where username='"+username+"';";
            ResultSet re=st.executeQuery(q);
            if(re.next()){
                temp=1;
            }
            if(temp==1){
                request.getRequestDispatcher("registerCantiCars.jsp").include(request,response);
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

"    <center><h2 class=\"w3-text-red\">ERROR : USERNAME ALREADY EXIST</h2>\n" +
"    <hr style=\"width:200px\" class=\"w3-opacity\"></center>\n" +
"\n" +
"    \n" +
"\n" +
"    \n" +
"</body>");
            }
            Pattern pattern = Pattern.compile("^([A-Za-z|' ']{1,45})$");
            Matcher matcher = pattern.matcher(username);
            boolean matchFound = matcher.find();
            if(matchFound) {
                       flag_name=1;
            } else {
                flag_name=0;
            }
            Pattern pattern1 = Pattern.compile("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
            Matcher matcher1 = pattern1.matcher(password);
            boolean matchFound1 = matcher1.find();
            if(matchFound1) {
                       flag_pass=1;
            } else {
                    flag_pass=0;
            }
            Pattern pattern2 = Pattern.compile("^([a-z\\d\\.-]+)@([a-z\\d-]+)\\.([a-z]{2,8})$");
            Matcher matcher2 = pattern2.matcher(emailid);
            boolean matchFound2 = matcher2.find();
            if(matchFound2) {
                       flag_email=1;
            } else {
                    flag_email=0;
            }
            Pattern pattern3 = Pattern.compile("[6-9]{1}[0-9]{9}");
            Matcher matcher3 = pattern3.matcher(phonenumber);
            boolean matchFound3 = matcher3.find();
            if(matchFound3) {
                       flag_pn=1;
            } else {
                    flag_pn=0;
            }
           if(password.equals(passwordconf)){
                flag_cong=1;
                //out.println("<h2>Swe is babba</h2>");
            }
            if(!(password.equals(passwordconf))){
                flag_cong=0;
                request.getRequestDispatcher("registerCantiCars.jsp").include(request,response);
                out.print("<meta charset=\"UTF-8\">\n" +
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

"    <center><h2 class=\"w3-text-red\">Passwords Mis-Match Error</h2>\n" +
"    <hr style=\"width:200px\" class=\"w3-opacity\"></center>\n" +
"\n" +
"    \n" +
"\n" +
"    \n" +
"</body>");
                //out.println("<h2>Swe is babba</h2>");
            }
        if(flag_name==1 && flag_pass==1 && flag_email==1 && flag_pn==1 && temp==0 && flag_cong==1){
            
            PrintWriter outs=response.getWriter();
            
            PreparedStatement pstmt=(PreparedStatement) conn.prepareStatement("insert into userdetails(username,password,phonenumber,usertype,emailid,secquest,secans,city)"+"values(?,?,?,?,?,?,?,?)");
            pstmt.setString(1, username);
            pstmt.setString(2,password);
            pstmt.setString(3,phonenumber);
            pstmt.setString(4,usertype);
            pstmt.setString(5,emailid);
            pstmt.setString(6,secquest);
            pstmt.setString(7,secans);
            pstmt.setString(8,city);
            
            
            if(pstmt.executeUpdate()>0)
            {
                //response.sendRedirect("index.jsp");
                request.getRequestDispatcher("index.jsp").include(request,response);
                outs.println("<meta charset=\"UTF-8\">\n" +
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

"    <center><h2 class=\"w3-text-light-green\">Registration Successful</h2>\n" +
"    <hr style=\"width:200px\" class=\"w3-opacity\"></center>\n" +
"\n" +
"    \n" +
"\n" +
"    \n" +
"</body>");
            }
            else
            {
            //response.sendRedirect("registerCantiCars.jsp");
                request.getRequestDispatcher("registerCantiCars.jsp").include(request,response);
                outs.print("<meta charset=\"UTF-8\">\n" +
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

"    <center><h2 class=\"w3-text-red\">Registration Failed</h2>\n" +
"    <hr style=\"width:200px\" class=\"w3-opacity\"></center>\n" +
"\n" +
"    \n" +
"\n" +
"    \n" +
"</body>");
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
