<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<!-- Check to see if the user is logged in. Otherwise, redirect back to the login page.-->
<%
	session = request.getSession();
	System.out.println(session);
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	}
%>

<head>
<title>UFit Home Page</title>

<link rel="stylesheet" type="text/css" href="css/app.css">
</head>
<body>

	<%@ include file="navbar_loggedin.jsp"%>

	<%
		User user = (User) session.getAttribute("currentSessionUser");

		String username = (String) session.getAttribute("username");
		String firstname = (String) session.getAttribute("firstname");
		String lastname = (String) session.getAttribute("lastname");
	%>

	<div class="container-fluid text-center">
		<div class="row content">
			<%@ include file="sidebar_loggedin.jsp"%>
			<div class="col-sm-8 text-left">

				<h1>
					Welcome,
					<%=firstname%>
					<%=lastname%>!
				</h1>


				Welcome to the users-only page.

				<h2>Users-Only Features</h2>
				Users can do the following:

				<ul>
					<li><b>Add</b> classes to your schedule</li>
					<li><b>Delete</b> classes to your schedule</li>
				</ul>


			</div>
			<div class="col-sm-2 sidenav">
				<!-- You can put right sidebar links here if you want to. -->
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>


</body>
</html>