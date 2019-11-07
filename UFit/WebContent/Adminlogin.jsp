<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>uFIT login</title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

	<link rel="stylesheet" type="text/css" href="css/app.css">
</head>
<body>

 <%@ include file="navbar.jsp"%>

 <div class="container">
 	<div class="row">
 		<div class="col-lg-12">
 			<div class="content">
 				<h1 style = "text-align: center">Sign-in</h1>
 				 <div style="width: 30%; margin: 25px auto;">
 			<form action="AdminLoginController">	 

              <div class ="form-group">
                 <input class = "form-control" type = "text" name="un" placeholder="Username">
              </div>
              <div class ="form-group">
                  <input class = "form-control" type = "password" name="pw" placeholder="Password">
              </div>
              <div class = "form-group">
                <input type ="submit" class = "btn btn-lg btn-primary btn-block" value="Enter">
              </div>
            </form>
            <br/>
			For demonstration purposes, please use the following
				credentials:
				<ul>
					<li><b>Username</b>: admin (or admin2, admin3, admin4, admin5)</li>
					<li><b>Password</b>: password</li>
				</ul>
				</div>
 			
 			</div>
 		</div>
 	</div>
 </div>

 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
 <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


</body>
</html>