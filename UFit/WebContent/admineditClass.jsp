<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<head>
  <title>Add a Class</title>
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Maven+Pro:400&display=swap" rel="stylesheet">

  <link rel="stylesheet" type="text/css" href="css/app.css">
  
    <link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>


	<%@ include file="admin_navbar_loggedin.jsp"%>

	

	<div class="container">
 	<div class="row">
 		<div class="col">
 			<div class="content">
 				<h1 style = "text-align: center">Modify a Class</h1>
 				 <div style="width: 30%; margin: 25px auto;">

				<script>
					$(function() {
						$('input[name=gdate]').datepicker();
					});
				</script>
				Note: the Class ID is a fixed field and cannot be changed. <br>
				<br>

				<form method="POST" action='ClassController' name="frmAddUser">
					Class ID* (automated, cannot change): <input class = "form-control" type="text" readonly="readonly"
						name="classid" value="<c:out value="${gclass.classid}" />"><br>
					Category: <input class = "form-control" type="text" name="category"
						value="<c:out value="${gclass.category}" />"><br>
						Level: <input class = "form-control" type="text" name="level"
						value="<c:out value="${gclass.level}" />"><br> <br>
					Location : <input class = "form-control" type="text" name="location"
						value="<c:out value="${gclass.location}" />"><br>Date
					(MM/dd/yyyy): <input class = "form-control" type="text" name="gdate"
						value="<fmt:formatDate pattern="MM/dd/yyyy" value="${gclass.gdate}" />"><br>
					
					<input type="submit" class="btn btn-lg btn-primary btn-block" value="Submit Modified Class" />
				</form>

			</div>
			
		</div>
	</div>
	</div>
	</div>


</body>
</html>
