<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	session = request.getSession();
	System.out.println(session);
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	}
%>

<head>

  <title>uFIT<a href="index.html"></a></title>
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


#myTable {
  border-collapse: collapse;
  width: 10%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
</style>
</head>


<body>

<%@ include file="navbar_loggedin.jsp"%>

<%
		Member member = (Member) session.getAttribute("currentSessionUser");

		String username = (String) session.getAttribute("username");
		String firstname = (String) session.getAttribute("firstname");
		String lastname = (String) session.getAttribute("lastname");
	%>

<div class="card" margin-top="70px" margin-left="1000">
  <img src="john.PNG" alt="John" style="width:10%" >
	<h4> .</h4> 
  <h1>                        Welcome <%=firstname%>, here are your chosen classes!</h1>
  <p class="title"><%=firstname %> <%=lastname %></p>
  <p>3rd-year Industrial Engineering</p>
  <p><button>Edit Info</button></p>
</div>

<input style="width:20%; margin-top:70px; margin-left:247px; border=0" align="center" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search class" title="Search">

 <table id="myTable" style="width:60%; margin-top:20px; margin-left:10px; border=0" align="center">
  <tr class="header">
    <th style="width:20%;">Class</th>
    <th style="width:20%;">Level</th>
    <th style="width:40%;">Location</th>
    <th style="width:60%;">Date/Time</th>
  </tr>
  <tr>
    <td>Weightlifting</td>
    <td>Beginner</td>
    <td>Harthouse Upper Gym</td>
    <td>October 29th, 2:00PM</td>
  </tr>
  <tr>
    <td>Tennis</td>
    <td>Advanced</td>
    <td>Athletic Centre Upper Gym</td>
    <td>October 30th, 2:00PM</td>
  </tr>
  <tr>
    <td>Yoga</td>
    <td>Intermediate</td>
    <td>Goldring Lower Gym</td>
    <td>October 30th, 2:00PM</td>
  </tr>
</table>




 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
 <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>