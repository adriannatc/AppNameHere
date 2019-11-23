<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MIE350 Sample Database Web App</title>
<link rel="stylesheet" type="text/css" href="style/theme.css">

</head>
<body>
	<%@ include file="navbar.jsp"%>
	<center>
		<h1>About</h1>
	</center>
	<div class="container">

		This is a sample web app created for the <b>MIE350</b> course at the <a
			href="http://www.utoronto.ca">University of Toronto</a> for
		demonstration purposes. <br> <br> It was developed using the
		following:<br>
		<ul>
			<li>Eclipse Java EE IDE for Web Developers,</li>
			<li>The Java programming language,</li>
			<li>Java Server Pages (JSP),</li>
			<li>Apache Tomcat 7.0, and</li>
			<li>A simple Microsoft Access database.</li>
		</ul>
		<br> This is a toy example that does the following: <br>
		<ul>
			<li><b>Create</b> new users in the database.</li>
			<li><b>Read</b> in users from the database.</li>
			<li><b>Update</b> user information in the database.</li>
			<li><b>Delete</b> users in the database.</li>
			<li><b>Search</b> for users in the database.</li>
		</ul>
		<br> You are free to use this template file for your projects.<br>

	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>