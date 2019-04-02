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
	width: 100%%;
	background-color: #501D1D;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
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
            font:15px Verdana; 
            background-color:#FFF; 
            position:relative; 
            width:80px; 
            height:27px; 
            padding:5px; 
            border:solid 1px #CCF; border-radius:2px; 
            -moz-border-radius:2px; -webkit-border-radius:2px;
        }
        #divAnim label {
            width:100%; 
            color:#009872; 
            font-size:14px; 
            padding:10px; 
        }
        #divAnim input {
            padding:3px 2px; 
            border:solid 1px #3079ED; 
            border-radius:2px; 
            -moz-border-radius:2px; -webkit-border-radius:2px; 
            background:#6D9BF1; 
            color:#FFF; 
            cursor:pointer;
        }
        #divAnim div {
            display:none; 
            padding:20px 10px;
        }
        #divAnim li {
            margin:0 2px 0 0;
            display:inline;
            font-size:0.7em;
            font-style:normal;
            padding:2px 0 2px 2px;
            vertical-align:middle;
        }
 </style>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type='text/javascript'>

	function getCounter() {
		var cv = counters.counter.value;
		if (cv == 1) {
			var c1 = document.getElementById("c1");
			var c2 = document.getElementById("c2");
			var c3 = document.getElementById("c3");
			var cp = document.getElementById("cp");
			c1.style.display = "inline";
			c2.style.display = "none";
			c3.style.display = "none";
			cp.style.display = "none";
			
		}
		if (cv == 2) {
			var c1 = document.getElementById("c1");
			var c2 = document.getElementById("c2");
			var c3 = document.getElementById("c3");
			var cp = document.getElementById("cp");
			c1.style.display = "none";
			c2.style.display = "inline";
			c3.style.display = "none";
			cp.style.display = "none";
			
		}
		if (cv == 3) {
			var c1 = document.getElementById("c1");
			var c2 = document.getElementById("c2");
			var c3 = document.getElementById("c3");
			var cp = document.getElementById("cp");
			c1.style.display = "none";
			c2.style.display = "none";
			c3.style.display = "inline";
			cp.style.display = "none";
			
		}
		if (cv == "p") {
			var c1 = document.getElementById("c1");
			var c2 = document.getElementById("c2");
			var c3 = document.getElementById("c3");
			var cp = document.getElementById("cp");
			c1.style.display = "none";
			c2.style.display = "none";
			c3.style.display = "none";
			cp.style.display = "inline";
			
		}
	}
	
	function validateManageToken(myform){
		var tokenId = myform.tokenId.value;
		if(tokenId == ""){
			alert("Sorry No Tokens Available to Serve");
			return false;
		}
		else{
			return true;
		}
	}
    $(document).ready(function () {
        $('#btAnimate').click(function () {
            // ANIMATE THE CONTAINER. DURATION SET TO 500 MILLISECONDS.
            $("#divAnim").animate({ width: '500px', height: '120px' }, 500);
            $('#divC').show();          // ALSO SHOW THE DIV.
        });

        // REVERSE ANIMATE.
        $('#btHide').click(function () {
            $("#divAnim").animate({ width: '80px', height: '27px' }, 500);
            $('#divC').hide('slow');          // HIDE THE DIV.
        });
    });
</script>

</head>
<body>
	<ul>
		<li><a href="#">Profile</a></li>
		<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">Services</a>
			<div class="dropdown-content">
				 <a href="./showcounters">Show Counters</a>
				 <a href="./managecounters">Manage Counters</a>
			</div></li>
		<li><a href="./login">Logout</a></li>
	</ul>

	<div align="center">
		<form name="counters" id="counters">
			<table style="width: 50%">
				<tr>
					<td align="right">Select Counter</td>
					<td><select name="counter">
							<option value="1">Counter1</option>
							<option value="2">Counter2</option>
							<option value="3">Counter3</option>
							<option value="p">CounterPrime</option>
					</select></td>
					<td><input type="button" value="Get Counter Details"
						onclick="getCounter()" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div style="padding-left: 25%" id="divAnim" >
	<label id="btAnimate">Counter - ONE </label>
		<div class="counterDetails" id="divC">
			<label>Counter: ONE</label>
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
						<input type="hidden" name="tokenId" value="${currentToken1}"/>
					</tr>
					<tr>
						<td align="right">Action:</td>
						<td><input type="radio" name="action" value="complete" checked="checked"/>Completed
							<br /> <input type="radio" name="action" value="cancel" />Cancelled
						</td>
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
		<div class="counterDetails" id="c2" style="display: none">
			<label>Counter: TWO</label>
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
					<td><input type="radio" name="action" value="complete" checked="checked"/>Completed
						<br /> <input type="radio" name="action" value="cancel" />Cancelled
					</td>
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
		<div class="counterDetails" id="c3" style="display: none">
			<label>Counter: THREE</label>
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
					<td><input type="radio" name="action" value="complete" checked="checked"/>Completed
						<br /> <input type="radio" name="action" value="cancel" />Cancelled
					</td>
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
		<div class="counterDetails" id="cp" style="display: none">
			<label>Counter: PRIME</label>
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
					<td><input type="radio" name="action" value="complete"  checked="checked"/>Completed
						<br /> <input type="radio" name="action" value="cancel" />Cancelled
					</td>
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