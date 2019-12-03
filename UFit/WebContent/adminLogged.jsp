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

	  <div class="centre1">
      <div class="content">
        <img src="https://myrealdomain.com/images/empty-profile-picture.png" alt="circle-cropped-5" border="0" width="100" height="100"></a>
        <h3><strong>Hello, <%=firstname%> <%=lastname%></strong></h3>
        <p><strong>Administrator-Only Features:</strong></p>
        <p>Add class, Delete class, Search class information</p>
      </div>
    </div>


<div class="container1">
  <div class="row">
    <div class="col-lg-3">
      <div class="content">
        <img src="https://www.publicdomainpictures.net/pictures/30000/velka/plain-white-background.jpg" height="10" width="50">
        </div>
    </div>
  </div>
 </div>

<div class="container1">
  <div class="row">
    <div class="col-lg-12">
      <div class="content">
<p>You will be logged out after <strong>15 minutes</strong> of inactivity.</p>
<p>The log-out button can be found on the top-right corner of the navigation bar.</p>
      </div>
    </div>
  </div>
 </div>


 

<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
 <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


</body>
</html>