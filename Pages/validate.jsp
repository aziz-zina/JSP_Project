<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Form.css">
    <title>Login</title>
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
    if(session.getAttribute("function").equals("1")){
        String val = request.getParameter("val");
        Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String jdbcURL="jdbc:mysql://localhost:3306/beauty_salon_management";  // BD "jsp"
        conn = DriverManager.getConnection(jdbcURL,"root", "");
        //SQL Query
        PreparedStatement psSelectRecord=null;
        ResultSet rsSelectRecord=null;
        String sqlSelectRecord=null;
        sqlSelectRecord = "UPDATE user SET type = 3 WHERE Login ='" + val + "';";
        psSelectRecord=conn.prepareStatement(sqlSelectRecord);
        psSelectRecord.executeUpdate();
        response.setHeader("Refresh", "2;url = userManagement.jsp?state=4");
    } else {
        response.setHeader("Refresh", "2;url = homePage.jsp?state=3");
    }
} else {
    response.setHeader("Refresh", "2;url = PgLogin.jsp?state=2");
}
%>