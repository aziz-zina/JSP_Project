<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Form.css">
    <title>Loading</title>
</head>

<body>
    <div id="frm">
        <img src="./loading_images.gif">
    </div>
</body>

</html>

<%
    session.setMaxInactiveInterval(60 * 60); // Set session timeout to 1 hour (optional)
    String login = (String) session.getAttribute("login");
    String function = (String) session.getAttribute("function");
    if (login != null && function != null) {
        if (function.equals("1")) {
            response.setHeader("Refresh", "2;url=adminInterface.jsp");
        } else if (function.equals("2")) {
            response.setHeader("Refresh", "2;url=EmployeeInterface.jsp");
        } else if (function.equals("3")) {
            response.setHeader("Refresh", "2;url=UserInterface.jsp");
        } else if (function.equals("4")) {
            response.setHeader("Refresh", "2;url=homePage.jsp?state=1");
        }
    } else {
        session.invalidate();
        response.setHeader("Refresh", "2;url=PgLogin.jsp?state=2");
    }
%>
