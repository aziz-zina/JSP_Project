<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Form.css">
    <title>Employee Activities</title>
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
        String login = request.getParameter("login");
        String cut = request.getParameter("cut");
        String wash = request.getParameter("wash");
        String cat = request.getParameter("cat");
        String dog = request.getParameter("dog");
        if(login != null && cut != null && wash != null && cat != null && dog != null){
            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String jdbcURL="jdbc:mysql://localhost:3306/beauty_salon_management";  // BD "jsp"
            conn = DriverManager.getConnection(jdbcURL,"root", "");
            session.setMaxInactiveInterval(1800); // Set session timeout to 30 minutes

            PreparedStatement psSelectRecord=null;
            ResultSet rsSelectRecord=null;
            String sqlSelectRecord=null;

            sqlSelectRecord = "SELECT * FROM employeeact WHERE EmployeeUser = '" + login + "'";
            psSelectRecord=conn.prepareStatement(sqlSelectRecord);
            rsSelectRecord=psSelectRecord.executeQuery();
            if(rsSelectRecord.next()){
                sqlSelectRecord = "UPDATE employeeact SET Cut = '" + cut + "', Wash = '" + wash + "', Cat = '" + cat + "', Dog = '" + dog + "' WHERE EmployeeUser ='" + login + "'";
            } else {
                sqlSelectRecord = "INSERT INTO employeeact (Cut, WAsh, Cat, Dog, EmployeeUser) VALUES ('" + cut + "', '" + wash + "', '" + cat + "', '" + dog + "', '" + login + "')";
            }
            psSelectRecord=conn.prepareStatement(sqlSelectRecord);
            psSelectRecord.executeUpdate();
            response.setHeader("Refresh", "2;url = userManagement.jsp?state=1");
        } else {
            response.setHeader("Refresh", "2;url = userManagement.jsp?state=3");
        }
    } else {
        response.setHeader("Refresh", "2;url = homePage.jsp?state=1");
    }
}else {
    response.setHeader("Refresh", "2;url = PgLogin.jsp?state=2");
}
%>