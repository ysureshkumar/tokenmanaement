<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Token Management System</title>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: maroon;
}

li {
	float: left;
}

li a, .dropbtn {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
	background-color: navy;
}

li.dropdown {
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: maroon;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: white;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: teal;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.box {
	width: 100%;
	margin: auto;
}

input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 75%;
	background-color: #501D1D;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

div {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>
 </head>
<body>
	<ul>
		<li><a href="#">Profile</a></li>
		<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Services</a>
			<div class="dropdown-content">
				<a href="./createcustomerpage">Create Customer</a>
				<a href="./createtokenpage">Create Token</a> 
				<a href="./displaycounters">Display Counters</a>
			</div></li>
		<li><a href="./login">Logout</a></li>
	</ul>

	
	<div class="box" id="divone">
		<h4>Create New Customer:</h4>
		<form action="./createnewcustomer" method="post">
			<table>
				<tr>
					<td><label> Customer Name</label></td>
					<td><input type="text" name="name"
						placeholder="Enter CustomerName"></td>
				</tr>
				<tr>
					<td><label> Phone Number</label></td>
					<td><input type="text" name="phno"
						placeholder="Enter Phone Number"></td>
				</tr>
				<tr>
					<td><label> Service Type</label></td>
					<td><select name="service">
							<option value="prime">Prime</option>
							<option value="nonprime">NonPrime</option>
					</select></td>
				</tr>
				<tr>
					<td><label> Address:</label></td>
					<td><textarea name="address"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="create customer" /></td>
					<td>
					<%-- <%! String responseBack1; %>
					<% responseBack1 = request.getParameter("response");%>
					 --%><c:if test="${responseBack1 != null}">
							<div id="status_message">${responseBack1}</div>
						</c:if></td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>