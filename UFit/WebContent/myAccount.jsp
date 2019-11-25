<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<title>My Account</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Date Picker Javascript -->
<!-- https://jqueryui.com/datepicker/ -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="css/mystyle.css">
</head>
	<%
		Member member = (Member) session.getAttribute("currentSessionUser");

		String username = (String) session.getAttribute("username");
		String firstname = (String) session.getAttribute("firstname");
		String lastname = (String) session.getAttribute("lastname");
		String email = (String) session.getAttribute("email");
		String password = (String) session.getAttribute("password");
	%>

<body>

	<%@ include file="navbar_loggedin.jsp"%>

<div class="card" margin-top="70px" margin-left="1000">
  <img src="john.PNG" alt="John" style="width:10%" >
	<h4> .</h4> 
  <h1>                        Welcome <%=firstname%>, here are your chosen classes!</h1>
  
  Account info:<br>
  First Name: <%=firstname %><br>
  Last Name: <%=lastname %><br>
  Username: <%= username %><br>
  Password: <%=password %>
  Email: <%= email %><br>
  
 
  
  <td align="center"><a class="btn btn-info" href="myAccountEdit.jsp"/>Edit Account</a></td>
 </div>

Here are your classes!
	<br>
				<table border=1 class="sortable">
					<thead>
						<tr>
							<th>Class Id</th>
							<th>Category</th>
							<th>Location</th>
							<th>Date</th>
							<th>Level</th>
							<th colspan=2>Action</th>
						</tr>
						
					</thead>
					<tbody>
					
						<c:forEach items="${myclasses}" var="gclass">
					
							<tr>
								<td align="center"><c:out value="${gclass.getClassid()}" /></td>
								<td align="center"><c:out value="${gclass.getCategory()}" /></td>
								<td align="center"><c:out value="${gclass.getLocation()}" /></td>
								<td align="center"><fmt:formatDate pattern="yyyy-MMM-dd"
										value="${gclass.getGdate()}" /></td>
								<td align="center"><c:out value="${gclass.getLevel()}" /></td>
								<td align="center"><a class="btn btn-warning"
									href="ClassController?action=memberDelete&gclassId=<c:out value="${gclass.getClassid()}"/>">Delete</a></td>
							
								</tr>
						</c:forEach>
					</tbody>
				</table>



				<br />

 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
 <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>