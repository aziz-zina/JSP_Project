<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Form.css">
    <title>Register</title>
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
if (request.getParameter("login") != null && request.getParameter("pass") != null && request.getParameter("tel") != null && request.getParameter("name") != null && request.getParameter("email") != null) {
    String login = request.getParameter("login");
    String pass = request.getParameter("pass");
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String jdbcURL="jdbc:mysql://localhost:3306/beauty_salon_management";  // BD "jsp"
    conn = DriverManager.getConnection(jdbcURL,"root", "");
    //SQL Query
    PreparedStatement psSelectRecord=null;
    ResultSet rsSelectRecord=null;
    String sqlSelectRecord=null;
    sqlSelectRecord = "SELECT * FROM user WHERE Login = '" + login + "'";
    psSelectRecord=conn.prepareStatement(sqlSelectRecord);
    rsSelectRecord=psSelectRecord.executeQuery();
    if (!rsSelectRecord.next()) {
        sqlSelectRecord = "INSERT INTO user (Login, Password, Name, Email, Telephone, Type) VALUES (?, ?, ?, ?, ?, 4)";
        psSelectRecord=conn.prepareStatement(sqlSelectRecord);
        psSelectRecord.setString(1, login);
        psSelectRecord.setString(2, pass);
        psSelectRecord.setString(3, name);
        psSelectRecord.setString(4, email);
        psSelectRecord.setString(5, tel);
        psSelectRecord.executeUpdate();
        if(session.getAttribute("function") != null){
            if(session.getAttribute("function").equals("1")){
                response.setHeader("Refresh", "2;url = userManagement.jsp");
            }
        }
        response.setHeader("Refresh", "2;url = PgLogin.jsp");
    } else {
        response.setHeader("Refresh", "2;url = PgRegister.jsp?state=1");
    }
} else {
    response.setHeader("Refresh", "2;url = PgRegister.jsp?state=2");
}
%>