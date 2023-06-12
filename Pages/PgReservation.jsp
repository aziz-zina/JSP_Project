<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>

<%
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String jdbcURL="jdbc:mysql://localhost:3306/beauty_salon_management";  // BD "jsp"
    conn = DriverManager.getConnection(jdbcURL,"root", "");
    session.setMaxInactiveInterval(1800); // Set session timeout to 30 minutes

    if (session.getAttribute("login") != null) {
        if (session.getAttribute("function").equals("4")) {
            response.sendRedirect("homePage.jsp?state=1");
        }
        java.util.Date today = new java.util.Date(); // Create a new Date object
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd"); // Define the date format
        String formattedDate = sdf.format(today); // Format the date as a string
        request.setAttribute("today", formattedDate);
    } else {
        response.sendRedirect("PgLogin.jsp?state=2");
    }

    if (request.getParameter("state") != null) {
        switch (request.getParameter("state")) {
            case "1":
                out.println("<script>alert('You have to fill this form first!!');</script>");
                break;
            case "2":
                out.println("<script>alert('You need to choose a service first !');</script>");
                break;
            case "3":
                out.println("<script>alert('You need to choose a unique time and date !');</script>");
                break;
        }
    }
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
        <!------------<form name="f1" action="pickEmployee.jsp" method="POST"> ------>
        <form name="f1" action="pickEmployee.jsp" method="POST">
            <center>
                <%
                    if (session.getAttribute("function") != null && session.getAttribute("function").equals("1")) {
                %>
                <label style="margin-left: -95px;"> Pick the user: </label><br>
                <select name="user">
                    <option value="">--Choose a user--</option>
                    <%
                        // Assuming you have a database connection object named "conn"
                        // You need to replace the placeholders with your actual database connection code
                        // String dbHost = "your_database_host";
                        // String dbName = "your_database_name";
                        // String dbUser = "your_database_user";
                        // String dbPass = "your_database_password";
                        // Connection conn = DriverManager.getConnection("jdbc:mysql://" + dbHost + "/" + dbName, dbUser, dbPass);
                        PreparedStatement psSelectRecord=null;
                        ResultSet rsSelectRecord=null;
                        String sqlSelectRecord=null;
                        sqlSelectRecord = "SELECT * FROM user WHERE Type != 4";
                        psSelectRecord = conn.prepareStatement(sqlSelectRecord);
                        rsSelectRecord = psSelectRecord.executeQuery();
                        while (rsSelectRecord.next()) {
                            out.println("<option value='" + rsSelectRecord.getString("Login") + "'>" + rsSelectRecord.getString("Login") + "</option>");
                        }
                        rsSelectRecord.close();
                        psSelectRecord.close();
                    %>
                </select><br><br>
                <%
                    } else if (session.getAttribute("function") != null && session.getAttribute("function").equals("2")) {
                %>
                <label style="margin-left: -95px;"> Pick the user: </label><br>
                <select name="user">
                    <option value="">--Choose a user--</option>
                    <%
                        // Assuming you have a database connection object named "conn"
                        // You need to replace the placeholders with your actual database connection code
                        // String dbHost = "your_database_host";
                        // String dbName = "your_database_name";
                        // String dbUser = "your_database_user";
                        // String dbPass = "your_database_password";
                        // Connection conn = DriverManager.getConnection("jdbc:mysql://" + dbHost + "/" + dbName, dbUser, dbPass);
                        PreparedStatement psSelectRecord=null;
                        ResultSet rsSelectRecord=null;
                        String sqlSelectRecord=null;
                        sqlSelectRecord = "SELECT * FROM user WHERE type = 3 OR (type = 2 AND login = '" + session.getAttribute("login") + "')";
                        psSelectRecord = conn.prepareStatement(sqlSelectRecord);
                        //psSelectRecord.setString(1, session.getAttribute("login").toString());
                        rsSelectRecord = psSelectRecord.executeQuery();
                        while (rsSelectRecord.next()) {
                            out.println("<option value='" + rsSelectRecord.getString("Login") + "'>" + rsSelectRecord.getString("Login") + "</option>");
                        }
                        rsSelectRecord.close();
                        psSelectRecord.close();
                    %>
                </select><br><br>
                <%
                    } else {
                %>
                <label> User: </label><br>
                <input type="text" name="user" value="<%= session.getAttribute("login") %>" readonly><br><br>
                <%
                    }
                %>
                <label> Date: </label><br>
                <input type="date" id="date" name="date" required placeholder="date" min="${today}" /><br><br>

                <label> Time: </label><br>
                <input type="time" id="time" name="time" required min="09:00:00" max="18:00:00" step="1800" /><br><br>

                <label style="margin-left: -120px;"> Pick a Pet: </label><br>
                <select name="pet">
                    <option value="Dog">Dog</option>
                    <option value="Cat">Cat</option>
                </select><br><br>

                <label style="margin-left: -90px;"> Pick a service: </label><br>
                <div class="check-box">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="Cut" id="flexCheckDefault" name="service">
                        <label class="form-check-label" for="flexCheckDefault">
                            Cut
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="Wash" id="flexCheckChecked" name="service">
                        <label class="form-check-label" for="flexCheckChecked">
                            Wash
                        </label>
                    </div>
                </div>
                <br>

                <button type="submit" class="btn btn-primary">Submit</button><br><br>
                <a href="homePage.jsp">Go back to home page</a><br><br>
            </center>
        </form>
    </div>
</body>
</html>