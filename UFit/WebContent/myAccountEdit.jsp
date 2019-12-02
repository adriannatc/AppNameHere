<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Edit My Account</title>

  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Maven+Pro:400&display=swap" rel="stylesheet">

  <link rel="stylesheet" type="text/css" href="css/app.css">
</head>







<%
		Member member = (Member) session.getAttribute("currentSessionUser");
		int memberid = (Integer) session.getAttribute("memberid");
		String firstName = (String) session.getAttribute("firstname");
		String lastName = (String) session.getAttribute("lastname");
		String email = (String) session.getAttribute("email");
		String password = (String) session.getAttribute("password");
%>
<body>
	<%@ include file="navbar_loggedin.jsp"%>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-8 text-left">
			<form method="POST" action='AccountController' name="frmEditUser">	
			<h2>Edit Account Info</h2>
			<div class ="form-group">
			  MemberID (Automated, cannot change): <input type="text" readonly="readonly"
						name="memberid" value="<c:out value="<%=memberid %>" />"><br> 
						 </div>
			 <div class ="form-group">
                FirstName: <input type = "text" name="firstName" value="<c:out value="<%=firstName %>"/>" >
              </div>
              <div class ="form-group">
                Last Name: <input type = "text" name="lastName" value="<c:out value="<%=lastName %>" />">
              </div>
              <div class ="form-group">
                Email: <input type = "text" name="email" value="<c:out value="<%=email %>" />">
              </div>
              <div class ="form-group">
                Password  <input type = "text" name="password" value="<c:out value="<%=password%>" />">
              </div>
              <div class = "form-group">
              	<input type="submit" class="btn btn-lg btn-primary btn-block" value="Submit Changes" />
              </div>
            </form>	
            </div>
		</div>
	</div>
</body>
</html>