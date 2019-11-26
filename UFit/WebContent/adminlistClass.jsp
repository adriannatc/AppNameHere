<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Classes</title>
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Maven+Pro:400&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/app.css">
</head>

<style>
* {
  box-sizing: border-box;
}

#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

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
<body>

<%@ include file="admin_navbar_loggedin.jsp"%>

<img style="margin-top:70px; margin-left:450px" src="https://i.imgur.com/fyOULjB.png" height="144" width="297"></a>
<h1>All Classes In DB</h1>

				The time is now <b><%=new java.util.Date()%></b>.<br> <br>
				
				<a class="btn btn-primary" href="ClassController?action=insert">Add
					A New Class</a> <br /> <br /> The following <B><c:out
						value="${gclasses.size()}" /> classes</B> are in your database: <br>
				<br>
<table id="myTable" style="width:70%; margin-top:20px; margin-left:10px; border=0" align="center">
  <tr class="header">
    <th style="width:15%;">Category</th>
    <th style="width:15%;">Level</th>
    <th style="width:40%;">Location</th>
    <th style="width:20%;">Date</th>
    <th style="width:5%;">Modify A Class</th>
    <th style="width:5%;">Delete A Class</th>
  </tr>
  <c:forEach items="${gclasses}" var="gclass">
					
							<tr>
								<td align="center"><c:out value="${gclass.getCategory()}" /></td>
								
								<td align="center"><c:out value="${gclass.getLevel()}" /></td>
								<td align="center"><c:out value="${gclass.getLocation()}" /></td>
								<td align="center"><fmt:formatDate pattern="yyyy-MMM-dd"
										value="${gclass.getGdate()}" /></td>
								<td align="center"><a class="btn btn-warning"
									href="ClassController?action=edit&gclassId=<c:out value="${gclass.getClassid()}"/>">Modify</a></td>
								<td align="center"><a class="btn btn-danger"
									href="ClassController?action=delete&gclassId=<c:out value="${gclass.getClassid()}"/>">Delete</a></td>
							</tr>
						</c:forEach>
</table>


</body>
</html>