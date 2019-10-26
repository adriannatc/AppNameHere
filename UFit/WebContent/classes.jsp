<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*"%>
    
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>uFIT</title>
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

 <!--  <link rel="stylesheet" type="text/css" href="css/app.css"> -->
  <!-- Check to see if the user is logged in. Otherwise, redirect back to the login page.-->
<%
	session = request.getSession();
	System.out.println(session);
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	}
%>
</head>

<style>
* {
  box-sizing: border-box;
}

#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
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
</head>

<body>

  <%@ include file="navbar_loggedin.jsp"%>
  <%
		User user = (User) session.getAttribute("currentSessionUser");

		String username = (String) session.getAttribute("username");
		String firstname = (String) session.getAttribute("firstname");
		String lastname = (String) session.getAttribute("lastname");
	%>

<input style="width:20%; margin-top:70px; margin-left:247px; border=0" align="center" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search class" title="Search">

 <table id="myTable" style="width:60%; margin-top:20px; margin-left:10px; border=0" align="center">
  <tr class="header">
    <th style="width:20%;">Class</th>
    <th style="width:20%;">Level</th>
    <th style="width:40%;">Location</th>
    <th style="width:60%;">Date/Time</th>
  </tr>
  <tr>
    <td>Weightlifting</td>
    <td>Beginner</td>
    <td>Harthouse Upper Gym</td>
    <td>October 29th, 2:00PM</td>
  </tr>
  <tr>
    <td>Tennis</td>
    <td>Advanced</td>
    <td>Athletic Centre Upper Gym</td>
    <td>October 30th, 2:00PM</td>
  </tr>
  <tr>
    <td>Yoga</td>
    <td>Intermediate</td>
    <td>Goldring Lower Gym</td>
    <td>October 30th, 2:00PM</td>
  </tr>
</table>

<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

<script>
$(document).ready(function() {
    var table = $('#example').myTable();
 
    $('#example tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected');
    } );
 
    $('#button').click( function () {
        alert( table.rows('.selected').data().length +' row(s) selected' );
    } );
} );
</script>

</body>
</html>