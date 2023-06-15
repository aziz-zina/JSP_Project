<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Form.css">
    <title>Register</title>
</head>

<body>
    <div id="frm">
        <img src="./loading_images.gif">
    </div>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="../database/basedados.h" %>
<%
session = request.getSession(true);
if (session.getAttribute("login") != null && session.getAttribute("function") != null ){
    String login = request.getParameter("login");
    out.print(login);
    String name = request.getParameter("name");
    out.print(name);
    String tel = request.getParameter("tel");
    out.print(tel);
    String email = request.getParameter("email");
    out.print(email);
    String pass = request.getParameter("pass");
    out.print(pass);

    if(!session.getAttribute("function").equals("4")){
        if(login != null && name != null && tel != null && email != null && pass != null){
            //Connect to DB
            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String jdbcURL="jdbc:mysql://localhost:3306/beauty_salon_management";  // BD "jsp"
            conn = DriverManager.getConnection(jdbcURL,"root", "");

            PreparedStatement psSelectRecord=null;
            ResultSet rsSelectRecord=null;
            String sqlSelectRecord=null;
            sqlSelectRecord = "UPDATE user SET Email = '" + email + "', Name = '" + name + "', Password   = '" + pass + "', Telephone = '" + tel + "' WHERE Login ='" + login + "'";
            psSelectRecord=conn.prepareStatement(sqlSelectRecord);
            psSelectRecord.executeUpdate();
            if(session.getAttribute("function").equals("1")){
                response.setHeader("Refresh", "2;url = adminInterface.jsp?state=1");    
            } else if(session.getAttribute("function").equals("2")){
                response.setHeader("Refresh", "2;url = EmployeeInterface.jsp?state=1");
            } else {
                response.setHeader("Refresh", "2;url = UserInterface.jsp?state=1");
            }
        } else {
            response.setHeader("Refresh", "2;url = UserInterface.jsp?state=2");
        }
    }else {
        response.setHeader("Refresh", "2;url = homePage.jsp?state=3");
    }
    
} else {
    response.setHeader("Refresh", "2;url = PgLogin.jsp?state=2");
}
%>