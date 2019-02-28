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
			</div>
		</li>
		<li><a href="./login">Logout</a></li>
	</ul>

</body>
</html>