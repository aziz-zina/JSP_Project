<?php
	define("USER_BD","root");
	define("PASS_BD","");
	define("NOME_BD","beauty_salon_management");
	$hostname_conn = "localhost";
	global $conn;
	// Conectamos ao nosso servidor MySQL
	if(!($conn = mysqli_connect($hostname_conn, USER_BD, PASS_BD, NOME_BD))) 
	{
	   echo "Error connecting to MySQL.";
	   exit;
	}
?>
