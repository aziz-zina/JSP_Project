<!DOCTYPE html>
<html>
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
        <%@ page  language="java" import="java.sql.*" %>
        <%@ include file="../database/basedados.h" %>
        <% 
            if (request.getParameter("login") != null && request.getParameter("pass") != null) {
                //Storing the form values
                String login = request.getParameter("login");
                String pass = request.getParameter("pass");
                /*out.println(login);
                out.println(pass);*/
                //Connecting to the database
                Connection conn = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String jdbcURL="jdbc:mysql://localhost:3306/beauty_salon_management";  // BD "jsp"
                conn = DriverManager.getConnection(jdbcURL,"root", "");
                //SQL Query
                PreparedStatement psSelectRecord=null;
                ResultSet rsSelectRecord=null;
                String sqlSelectRecord=null;
                sqlSelectRecord = "SELECT * FROM user WHERE Login = '" + login + "' AND Password ='" + pass + "'";
                psSelectRecord=conn.prepareStatement(sqlSelectRecord);
                rsSelectRecord=psSelectRecord.executeQuery();
                if (!rsSelectRecord.next()) {
                    response.setHeader("Refresh", "2;url = PgLogin.jsp?state=1"); //If there is no row selected, goes back to the login page
                    return;
                } else {
                    String function = rsSelectRecord.getString("Type");
                    //Storing the login and the function in session variables
                    session.setAttribute("login", login);
                    session.setAttribute("function", function);
                    if (function.equals("4")) {
                        response.setHeader("Refresh", "2; url=homePage.jsp?state=1");
                    } else {
                        response.setHeader("Refresh", "2; url=homePage.jsp");
                    }
                }
            } else {
                session.invalidate();
                response.setHeader("Refresh", "2;url = PgLogin.jsp?state=2"); //If the form is not filled, it goes back to the login page
                return;
            }
        %>
    </body>
</html>
