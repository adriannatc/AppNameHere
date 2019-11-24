<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <title>uFIT</title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

	<link rel="stylesheet" type="text/css" href="css/app.css">
</head>
<body >

<%@ include file="navbar.jsp"%>




 <div class="container">
 	<div class="row">
 		<div class="col-lg-12">
 			<div class="content">
 				<h1 style = "text-align: center">Sign-up</h1>
 				 <div style="width: 30%; margin: 25px auto;">
            <form method="POST" action='LoginController' name="frmAddNewMember">
              <input type="text" readonly="readonly"
						name="memberid" value="${member.id}">
			 <div class ="form-group">
                 <input class = "form-control" type = "text" name="firstName" placeholder="First Name" value="<c:out value="${member.firstName}" />">
              </div>
              <div class ="form-group">
                 <input class = "form-control" type = "text" name="lastName" placeholder="Last Name" value="<c:out value="${member.lastName}" />">
              </div>
              <div class ="form-group">
                 <input class = "form-control" type = "text" name="email" placeholder="Email" value="<c:out value="${member.email}" />">
              </div>
               <div class ="form-group">
                 <input class = "form-control" type = "text" name="username" placeholder="Username" value="<c:out value="${member.username}" />">
              </div>
              <div class ="form-group">
                  <input class = "form-control" type = "text" name="password" placeholder="Password" value="<c:out value="${member.password}" />">
              </div>
              <div class = "form-group">
              	<input type="submit" class="btn btn-lg btn-primary btn-block" value="Enter" />
              </div>
            </form>
 			</div>
 		</div>
 	</div>
 </div></div>

 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
 <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


</body>
</html>