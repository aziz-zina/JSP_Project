<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Form.css">
    <title>Checking date and time</title>
    <style>
        #sub {
            margin-top: -100px;
        }
    </style>
</head>

<body>
    <div id="frm">
        <img src="./loading_images.gif">
    </div>
</body>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="../database/basedados.h" %>
<%
session = request.getSession(true);
if (session.getAttribute("login") != null && session.getAttribute("function") != null ){
    //Connect to DB
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String jdbcURL="jdbc:mysql://localhost:3306/beauty_salon_management";  // BD "jsp"
    conn = DriverManager.getConnection(jdbcURL,"root", "");

    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String pet = request.getParameter("pet");
    String user = request.getParameter("user");
    String[] services = request.getParameterValues("service");
    if( date != null && time != null && pet != null && user != "" && services != null){
        String srv = "";
        if (services != null && services.length == 1) {
            srv = services[0];
        } else if (services != null && services.length == 2) {
            srv = "Both";
        } else {
            response.setHeader("Refresh", "2; URL= PgReservation.jsp?state=2");
            return; // If the user doesn't choose a service, they go back to the form
        }
        out.println(srv);
        String id = request.getParameter("idReservation");
        if( id != null){
            PreparedStatement psSelectRecord=null;
            ResultSet rsSelectRecord=null;
            String sqlSelectRecord=null;
            sqlSelectRecord = "SELECT * FROM reservation WHERE time = '$time' AND date = '$date' AND idReservation <> '$id';";
            psSelectRecord = conn.prepareStatement(sqlSelectRecord);
            rsSelectRecord = psSelectRecord.executeQuery();
            if (rsSelectRecord.next()) {
                response.setHeader("Refresh", "2;url = PgReservation.jsp?state=3");
            }else {
                %>
                <center>
                    <form id="sub" action="pickEmployee.jsp" method="POST">
                        <input type="hidden" name="idReservation" value="<%= id %>" readonly>
                        <input type="hidden" name="user" value="<%= user %>" readonly>
                        <input type="hidden" name="pet" value="<%= pet %>" readonly>
                        <input type="hidden" name="service" value="<%= srv %>" readonly>
                        <input type="hidden" id="date" name="date" required placeholder="date" value="<%= date %>" readonly />
                        <input type="hidden" id="time" name="time" value="<%= time %>" readonly />
                        <input type="submit" value="Submit" autofocus>
                        </form>
                </center>
                <%
            }
        } else {
            PreparedStatement psSelectRecord=null;
            ResultSet rsSelectRecord=null;
            String sqlSelectRecord=null;
            sqlSelectRecord = "SELECT * FROM reservation WHERE time = '$time' AND date = '$date'";
            psSelectRecord = conn.prepareStatement(sqlSelectRecord);
            rsSelectRecord = psSelectRecord.executeQuery();
            if (rsSelectRecord.next()) {
                response.setHeader("Refresh", "2;url = PgReservation.jsp?state=3");
            }else {
                %>
                <center>
                    <form id="sub" action="pickEmployee.jsp" method="POST">
                        <input type="hidden" name="user" value="<%= user %>" readonly>
                        <input type="hidden" name="pet" value="<%= pet %>" readonly>
                        <input type="hidden" name="service" value="<%= srv %>" readonly>
                        <input type="hidden" id="date" name="date" required placeholder="date" value="<%= date %>" readonly />
                        <input type="hidden" id="time" name="time" value="<%= time %>" readonly />
                        <input type="submit" value="Submit" autofocus>
                        </form>
                </center>
                <%
            }
        }
    } else {
        response.setHeader("Refresh", "2;url = PgReservation.jsp?state=1");
    }
} else {
    response.setHeader("Refresh", "2;url = PgLogin.jsp?state=2");
}
%>