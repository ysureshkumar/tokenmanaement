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

input[type=submit], [type=reset], [type=button] {
	width: 100%%;
	background-color: #501D1D;
	color: white;
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
	background-color: #f2f2f2;
	padding: 20px;
}

.tokenbox {
	position: absolute;
	top: 80px;
	right: 10px;
	width: 200px;
	height: 100px;
	border: 5px solid #501D1D;
	background-color: cyan;
	color: white;
	text-align: left;
}

.tokenbox label {
	color: #501D1D;
	font-size: 25px;
	font-weight: bold;
	padding-left: 15%;
}

.tokenbox span {
	color: #9B9B73;
	font-size: 25px;
}

.counterDetails {
	position: absolute;
	top: 500px;
	right: 100px;
	width: 300px;
	height: 200px; //
	border: 5px solid #501D1D; //
	background-color: cyan;
	color: black;
	text-align: left;
}
</style>

<!-- <script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
 -->
<script type='text/javascript'>
	
	//var datapopulated = false;
	function getCustomerDetails() {
		var fm = document.getElementById("myForm");
		fm.action = "./customerdetails";
		//datapopulated = true; 
		fm.submit();
		}
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
	
	function combineServices() {
		var checkboxS1 = document.getElementById("s1");
		var checkboxS2 = document.getElementById("s2");
		var checkboxS3 = document.getElementById("s3");
		var services = document.getElementById("services");
		
		services.value="";
		if( checkboxS1.checked == true){
			services.value = services.value + "S1,";
		}
		if( checkboxS2.checked == true){
			services.value = services.value + "S2,";
		}
		if( checkboxS3.checked == true){
			services.value = services.value + "S3,";
		}
	}
	
	function validateTokenPage(myform1){
		var serviceType = myform1.servicetype.value;
		var checkboxS1 = document.getElementById("s1");
		var checkboxS2 = document.getElementById("s2");
		var checkboxS3 = document.getElementById("s3");

		/* if(datapopulated != true){
			alert("Customer Data is not populated");
			return false;
		}
		 */
		
		if( checkboxS1.checked == false && checkboxS2.checked == false && checkboxS3.checked == false){
			alert("Please Select Atleast one Service (S1,S2,S3)");
			return false;
		}
		
		if( checkboxS1.checked == false && checkboxS2.checked == false && checkboxS3.checked == false){
			alert("Please Select Atleast one Service (S1,S2,S3)");
			return false;
		}
		else		
		if(serviceType == "nonprime" && checkboxS1.checked == true && checkboxS2.checked == true && checkboxS3.checked == true){
			alert("Sorry All Services are not Allowed to NonPrime Customers");
			return false;
		}
		else{
			return true;
		} 
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
	<div class="tokenbox">
		<span>Tno:</span><label>${nextTokenId}</label>
	</div>
	<div class="box" id="divtwo">
		<h4>Create Token:</h4>
		<form name="myForm" id="myForm" method="post">
			<table>
				<tr>
					<td><label>Enter Customer Id</label></td>
					<td><input type="text" name="id" id="customerId" value="${id}" placeholder="Enter CustomerId""></td>
					<td><input type="button" value="Get Details" onclick="getCustomerDetails()" /></td>
					<td><label>${customerDetails_status}</label></td>
				</tr>
			</table>
		</form>
	</div>

	<div class="box" style="padding-left: 25%">
		<form name="myForm1" id="myForm1" action="./createnewtoken"	method="post" onload="getNextToken()"
			onsubmit="return validateTokenPage(this)">
			<table>
				<tr>
					<td><label> Customer Id</label></td>
					<td><input type="text" name="tcustomerId" value="${id}"
						disabled="disabled"/>
						<input type="hidden" name="customerId" value="${id}"/></td>
				</tr>

				<tr>
					<td><label> Customer Name</label></td>
					<td><input type="text" name="tname" value="${name}"
						disabled="disabled"/>
						<input type="hidden" name="name" value="${name}"/></td>
				</tr>

				<tr>
					<td><label> Phone Number</label></td>
					<td><input type="text" name="tphno" value="${phno}"
						disabled="disabled"/>
						<input type="hidden" name="phno" value="${phno}"/></td>
				</tr>

				<tr>
					<td><label> Address</label></td>
					<td><input type="text" name="taddress" value="${address}"
						disabled="disabled"/>
						<input type="hidden" name="address" value="${address}"/></td>
				</tr>

				<tr>
					<td><label> Service Type</label></td>
					<td><input type="text" name="tservicetype" value="${servicetype}"
						disabled="disabled"/>
						<input type="hidden" name="servicetype" value="${servicetype}"/></td>
				</tr>

				<tr>
					<td><label> Token Number</label></td>
					<td><input type="text" name="ttokenId" value="${nextTokenId}"
						style="background-color: cyan; color: black" disabled="disabled"/>
						<input type="hidden" name="tokenId" value="${nextTokenId}"/></td>
				</tr>
				<tr>
					<td><label> Services Want to Opt:</label></td>
					<td><input type="radio" name="services" id="services" value="S1" checked="checked"/>S1 
					    <input type="radio" name="services" id="services" value="S2"/>S2 
						<input type="radio" name="services" id="services" value="S3"/>S3
						<!-- <input type="hidden" name="services" id="services" value=""/></td> -->
					</td>
				</tr>
				
				<!-- <tr>
					<td><label> Services Want to Opt:</label></td>
					<td><input type="checkbox" name="s1" id="s1" value="s1" onclick="combineServices()"/>S1 
					    <input type="checkbox" name="s2" id="s2" value="s2" onclick="combineServices()"/>S2 
						<input type="checkbox" name="s3" id="s3" value="s3" onclick="combineServices()"/>S3
						<input type="hidden" name="services" id="services" value=""/></td>
				</tr>
				 --><!-- <tr>
					<td><label> Counters</label></td>

					<td><select name="counter">
							<option value="1">Counter1</option>
							<option value="2">Counter2</option>
							<option value="3">Counter3</option>
							<option value="4">CounterPrime</option>
					</select></td>

				</tr>
 				-->
 				<tr>
				</tr>
				<tr>
					<td><input type="submit" value="create" /></td>
					<td><input type="button" value="next"
						onclick="getNextToken();" /></td>
					<td><c:if test="${responseBack2 != null}">
							${responseBack2}
						</c:if></td>
				</tr>
			</table>
		</form>
	</div>

<%-- <div class="counterDetails">
		<label>Check Counter Dtails: </label>
		<form name="myForm2" id="myForm2" method="post">
			<table>
				<tr>
					<td><select name="counter" onchange="getServices()">
							<option value="1">Counter1</option>
							<option value="2">Counter2</option>
							<option value="3">Counter3</option>
							<option value="4">CounterPrime</option>
					</select></td>
				</tr>
				<tr>
					<td align="right">Services:</td>
					<td>${services}</td>
				</tr>
				<tr>
					<td align="right">Queue:</td><td>${countOfTokens}</td>
				</tr>
				<tr>
					<td align="right">Current Token:</td>
					<td>${currentToken}</td>
				</tr>
			</table>
		</form>

	</div>
 --%>
</body>
</html>