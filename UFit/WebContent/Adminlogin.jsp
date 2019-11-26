<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Maven+Pro:400&display=swap" rel="stylesheet">

  <link rel="stylesheet" type="text/css" href="css/app.css">
</head>
<body>

<%@ include file="navbar.jsp"%>

 <div class="container">
 	<div class="row">
 		<div class="col">
 			<div class="content">
 				<h2 style = "text-align: center">Admin Sign-in</h2>
 				 <div style="width: 30%; margin: 25px auto;">
            <form action = AdminLoginController> 
              <div class ="form-group">
                 <input class = "form-control" type = "text" name="un" placeholder="Username">
              </div>
              <div class ="form-group">
                  <input class = "form-control" type = "text" name="pw" placeholder="Password">
              </div>
              <div class = "form-group">
                <input type ="submit" class = "btn btn-lg btn-primary btn-block" value="Enter">
              </div>
            </form>
            <div style="margin-left:450px width: 200%; margin: 25px auto;">
              <p>Use the following credentials for demo:</p>
              <p><strong>Username: </strong> admin (or admin2, admin3, admin4, admin5)</p>
              <p><strong>Password: </strong> password</p>
 			</div>
 		</div>
 	</div>
 </div>
 </div>
 
 </div>

 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
 <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


</body>
</html>