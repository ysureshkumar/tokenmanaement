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

input[type=text] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

label {
	width: 100px;
	height: 50px;
	background-color: #501D1D;
	color: white;
	padding: 10px 20px;
	margin-bottom: -50px;
	border: none;
	border-radius: 40%;
	cursor: pointer;
	text-align: center;
}

table {
	width: 100%;
}

table tr {
	width: 100%;
}

table tr td {
	width: auto;
	background-color: #D8AC64;
	color: blue;
	padding: 14px 20px; //
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit], input[type=reset] {
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

input[type=submit]:hover, [type=reset]:hvoer, [type=button]:hover {
	background-color: #45a049;
}

/* div {
	border-radius: 5px;
	background-color: white;
	padding: 20px;
}

.counterDetails {
	position: absolute;
	width: 1000px;
	height: 500px; //
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
 */
#divAnim {
	font: 15px Verdana;
	background-color: #FFF;
	position: relative;
	width: 80px;
	height: 27px;
	padding: 5px;
	border: solid 1px #CCF;
	border-radius: 2px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
}

#divAnim label {
	width: 100%;
	color: #009872;
	font-size: 14px;
	padding: 10px;
}

#divAnim input {
	padding: 3px 2px;
	border: solid 1px #3079ED;
	border-radius: 2px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	background: #6D9BF1;
	color: #FFF;
	cursor: pointer;
}

#divAnim div {
	display: none;
	padding: 20px 10px;
}

#divAnim li {
	margin: 0 2px 0 0;
	display: inline;
	font-size: 0.7em;
	font-style: normal;
	padding: 2px 0 2px 2px;
	vertical-align: middle;
}
</style>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type='text/javascript'>
	function validateManageToken(myform) {
		var tokenId = myform.tokenId.value;
		if (tokenId == "") {
			alert("Sorry No Tokens Available to Serve");
			return false;
		} else {
			return true;
		}
	}
	$(document).ready(function() {
		$('#C1Animate').click(function() {
			$('#divA').toggle('slow'); 
			$('#divB').hide(); 
			$('#divC').hide(); 
			$('#divD').hide(); 
		});

		$('#C2Animate').click(function() {
			$('#divB').toggle('slow'); 
			$('#divA').hide(); 
			$('#divC').hide(); 
			$('#divD').hide(); 
		
		});

		$('#C3Animate').click(function() {
			$('#divC').toggle('slow');
			$('#divB').hide(); 
			$('#divA').hide(); 
			$('#divD').hide(); 
		
		});

		$('#C4Animate').click(function() {
			$('#divD').toggle('slow'); 
			$('#divB').hide(); 
			$('#divC').hide(); 
			$('#divA').hide(); 
		
		});

	});
</script>

</head>
<body>
	<ul>
		<li><a href="#">Profile</a></li>
		<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Services</a>
			<div class="dropdown-content">
				<a href="./showcounters">Show Counters</a> <a
					href="./managecounters">Manage Counters</a>
			</div></li>
		<li><a href="./login">Logout</a></li>
	</ul>

	<div style="padding: 5%">
		<label id="C1Animate">Counter - ONE </label>
		<div class="counterDetails" id="divA" style="display: none">
			<form name="myForm1" id="myForm1" action="./managetoken"
				method="post" onsubmit="return validateManageToken(this)">
				<table>
					<tr>
						<td align="right">Services:</td>
						<td>${services1}</td>
					</tr>
					<tr>
						<td align="right">Queue:</td>
						<td>${queueOfTokens1}</td>
					</tr>
					<tr>
						<td align="right">Current Token:</td>
						<td>${currentToken1}</td>
						<input type="hidden" name="tokenId" value="${currentToken1}" />
					</tr>
					<tr>
						<td align="right">Action:</td>
						<td><input type="radio" name="action" value="complete"
							checked="checked" />Completed <br /> <input type="radio"
							name="action" value="cancel" />Cancelled</td>
					</tr>
					<tr>
						<td align="right"><input type="submit" value="Update Token" /></td>
						<td><input type="reset" value="Refresh" /></td>
					</tr>
					<tr>
						<c:if test="${response != null}">
							${response}
						</c:if>
				</table>
			</form>
		</div>
		<br /> <br /> <br /> <label id="C2Animate">Counter - TWO </label>
		<div class="counterDetails" id="divB" style="display: none">
			<form name="myForm2" id="myForm2" method="post">
				<table>
					<tr>
						<td align="right">Services:</td>
						<td>${services2}</td>
					</tr>
					<tr>
						<td align="right">Queue:</td>
						<td>${queueOfTokens2}</td>
					</tr>
					<tr>
						<td align="right">Current Token:</td>
						<td>${currentToken2}</td>
					</tr>
					<td align="right">Action:</td>
					<td><input type="radio" name="action" value="complete"
						checked="checked" />Completed <br /> <input type="radio"
						name="action" value="cancel" />Cancelled</td>
					</tr>
					<tr>
						<td align="right"><input type="submit" value="Update Token" /></td>
						<td><input type="reset" value="Refresh" /></td>
					</tr>
					<tr>
						<c:if test="${response != null}">
							${response}
						</c:if>
				</table>
			</form>
		</div>
		<br /> <br /> <br /> <label id="C3Animate">Counter - THREE </label>
		<div class="counterDetails" id="divC" style="display: none">
			<form name="myForm3" id="myForm3" method="post">
				<table>
					<tr>
						<td align="right">Services:</td>
						<td>${services3}</td>
					</tr>
					<tr>
						<td align="right">Queue:</td>
						<td>${queueOfTokens3}</td>
					</tr>
					<tr>
						<td align="right">Current Token:</td>
						<td>${currentToken3}</td>
					</tr>
					<td align="right">Action:</td>
					<td><input type="radio" name="action" value="complete"
						checked="checked" />Completed <br /> <input type="radio"
						name="action" value="cancel" />Cancelled</td>
					</tr>
					<tr>
						<td align="right"><input type="submit" value="Update Token" /></td>
						<td><input type="reset" value="Refresh" /></td>
					</tr>
					<tr>
						<c:if test="${response != null}">
							${response}
						</c:if>
				</table>
			</form>
		</div>
		<br /> <br /> <br /> <label id="C4Animate">Counter - PRIME
		</label>
		<div class="counterDetails" id="divD" style="display: none">
			<form name="myForm4" id="myForm4" method="post">
				<table>
					<tr>
						<td align="right">Services:</td>
						<td>${services4}</td>
					</tr>
					<tr>
						<td align="right">Queue:</td>
						<td>${queueOfTokens4}</td>
					</tr>
					<tr>
						<td align="right">Current Token:</td>
						<td>${currentToken4}</td>
					</tr>
					<td align="right">Action:</td>
					<td><input type="radio" name="action" value="complete"
						checked="checked" />Completed <br /> <input type="radio"
						name="action" value="cancel" />Cancelled</td>
					</tr>
					<tr>
						<td align="right"><input type="submit" value="Update Token" /></td>
						<td><input type="reset" value="Refresh" /></td>
					</tr>
					<tr>
						<c:if test="${response != null}">
							${response}
						</c:if>
				</table>
			</form>
		</div>
	</div>
</body>
</html>