<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
  <title>My Account</title>
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Maven+Pro:400&display=swap" rel="stylesheet">

  <link rel="stylesheet" type="text/css" href="css/app.css">
</head>

<style>
* {
  box-sizing: border-box;
}

#myTable {
  border-collapse: collapse;
  width: 10%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
</style>
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
<div class="centre1">	
      <div class="content">	
        <a><img src="https://myrealdomain.com/images/empty-profile-picture.png" alt="circle-cropped-5" border="0" width="100" height="100"></a>	
        <h3><strong>Hello, <%=firstname%> </strong></h3>
  Account info:<br>
  First Name: <%=firstname %><br>
  Last Name: <%=lastname %><br>
  Username: <%= username %><br>
  Password: <%=password %><br>
  Email: <%= email %><br>
  
 
  <br>
  <td align="center"><a class="button" href="myAccountEdit.jsp"/>Edit Account</a></td>
 </div>

<div class="container1">
  <div class="row">
    <div class="col-lg-12">
      <div class="content">
        <h4 style="margin-left:-630px"> <strong>Members-Only Features</strong></h4>
        <p style="margin-left:-525px"> Add class, Delete class, Search class information</p>
        <h3 style="width:60% margin-top:20px margin-left:-120px"><strong>Upcoming Classes</strong></h3>
        <table id="myTable" style="width:70% margin-top:20px margin-left:10px border=0" align="center">
  <tr class="header">
    <th style="width:15%;">Category</th>
    <th style="width:15%;">Level</th>
    <th style="width:40%;">Location</th>
    <th style="width:20%;">Date</th>
    <th style="width:5%;">Action</th>
  </tr>
  <c:forEach items="${myclasses}" var="gclass">
  <tr>
								<td align="center"><c:out value="${gclass.getCategory()}" /></td>
								<td align="center"><c:out value="${gclass.getLevel()}" /></td>
								<td align="center"><c:out value="${gclass.getLocation()}" /></td>
								<td align="center"><fmt:formatDate pattern="yyyy-MMM-dd"
										value="${gclass.getGdate()}" /></td>
								<td align="center"><a class="button1"
									href="ClassController?action=memberDelete&gclassId=<c:out value="${gclass.getClassid()}"/>">Delete</a></td>
							
	</tr>
	</c:forEach>
  
  
</table>
<img src="https://www.publicdomainpictures.net/pictures/30000/velka/plain-white-background.jpg" height="50" width="50">
<p>You will be logged out after <strong>15 minutes</strong> of inactivity.</p>
<p>The log-out button can be found on the top-right corner of the navigation bar.</p>
      </div>
    </div>
  </div>
 </div>


 

<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
 <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>