<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ include file="../database/basedados.h" %>
<%
String state = request.getParameter("state");
if (state != null) {
    switch (state) {
        case "1":
            out.println("<script>alert('User edited.');</script>");
            break;
        case "2":
            out.println("<script>alert('User has been deleted.');</script>");
            break;
        case "3":
            out.println("<script>alert('You need to fill the form first!');</script>");
            break;
        case "4":
            out.println("<script>alert('User has been validated');</script>");
            break;
        case "5":
            out.println("<script>alert('A problem occured!');</script>");
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
    <link rel="stylesheet" href="bootstrap.css">
    <title>User management</title>
    <style>
        body {
            background: #eee;
            background-image: url("login-background-img.jpg");
            /*background-image: url("1431301.jpg");*/
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        .table-div {
            margin: 5%;
            margin-top: 10px;
        }

        .management-icon {
            width: 40px;
            height: 40px;
        }

        .button {
            margin-top: 3%;
            height: 60px;
            width: 60px;
            margin-left: 1270px;
        }

        .button2 {
            margin-top: 3%;
            height: 60px;
            width: 60px;
            margin-left: 30px;
        }
    </style>

</head>

<body>
    <a href="./homePage.jsp"><img src="./home.png" alt="home.png" class="button"></a>
    <a href="PgRegister.jsp"><img src="./add-user.png" alt="home.png" class="button2"></a>
    <div class="table-div">
        <table class="table table-hover">
            <thead style="background-color: #c3a48f;">
                <tr>
                    <th scope="col" style="color: black;">Login</th>
                    <th scope="col" style="color: black;">E-mail</th>
                    <th scope="col" style="color: black;">tel</th>
                    <th scope="col" style="color: black;">Type</th>
                    <th scope="col" style="color: black;">Validate</th>
                    <th scope="col" style="color: black;">Edit</th>
                    <th scope="col" style="color: black;">Remove</th>
                </tr>
            </thead>
            <tbody>
            <% 
            session = request.getSession(true);
            if (session.getAttribute("login") != null && session.getAttribute("function") != null ){
                if(session.getAttribute("function").equals("1")){
                    Connection conn = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    String jdbcURL="jdbc:mysql://localhost:3306/beauty_salon_management";  // BD "jsp"
                    conn = DriverManager.getConnection(jdbcURL,"root", "");
                    session.setMaxInactiveInterval(1800); // Set session timeout to 30 minutes
                    //SQL Query
                    PreparedStatement psSelectRecord=null;
                    ResultSet rsSelectRecord=null;
                    String sqlSelectRecord=null;
                    sqlSelectRecord = "SELECT * FROM user";
                    psSelectRecord=conn.prepareStatement(sqlSelectRecord);
                    rsSelectRecord=psSelectRecord.executeQuery();
                    if (!rsSelectRecord.next()) {
                        response.setHeader("Refresh", "2;url = PgLogin.jsp?state=1"); //If there is no row selected, goes back to the login page
                        return;
                    }
                    while(rsSelectRecord.next()){
                        out.println("<tr class='table-secondary'><td>" + rsSelectRecord.getString("login") + "</td>");
                        out.println("<td>" + rsSelectRecord.getString("Email") + "</td>");
                        out.println("<td>" + rsSelectRecord.getString("Telephone") + "</td>");
                        if (rsSelectRecord.getString("Type").equals("1")) {
                            out.println("<td>Administrator</td>");
                        } else if(rsSelectRecord.getString("Type").equals("2")){
                            out.println("<td>Employee</td>");
                        } else if(rsSelectRecord.getString("Type").equals("3")){
                            out.println("<td>Validated client</td>");
                        } else{
                            out.println("<td>Client not validated</td>");
                        }
                        if (!rsSelectRecord.getString("Type").equals("1")) {
                            if (rsSelectRecord.getString("Type").equals("4")) {
                                out.println("<td><a href='validate.jsp?val=" + rsSelectRecord.getString("login") + "'><img src='check-mark.png' class='management-icon'></a></td>");
                            } else {
                                out.println("<td><a href='delete_user.jsp?val=" + rsSelectRecord.getString("login") + "'></a></td>");
                            }
                            out.println("<td><a href='Pgedit_user.jsp?val=" + rsSelectRecord.getString("login") + "'><img src='edit.png' class='management-icon'></a></td>");
                            out.println("<td><a href='delete_user.jsp?val=" + rsSelectRecord.getString("login") + "'><img src='remove.png' class='management-icon'></a></td>");
                        } else {
                            out.println("<td></td>");
                            out.println("<td><a href='Pgedit_user.jsp?val=" + rsSelectRecord.getString("login") + "'><img src='edit.png' class='management-icon'></a></td>");
                            out.println("<td></td>");
                        }
                    } 
                } else {
                    response.setHeader("Refresh", "2; URL= homePage.jsp?state=3");
                }
            }
            %>
            </tbody>
        </table>
    </div>
</body>

</html>
