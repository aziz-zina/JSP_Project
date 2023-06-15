<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="../database/basedados.h" %>
<%
session = request.getSession(true);
if (session.getAttribute("login") != null && session.getAttribute("function") != null ){
    if(session.getAttribute("function").equals("1")){
        String emp = request.getParameter("emp");
        if(emp == null){
            response.setHeader("Refresh", "2;url = userManagement.jsp?state=3");
        }
    } else {
        response.setHeader("Refresh", "2;url = homePage.jsp?state=1");
    }
}else {
    response.setHeader("Refresh", "2;url = PgLogin.jsp?state=2");
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
    <title>Employee Activities</title>
</head>

<body>
    <div id="frm2">
        <form name="f1" action="EmpAct.jsp" method="POST">
            <center>
                <label> Login: </label><br>
                <input type="text" id="login" name="login" value="<%= request.getParameter("emp") %>" readonly/><br><br>

                <label style="margin-left: -170px;"> Cut: </label><br>
                <input type="number" name="cut" required min="0" max="1" value="0" /><br><br>

                <label> Wash: </label><br>
                <input type="number" name="wash" required min="0" max="1" value="0" /><br><br>

                <label> Dog: </label><br>
                <input type="number" name="dog" required min="0" max="1" value="0" /><br><br>

                <label> Cat: </label><br>
                <input type="number" name="cat" required min="0" max="1" value="0" /><br><br>

                <button type="submit" class="btn btn-primary">Submit</button><br><br>
                <a href="PgLogin.jsp">Login here.</a><br>
                <a href="homePage.jsp">Go back to home page</a><br><br>
            </center>
        </form>
    </div>
</body>

</html>