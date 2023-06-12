<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>
<%@ include file="../database/basedados.h" %>
<%
    session = request.getSession(true);
    if (session.getAttribute("login") != null && request.getParameter("user") != null
            && request.getParameter("date") != null && request.getParameter("time") != null
            && request.getParameter("pet") != null && request.getParameter("service") != null) {

        String user = request.getParameter("user");
        //out.println(user);

        if (session.getAttribute("function").equals(4)) {
            response.sendRedirect("homePage.jsp?state=1");
        }

        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String pet = request.getParameter("pet");
        String[] services = request.getParameterValues("service");

        // Checking the service type
        String srv = "";

        if (services != null && services.length == 1) {
            srv = services[0];
        } else if (services != null && services.length == 2) {
            srv = "Both";
        } else {
            response.setHeader("Refresh", "2; URL= PgReservation.jsp?state=2");
            return; // If the user doesn't choose a service, they go back to the form
        }

        if (request.getParameter("idReservation") != null) {
            String id = request.getParameter("idReservation");
            out.println("<input type='hidden' name='idReservation' value='" + id + "' />");
        }

        out.println(srv);
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Form.css">
    <link rel="stylesheet" href="bootstrap.css">
    <title>Reservation</title>
    <style>
        .check-box {
            display: grid;
            text-align: center;
            margin-left: 40px;
        }
    </style>
</head>

<body>
    <div id="frm2">
        <form name="f1" action="Reservation.jsp" method="POST">
        <%
        if (request.getParameter("idReservation") != null) {
            String id = request.getParameter("idReservation");
        %>
        <input type="hidden" name="idReservation" value="<%= id %>" readonly />
        <%
            }
        %>
        <center>
            <label> User: </label><br>
            <input type="text" name="user" value="<%= user %>" readonly><br><br>

            <label> Pet: </label><br>
            <input type="text" name="pet" value="<%=  pet%>" readonly><br><br>

            <label style="margin-left: -140px;"> Service:</label><br>
            <input type="text" name="service" value="<%= srv %>" readonly><br><br>

            <label> Date: </label><br>
            <input type="date" id="date" name="date" required placeholder="date" value="<%= request.getParameter("date") %>" readonly /><br><br>

            <label> Time: </label><br>
            <input type="time" id="time" name="time" value="<%= request.getParameter("time") %>" readonly /><br><br>
            
            <label style="margin-left: -120px;"> Pick an employee: </label><br>
            <select name="employee">
            <option value="">--- Choose an employee ---</option>
            <%
            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String jdbcURL="jdbc:mysql://localhost:3306/beauty_salon_management";  // BD "jsp"
            conn = DriverManager.getConnection(jdbcURL,"root", "");
            session.setMaxInactiveInterval(1800); // Set session timeout to 30 minutes
            //SQL Query
            PreparedStatement psSelectRecord=null;
            ResultSet rsSelectRecord=null;
            String sqlSelectRecord=null;
            if (pet.equals("dog")) {
                if (srv.equals("Cut")) {
                    sqlSelectRecord = "SELECT * FROM employeeact WHERE Dog = 1 AND Cut = 1";
                } else if (srv.equals("Wash")) {
                    sqlSelectRecord = "SELECT * FROM employeeact WHERE Dog = 1 AND Wash = 1";
                } else {
                    sqlSelectRecord = "SELECT * FROM employeeact WHERE Dog = 1 AND Wash = 1 AND Cut = 1";
                }
            } else {
                if (srv.equals("Cut")) {
                    sqlSelectRecord = "SELECT * FROM employeeact WHERE Cat = 1 AND Cut = 1";
                } else if (srv.equals("Wash")) {
                    sqlSelectRecord = "SELECT * FROM employeeact WHERE Cat = 1 AND Wash = 1";
                } else {
                    sqlSelectRecord = "SELECT * FROM employeeact WHERE Cat = 1 AND Wash = 1 AND Cut = 1";
                }
            }
            psSelectRecord=conn.prepareStatement(sqlSelectRecord);
            rsSelectRecord=psSelectRecord.executeQuery();
            while (rsSelectRecord.next()) {
            %>
            <option value="<%= rsSelectRecord.getString("EmployeeUser") %>"><%= rsSelectRecord.getString("EmployeeUser") %></option>
            <%
                }
            %>
           </select><br><br>

            <button type="submit" class="btn btn-primary">Submit</button><br><br>
        </center>        

<%
}else {
    response.sendRedirect("PgReservation.jsp?state=1");
}
%>
