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
	<%
		session.invalidate();
		response.setHeader("Refresh", "2; url=PgLogin.jsp?state=4");
	%>
</body>
</html>