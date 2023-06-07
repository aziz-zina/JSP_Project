<% 
  session.setAttribute("state", request.getParameter("state"));
  if (request.getParameter("state") != null) {
    switch (Integer.parseInt(request.getParameter("state"))) {
      case 1:
        out.println("<script>alert('This user doesn\\'t exist !!');</script>");
        break;
      case 2:
        out.println("<script>alert('You need to authenticate first !');</script>");
        break;
      case 3:
        out.println("<script>alert(\"You don't have access to this page.\");</script>");
        break;
      case 4:
        out.println("<script>alert('Disconnected');</script>");
        break;
      case 5:
        out.println("<script>alert(\"This function doesn't exist.\");</script>");
        break;
    }
  }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet" href="Form.css">
  <link rel="stylesheet" href="bootstrap.css">
</head>

<body>
  <div id="frm">
    <form name="f1" action="login.jsp" method="post">
      <center>
        <label>Login:</label><br>
        <input type="text" id="login" name="login" required placeholder="Login"><br><br>

        <label>Password:</label><br>
        <input type="password" id="pass" name="pass" required placeholder="Password"><br><br>

        <button type="submit" class="btn btn-primary">Submit</button><br><br>

        <a href="PgRegister.jsp">Don't have an account? Register here.</a><br>
        <a href="homePage.jsp">Go back to home page.</a>
      </center>
    </form>
  </div>
</body>

</html>
