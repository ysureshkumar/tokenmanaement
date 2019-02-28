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

label {
	width: 100%%;
	background-color: #501D1D;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

table{

	width: 100%;
}
table tr{

	width: 100%;
}
table tr td{

	width: 100%;
	background-color: #D8AC64;
	color: blue;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	}

input[type=submit]:hover, [type=reset]:hvoer, [type=button]:hover {
	background-color: #45a049;
}

div {
	border-radius: 5px;
	background-color: white;
	padding: 20px;
}

.counterONEDetails {
	position: absolute;
	top: 80px;
	right: 1000px;
	width: 300px;
	height: 200px; 
	border: 5px solid #501D1D; 
	background-color: #f2f2f2;
	color: black;
	text-align: left;
}

.counterTWODetails {
	position: absolute;
	top: 80px;
	right: 500px;
	width: 300px;
	height: 200px; 
	border: 5px solid #501D1D;
	background-color: #f2f2f2;
	color: black;
	text-align: left;
}

.counterTHREEDetails {
	position: absolute;
	top: 350px;
	right: 1000px;
	width: 300px;
	height: 200px; 
	border: 5px solid #501D1D; 
	background-color: #f2f2f2;
	color: black;
	text-align: left;
}

.counterPRIMEDetails {
	position: absolute;
	top: 350px;
	right: 500px;
	width: 300px;
	height: 200px; 
	border: 5px solid #501D1D;
	background-color: #E5FDE7;
	color: black;
	text-align: left;
}


</style>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type='text/javascript'>
	$(document).ready(function() {
		//option A
		$("form").submit(function(e) {
			alert('submit intercepted');
			e.preventDefault(e);
		});
	});
	
	function getCustomerDetails() {
		var fm = document.getElementById("myForm");
		fm.action = "./customerdetails";
		fm.submit();
		/*fm.id.value="";
		fm.id.placeHolder="Enter Customer Id"; 
		 */}
	function getNextToken() {
		var fm = document.getElementById("myForm1");
		fm.action = "./nexttoken";
		fm.submit();

	}

	function getServices() {
		var fm = document.getElementById("myForm2");
		fm.action = "./services";
		fm.submit();
	}
</script>
</head>
<body>
	<ul>
		<li><a href="#">Profile</a></li>
		<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Services</a>
			<div class="dropdown-content">
				<a href="./createcustomerpage">Create Customer</a> <a
					href="./createtokenpage">Create Token</a> <a
					href="./displaycounters">Display Counters</a>
			</div></li>
		<li><a href="./login">Logout</a></li>
	</ul>
	<div class="counterONEDetails">
		<label>Counter: ONE</label>
		<form name="myForm2" id="myForm2" method="post">
			<table>
				<tr>
					<td align="right">Services:</td>
					<td>${services1}</td>
				</tr>
				<tr>
					<td align="right">Queue:</td><td>${countOfTokens1}</td>
				</tr>
				<tr>
					<td align="right">Current Token:</td>
					<td>${currentToken1}</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="counterTWODetails">
		<label>Counter: TWO</label>
		<form name="myForm2" id="myForm2" method="post">
			<table>
				<tr>
					<td align="right">Services:</td>
					<td>${services2}</td>
				</tr>
				<tr>
					<td align="right">Queue:</td><td>${countOfTokens2}</td>
				</tr>
				<tr>
					<td align="right">Current Token:</td>
					<td>${currentToken2}</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="counterTHREEDetails">
		<label>Counter: THREE</label>
		<form name="myForm2" id="myForm2" method="post">
			<table>
				<tr>
					<td align="right">Services:</td>
					<td>${services3}</td>
				</tr>
				<tr>
					<td align="right">Queue:</td><td>${countOfTokens3}</td>
				</tr>
				<tr>
					<td align="right">Current Token:</td>
					<td>${currentToken3}</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="counterPRIMEDetails">
		<label>Counter: PRIME</label>
		<form name="myForm2" id="myForm2" method="post">
			<table>
				<tr>
					<td align="right">Services:</td>
					<td>${services4}</td>
				</tr>
				<tr>
					<td align="right">Queue:</td><td>${countOfTokens4}</td>
				</tr>
				<tr>
					<td align="right">Current Token:</td>
					<td>${currentToken4}</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>