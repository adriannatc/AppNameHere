<!DOCTYPE html>
<html>
<head>
  <title>uFIT</title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

	<link rel="stylesheet" type="text/css" href="app.css">
</head>
<body>

 <%@ include file="navbar.jsp"%>

 <div class="container">
 	<div class="row">
 		<div class="col-lg-12">
 			<div class="content">
 				<h1 style = "text-align: center">Sign-in</h1>
 				 <div style="width: 30%; margin: 25px auto;">
            <form> 
              <div class ="form-group">
                 <input class = "form-control" type = "text" name="Username" placeholder="Username">
              </div>
              <div class ="form-group">
                  <input class = "form-control" type = "password" password="Password" placeholder="Password">
              </div>
              <div class = "form-group">
                <button class = "btn btn-lg btn-primary btn-block">Enter</button>
              </div>
            </form>
            
            
 			</div>
 		</div>
 	</div>
 </div>

 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
 <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


</body>
</html>