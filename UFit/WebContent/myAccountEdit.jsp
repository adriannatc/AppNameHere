<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Account</title>
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
			<form method="POST" action='AccountController' name="frmEditUser">	 
              <input type="text" readonly="readonly"
						name="memberid" value="<c:out value="<%=memberid %>" />"><br>

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

</body>
</html>