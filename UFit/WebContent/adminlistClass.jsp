<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>All Classes in DB</title>
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

</head>
<body>

	<%@ include file="admin_navbar_loggedin.jsp"%>
	<%
		Member member = (Member) session.getAttribute("currentSessionUser");

		String username = (String) session.getAttribute("username");
		String firstname = (String) session.getAttribute("firstname");
		String lastname = (String) session.getAttribute("lastname");
	%>

	<div class="container-fluid text-center">
		<div class="row content">
		
			<div class="col-sm-8 text-left">
			<h2>All Classes</h2>
				<h1>All Classes In DB</h1>

				The time is now <b><%=new java.util.Date()%></b>.<br> <br>
				
				<a class="btn btn-primary" href="ClassController?action=insert">Add
					A New Class</a> <br /> <br /> The following <B><c:out
						value="${gclasses.size()}" /> classes</B> are in your database: <br>
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
						<c:forEach items="${gclasses}" var="gclass">
					
							<tr>
								<td align="center"><c:out value="${gclass.getClassid()}" /></td>
								<td align="center"><c:out value="${gclass.getCategory()}" /></td>
								<td align="center"><c:out value="${gclass.getLocation()}" /></td>
								<td align="center"><fmt:formatDate pattern="yyyy-MMM-dd"
										value="${gclass.getGdate()}" /></td>
								<td align="center"><c:out value="${gclass.getLevel()}" /></td>
								<td align="center"><a class="btn btn-warning"
									href="ClassController?action=edit&gclassId=<c:out value="${gclass.getClassid()}"/>">Update</a></td>
								<td align="center"><a class="btn btn-danger"
									href="ClassController?action=delete&gclassId=<c:out value="${gclass.getClassid()}"/>">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>



				<br /> <br />
			</div>
			<div class="col-sm-2 sidenav">
				<!-- You can put right sidebar links here if you want to. -->
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>


</body>
</html>