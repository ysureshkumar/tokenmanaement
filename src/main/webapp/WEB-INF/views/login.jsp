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

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover {
	background-color: navy;
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

input[type=password], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 25%;
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
table tr td{
width:auto;
}
</style>
</head>
<body>
	<ul>
		<li><a href="./home">Home</a></li>
		<li><a href="./login">Login</a></li>
		<li><a href="./aboutus">Aboutus</a></li>
	</ul>
	<h3>Login into TokenManagement</h3>
	<div style="padding-left: 25%">
		<form action="./loginvalidate" method="post">
			<table> 
				<tr>
					<td align="right"><label> Username</label></td>
					<td><input type="text" name="username"
						placeholder="Enter UserName"></td>
				</tr>
				<tr>
					<td align="right"><label for="password"> Password</label></td>
					<td><input type="password" name="password"
						placeholder="Enter password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="Login" /></td>
					<td style="color:red" align="center">${response}</td>
				</tr>
				
			</table>
		</form>

	</div>
</body>
</html>