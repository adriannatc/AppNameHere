<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>uFIT<a href="classesDescription.jsp"></a></title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Maven+Pro:400&display=swap" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="css/app.css">
</head>
<body>

<!-- Check to see if the user is logged in. Otherwise, redirect back to the login page.-->
<%
	session = request.getSession();
	System.out.println(session);
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	}
%>

<%
		Member member = (Member) session.getAttribute("currentSessionUser");

		String username = (String) session.getAttribute("username");
		String firstname = (String) session.getAttribute("firstname");
		String lastname = (String) session.getAttribute("lastname");
	%>


	<%@ include file="admin_navbar_loggedin.jsp"%>

	
	<div class="container-fluid text-center">
		<div class="row content">
			<%@ include file="sidebar_loggedin.jsp"%>
			<div class="col-sm-8 text-left">

				<h1>
					Welcome,
					<%=firstname%>
					<%=lastname%>!
				</h1>


				Welcome to the members-only page.

				<h2>Admins-Only Features</h2>
				Admin can do the following:

				<ul>
					<li><b>Add</b> classes to database</li>
					<li><b>Delete</b> classes to database</li>
					<li><b>Modify</b> class information in database</li>
				</ul>


			</div>
		</div>
	</div>

	


</body>
</html>