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
</style>
</head>
<body>
	<ul class=”menu">
		<li><a href="home.jsp">Home</a></li>
		<li><a href="login.jsp">Login</a></li>
		<li><a href="aboutus.jsp">Aboutus</a></li>
	</ul>


<h3 >Login into TokenManagement</h3>
	<div  style="padding-left: 25%">
		<form action="./users/login" method="post">
			<div>
				<label for="usrname"> Username</label> 
				<input type="text" id="username" placeholder="Enter UserName">
			</div>
			<div>
				<label for="password"> Password</label> 
				<input type="text" id="password" placeholder="Enter password">
			</div>
			<button type="submit">Login</button>
	    </form>
	</div>

</body>
</html>