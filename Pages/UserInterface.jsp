<%
session = request.getSession();

if (session.getAttribute("login") != null && session.getAttribute("function") != null) {
  if (session.getAttribute("function").equals(4) ) {
    response.sendRedirect("homePage.jsp?state=3");
  }
} else {
  response.sendRedirect("PgLogin.jsp?state=2");
}

if (request.getParameter("state") != null) {
  switch (request.getParameter("state")) {
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
  <title>User interface</title>
  <style>
    #frminterface {

      border: solid gray 1px;
      width: 60%;
      border-radius: 80px;
      margin: 80px auto;
      background: #c3a48f;
      padding: 90px;

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
      /* set text color */
      font-weight: bold;

      padding: 40px 60px;
      /* set padding */
      margin: 50px;
      /* add margin between buttons */

      cursor: pointer;
    }

    img {
      width: 60px;
      height: 60px;
      display: flex;
    }
  </style>
</head>

<body>
  <div id="frminterface">
    <form name="f1">
      <div class="button-container">
        <a href="personalReservationManagement.php"><button class="button" type="button">MANAGEMENT OF PERSONAL
            RESERVATION</button></a>
        <button class="button" type="submit" formaction="Pgpersonal_info.php"> MANAGEMENT PERSONAL ACCOUNT</button>
      </div>
      <a href="./homePage.php"><img src="./home.png" alt="home.png"></a>

    </form>
  </div>


</body>

</html>