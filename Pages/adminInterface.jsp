<%
    session.setMaxInactiveInterval(60 * 60); // Set session timeout to 1 hour (optional)
    String login = (String) session.getAttribute("login");
    String function = (String) session.getAttribute("function");

    if (login != null && function != null) {
        if (!function.equals("1")) {
            response.setHeader("Refresh", "0;homePage.jsp?state=3");
            
            //response.sendRedirect("homePage.jsp?state=3");
        }
    } else {
        response.sendRedirect("PgLogin.jsp?state=2");
    }

    String state = request.getParameter("state");
    if (state != null) {
        switch (state) {
            case "1":
                out.println("<script>alert('Personal data edited');</script>");
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
  <title>Admin Interface</title>
  <style>
    #frminterface {
      border: solid gray 1px;
      width: 60%;
      border-radius: 80px;
      margin: 80px auto;
      background: #c3a48f;
      padding: 90px;
    }

    #box {
      position: relative;
      top: -30px;
    }

    .button-container {
      display: flex;
      /* set display to flex */
      justify-content: center;
      /* horizontally center items */
      align-items: center;
      /* vertically center items */
    }

    .button {
      background-color: #E5C49D;
      /* set background color */
      border: 1px solid #000000;
      /* set border */
      color: #010101;
      font-weight: bold;

      padding: 40px 100px;
      /* set padding */
      margin: 50px;
      /* add margin between buttons */
      cursor: pointer;
    }

    .button2 {
      background-color: #E5C49D;
      /* set background color */
      border: 1px solid #000000;
      /* set border */
      color: #010101;
      font-weight: bold;

      padding: 40px 80px;
      /* set padding */
      margin-left: 270px;
      /* add margin between buttons */
      cursor: pointer;
    }

    img {
      width: 60px;
      height: 60px;
    }
  </style>
</head>

<body>
  <div id="frminterface">
    <form name="f1">
      <div class="button-container" id="box">
        <a href="AdminReservationsManagement.jsp"><button type="button" class="button">MANAGEMENT OF RESERVATION</button></a>
        <a href="Pgpersonal_info.jsp"><button class="button" type="button"> MANAGEMENT PERSONAL ACCOUNT</button></a>
      </div>
      <a href="userManagement.jsp"><button class="button2" type="button"> USER MANAGEMENT</button></a>
      <br>
      <a href="./homePage.jsp"><img src="./home.png" alt="home.png"></a>
    </form>
  </div>
</body>

</html>