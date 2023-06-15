<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="../database/basedados.h" %>
<%
session = request.getSession(true);
if (session.getAttribute("login") != null && session.getAttribute("function") != null ){
    if(session.getAttribute("function").equals("4")){
        response.sendRedirect("homePage.jsp?state=3");
    }
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String jdbcURL="jdbc:mysql://localhost:3306/beauty_salon_management";  // BD "jsp"
    conn = DriverManager.getConnection(jdbcURL,"root", "");
    session.setMaxInactiveInterval(1800); // Set session timeout to 30 minutes
    //SQL Query
    PreparedStatement psSelectRecord=null;
    ResultSet rsSelectRecord=null;
    String sqlSelectRecord=null;
    sqlSelectRecord = "SELECT * FROM user WHERE Login='" + session.getAttribute("login") + "'";
    psSelectRecord=conn.prepareStatement(sqlSelectRecord);
    rsSelectRecord=psSelectRecord.executeQuery();
    if(rsSelectRecord.next()){
        String login = rsSelectRecord.getString("Login");
        //out.println(login);
        String email = rsSelectRecord.getString("Email");
        //out.println(email);
        String name = rsSelectRecord.getString("Name");
        //out.println(name);
        String tel = rsSelectRecord.getString("Telephone");
        //out.println(tel);       
        
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Form.css">
    <link rel="stylesheet" href="bootstrap.css">
    <title>Register</title>
</head>

<body>
    <div id="frm2">
        <form name="f1" action="personal_info.jsp" method="POST">
            <center>
                <label> Login: </label><br>
                <input type="text" id="login" readonly name="login" required placeholder="Login"
                    value="<%= login %>"/><br><br>

                <label> Email: </label><br>
                <input type="email" id="email" name="email" required placeholder="E-mail"
                    value="<%= email %>"/><br><br>

                <label> Name: </label><br>
                <input type="text" id="name" name="name" required placeholder="Name"
                    value="<%= name %>"/><br><br>

                <label style="margin-left: -120px;"> Telephone: </label><br>
                <input type="tel" id="tel" name="tel" required placeholder="Telephone number"
                    value="<%= tel %>"/><br><br>

                <label style="margin-left: -126px;"> Password: </label><br>
                <input type="password" id="pass" name="pass" required placeholder="Password"/><br><br>

                <button type="submit" class="btn btn-primary">EDIT</button><br><br>
                <a href="userManagement.jsp">Go Back.</a><br>
            </center>
        </form>
    </div>
</body>

</html>
<%
        }
}else {
    response.sendRedirect("PgLogin.jsp?state=2");
}
%>