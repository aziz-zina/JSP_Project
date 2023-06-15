<!DOCTYPE html>
<html lang="en">

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
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String tel = request.getParameter("tel");
        String type = request.getParameter("type");
        String password = request.getParameter("pass");
        if(login != null && email != null && name != null && tel != null && type != null && password != null){
            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String jdbcURL="jdbc:mysql://localhost:3306/beauty_salon_management";  // BD "jsp"
            conn = DriverManager.getConnection(jdbcURL,"root", "");
            session.setMaxInactiveInterval(1800); // Set session timeout to 30 minutes

            PreparedStatement psSelectRecord=null;
            ResultSet rsSelectRecord=null;
            String sqlSelectRecord=null;
            
            if(type.equals("2")){
                sqlSelectRecord = "UPDATE user SET Email = '" + email + "', Name = '" + name + "', Password = '" + password + "', Telephone = '" + tel + "', Type = '" + type + "' WHERE Login ='" + login + "'";
                psSelectRecord=conn.prepareStatement(sqlSelectRecord);
                psSelectRecord.executeUpdate();
                response.setHeader("Refresh", "2;url = PgEmpAct.jsp?emp=" + login );
            }else {
                %>
                <center>
                    <form id="sub" action="edit_user.jsp" method="POST">
                        <input type="hidden" name="login" value="<%= login %>" readonly>
                        <input type="hidden" name="email" value="<%= email %>" readonly>
                        <input type="hidden" name="name" value="<%= name %>" readonly>
                        <input type="hidden" name="tel" value="<%= tel %>" readonly>
                        <input type="hidden" name="type" value="<%= type %>" readonly />
                        <input type="hidden" name="password" value="<%= password %>" readonly />
                        <input type="submit" value="Submit" autofocus>
                    </form>
                </center>
                <%
            }
        }
    }
} else {
    response.setHeader("Refresh", "2;url = PgLogin.jsp?state=2");
}
%>