<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<title>MIE350 Sample Web App - Search Results</title>
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
<body>

	<%@ include file="navbar_loggedin.jsp"%>



	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<!-- You can put left sidebar links here if you want to. -->
			</div>
			<div class="col-sm-8 text-left">
				<h2> Classes</h2>
				<h1>Search A Class - Results</h1>

				The following classes match your search keyword "<b><font
					color=red><%=request.getAttribute("keyword")%></font></b>":<br> <br>
				<center>
					<table border=1 class="sortable">
						<thead>
							<tr>
								<th>Class Id</th>
								<th>Category</th>
								<th>Level</th>
								<th>Location</th>
								<th>Date</th>
								<!-- Time -->
								<th colspan=2>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${gclasses}" var="gclass">
								<tr>
									<td align="center"><c:out
											value="${gclass.getClassid()}" /></td>
									<td align="center"><c:out
											value="${gclass.getCategory()}" /></td>
									<td align="center"><c:out value="${gclass.getLevel()}" /></td>
									<td align="center"><c:out value="${gclass.getLocation()}" /></td>
									<td align="center"><fmt:formatDate pattern="yyyy-MMM-dd"
											value="${gclass.getGdate()}" /></td>
									<td align="center"><a class="btn btn-primary"
									href="ClassController?action=memberAdd&gclassId=<c:out value="${gclass.getClassid()}"/>">Add (doesn't work yet)</a></td>
								
									</tr>
							</c:forEach>
						</tbody>
					</table>
				</center>

			</div>
			<div class="col-sm-2 sidenav">
				<!-- You can put right sidebar links here if you want to. -->
			</div>
		</div>
	</div>


</body>
</html>


