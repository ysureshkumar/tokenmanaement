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
<!-- <script>
	function displayDivision() {
		var option = document.getElementById("choose");
		if (option.value == "one") {
			var div1 = document.getElementById("divone");
			div1.style.display = "block";
			var div2 = document.getElementById("divtwo");
			div2.style.display = "none";
		}
		if (option.value == "two") {
			var div1 = document.getElementById("divone");
			div1.style.display = "none";
			var div2 = document.getElementById("divtwo");
			div2.style.display = "block";
		}
	}
</script>
 -->
 </head>
<body>
	<ul>
		<li><a href="#">Profile</a></li>
		<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Services</a>
			<div class="dropdown-content">
				<a href="./createcustomerPage">Create Customer</a>
				<a href="./createtokenPage">Create Token</a> 
				<a href="./displaycounters">Display Counters</a>
			</div></li>
		<li><a href="./login">Logout</a></li>
	</ul>

	<select id="choose" onchange="displayDivision()">
		<option value="one">New Customer</option>
		<option value="two">Create Token</option>
	</select>

	<div class="box" id="divone" style="display: block">
		<h4>Create New Customer:</h4>
		<form action="./createnewcustomer" method="get">
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
					<%! String responseBack1; %>
					<% responseBack1 = request.getParameter("response");%>
					<c:if test="${responseBack1 != null}">
							<div id="status_message">${responseBack1}</div>
						</c:if></td>
				</tr>
			</table>
		</form>

	</div>
	
	<script>
	function getCustomerDetails(){
		var fm = document.getElementById("myForm");
		fm.action="./customerdetails";
		fm.submit();
	}
	</script>
	<div class="box" id="divtwo" style="display: none">
		<h4>Create Token:</h4>
		<form id="myForm" action="./createnewtoken" method="post">
			<table>
				<tr>
					<td><label> Customer Id</label></td>
					<td><input type="text" name="id"
						placeholder="Enter CustomerId" onkeyup="getCustomerDetails()"></td>
				</tr>
				<tr>
					<td><label> Token Id</label></td>
					<td><input type="text" name="tokenId" disabled="disabled"></td>
				</tr>
				<tr>
					<td><label> Service Type</label></td>
					<%! String service; %>
					<% service = request.getParameter("service");%>
					<td><input type="text" name="service" value="<%=service%>" disabled="disabled"></td>
				</tr>
				<tr>
					<td><label> Counters</label></td>
					<td><select name="counter">
							<option value="c1">Counter1</option>
							<option value="c2">Counter2</option>
							<option value="c3">Counter3</option>
					</select></td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td><input type="submit" value="create" /></td>
					<td><input type="submit" value="next" /></td>
					<td>
					<%! String responseBack2; %>
					<% responseBack2 = request.getParameter("response");%>
					<c:if test="${responseBack2 != null}">
							<div id="status_message">${responseBack2}</div>
						</c:if></td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>