<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Form.css">
    <title>Reservation</title>
</head>
<body>
    <div id="frm">
        <img src="./loading_images.gif">
    </div>
</body>
</html>

<%@ page import="java.sql.*" %>
<%@ include file="../database/basedados.h" %>
<%
if (session.getAttribute("login") != null && session.getAttribute("function") != null && request.getParameter("date") != null && request.getParameter("time") != null && request.getParameter("pet") != null && request.getParameter("service") != null && request.getParameter("employee") != null && request.getParameter("user") != null) {
    if( session.getAttribute("function") == 4){
        response.setHeader("Refresh", "2;url = homePage.jsp?state=1");
    }
    String date = request.getAttribute("date");
    String time = request.getAttribute("time");
    String pet = request.getAttribute("pet");
    String user = request.getAttribute("user");
    String service = request.getAttribute("service");
    String employee = request.getAttribute("employee");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String jdbcURL="jdbc:mysql://localhost:3306/beauty_salon_management";  // BD "jsp"
    conn = DriverManager.getConnection(jdbcURL,"root", "");
    //SQL Query
    PreparedStatement psSelectRecord=null;
    ResultSet rsSelectRecord=null;
    String sqlSelectRecord=null;
    sqlSelectRecord = "SELECT * FROM reservation WHERE time = '$time' AND date = '$date'";
    psSelectRecord=conn.prepareStatement(sqlSelectRecord);
    rsSelectRecord=psSelectRecord.executeQuery();
    if (!rsSelectRecord.next()) {
        $sql = "INSERT INTO reservation (idClient, date, time, pet, serviceType, EmployeeUser) VALUES (?, ?, ?, ?, ?, ?)";
        psSelectRecord=conn.prepareStatement(sqlSelectRecord);
        psSelectRecord.setString(1, user);
        psSelectRecord.setString(2, date);
        psSelectRecord.setString(3, time);
        psSelectRecord.setString(4, pet);
        psSelectRecord.setString(5, service);
        psSelectRecord.setString(5, employee);
        psSelectRecord.executeUpdate();
        response.setHeader("Refresh", "2;url = PgLogin.jsp"); //If there is no row selected, goes back to the login page
    }
}
%>
