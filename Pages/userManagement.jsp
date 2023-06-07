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
    <a href="./homePage.php"><img src="./home.png" alt="home.png" class="button"></a>
    <a href="PgRegister.php"><img src="./add-user.png" alt="home.png" class="button2"></a>
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
                if (session.getAttribute("login") != null && session.getAttribute("function").equals(1)) {
                    if (session.getAttribute("function").equals(1)) {
                        // Assuming basedados.h is a JSP file included using <%@ include file="../database/basedados.h" %>
                        // You can replace it with the appropriate JSP code to establish a database connection and query
                        Connection conn = null;
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        String jdbcURL = "jdbc:mysql://localhost:3306/beauty_salon_management"; // BD "jsp"
                        conn = DriverManager.getConnection(jdbcURL, "root", "");
                        
                        // SQL Query
                        PreparedStatement psSelectRecord = null;
                        ResultSet rsSelectRecord = null;
                        String sqlSelectRecord = null;
                        sqlSelectRecord = "SELECT * FROM user";
                        psSelectRecord = conn.prepareStatement(sqlSelectRecord);
                        rsSelectRecord = psSelectRecord.executeQuery();

                        // Assuming conn is the database connection object
                        if (!rsSelectRecord.next()) {
                            response.setHeader("Refresh", "2;url=PgLogin.jsp?state=1"); // If there is no row selected, go back to the login page
                            return;
                        } else {
                            while (rsSelectRecord.next()) {
                                out.println("<tr class='table-secondary'><td>" + rsSelectRecord.getString("Login") + "</td>");
                                out.println("<td>" + rsSelectRecord.getString("Email") + "</td>");
                                out.println("<td>" + rsSelectRecord.getString("Telephone") + "</td>");
                                int type = rsSelectRecord.getInt("Type");
                                switch (type) {
                                    case 1:
                                        out.println("<td>Administrator</td>");
                                        break;
                                    case 2:
                                        out.println("<td>Employee</td>");
                                        break;
                                    case 3:
                                        out.println("<td>Validated client</td>");
                                        break;
                                    case 4:
                                        out.println("<td>Client not validated</td>");
                                        break;
                                }
                                if (type != 1) {
                                    if (type == 4) {
                                        out.println("<td><a href='validate.jsp?val=" + rsSelectRecord.getString("Login") + "'><img src='check-mark.png' class='management-icon'></a></td>");
                                    } else {
                                        out.println("<td><a href='delete_user.jsp?val=" + rsSelectRecord.getString("Login") + "'></a></td>");
                                    }
                                    out.println("<td><a href='Pgedit_user.jsp?val=" + rsSelectRecord.getString("Login") + "'><img src='edit.png' class='management-icon'></a></td>");
                                    out.println("<td><a href='delete_user.jsp?val=" + rsSelectRecord.getString("Login") + "'><img src='remove.png' class='management-icon'></a></td>");
                                } else {
                                    out.println("<td></td>");
                                    out.println("<td><a href='Pgedit_user.jsp?val=" + rsSelectRecord.getString("Login") + "'><img src='edit.png' class='management-icon'></a></td>");
                                    out.println("<td></td>");
                                }
                                out.println("</tr>");
                            }
                            rsSelectRecord.close();
                            conn.close();
                        }
                    }
                } else {
                    response.sendRedirect("homePage.jsp?state=3");
                }
                %>
            </tbody>
        </table>
    </div>
</body>

</html>
