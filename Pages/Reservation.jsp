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
    if( session.getAttribute("function").equals("4")){
        response.setHeader("Refresh", "2;url = homePage.jsp?state=1");
    }
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String pet = request.getParameter("pet");
    String user = request.getParameter("user");
    String service = request.getParameter("service");
    String employee = request.getParameter("employee");

    Connection conn = null;
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
        sqlSelectRecord = "INSERT INTO reservation (idClient, date, time, pet, serviceType, EmployeeUser) VALUES (?, ?, ?, ?, ?, ?)";
        psSelectRecord=conn.prepareStatement(sqlSelectRecord);
        psSelectRecord.setString(1, user);
        psSelectRecord.setString(2, date);
        psSelectRecord.setString(3, time);
        psSelectRecord.setString(4, pet);
        psSelectRecord.setString(5, service);
        psSelectRecord.setString(6, employee);
        psSelectRecord.executeUpdate();
        response.setHeader("Refresh", "2;url = homePage.jsp"); //If there is no row selected, goes back to the login page
    }else {
        if (request.getParameter("idReservation") != null) {
            String id = request.getParameter("idReservation");
            sqlSelectRecord = "UPDATE reservation SET EmployeeUser = '" + employee + "', date = '" + date + "', time = '" + time + "', pet = '" + pet + "', serviceType = '" + service + "' WHERE idReservation = '" + id + "'";
            psSelectRecord=conn.prepareStatement(sqlSelectRecord);
            psSelectRecord.executeUpdate();
            response.setHeader("Refresh", "2;url = homePage.jsp"); //If there is no row selected, goes back to the login page
        } else {
            response.setHeader("Refresh", "2;url=PgReservation.jsp?state=3");
        }
    }
    /*if(rsSelectRecord.next()){
        response.setHeader("Refresh", "2;url = homePage.jsp"); //If there is no row selected, goes back to the login page
    }*/
} else{
    response.setHeader("Refresh", "2; url=PgReservation.php?state=1");
}
%>
