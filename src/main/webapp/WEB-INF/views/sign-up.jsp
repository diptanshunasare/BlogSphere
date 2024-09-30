<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration or Sign Up form in HTML CSS | CodingLab</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #4070f4;
}

.wrapper {
	position: relative;
	max-width: 430px;
	width: 100%;
	background: #fff;
	padding: 34px;
	border-radius: 6px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.wrapper h2 {
	position: relative;
	font-size: 22px;
	font-weight: 600;
	color: #333;
}

.wrapper h2::before {
	content: '';
	position: absolute;
	left: 0;
	bottom: 0;
	height: 3px;
	width: 28px;
	border-radius: 12px;
	background: #4070f4;
}

.wrapper form {
	margin-top: 30px;
}

.wrapper form .input-box {
	height: 52px;
	margin: 18px 0;
}

form .input-box input {
	height: 100%;
	width: 100%;
	outline: none;
	padding: 0 15px;
	font-size: 17px;
	font-weight: 400;
	color: #333;
	border: 1.5px solid #C7BEBE;
	border-bottom-width: 2.5px;
	border-radius: 6px;
	transition: all 0.3s ease;
}

.input-box input:focus, .input-box input:valid {
	border-color: #4070f4;
}

form .policy {
	display: flex;
	align-items: center;
}

form h3 {
	color: #707070;
	font-size: 14px;
	font-weight: 500;
	margin-left: 10px;
}

.input-box.button input {
	color: #fff;
	letter-spacing: 1px;
	border: none;
	background: #4070f4;
	cursor: pointer;
}

.input-box.button input:hover {
	background: #0e4bf1;
}

form .text h3 {
	color: #333;
	width: 100%;
	text-align: center;
}

form .text h3 a {
	color: #4070f4;
	text-decoration: none;
}

form .text h3 a:hover {
	text-decoration: underline;
}
select {
    height: 52px; /* Ensures the height matches other inputs */
    width: 100%;
    outline: none;
    padding: 0 15px;
    font-size: 17px;
    color: #333;
    border: 1.5px solid #C7BEBE;
    border-bottom-width: 2.5px;
    border-radius: 6px;
    background: white;
    cursor: pointer;
    -webkit-appearance: none; /* Removes default styling of dropdown in WebKit browsers */
    -moz-appearance: none; /* Removes default styling of dropdown in Mozilla browsers */
    appearance: none; /* Removes default styling */
    position: relative;
}

.wrapper form .input-box select {
    display: block; /* Makes sure the select element fills the container */
    margin-top: 18px;
}

/* Custom arrow styling */
.wrapper form .input-box::after {
    content: '\25BC'; /* Adds downward arrow */
    color: #4070f4;
    font-size: 15px;
    position: absolute;
    right: 15px;
    top: calc(50% + 9px);
    pointer-events: none; /* Ensures clicks on the arrow act like clicks on the dropdown */
}

</style>
</head>
<body>
	<div class="wrapper">
		<h2>Registration</h2>
		<form action="./users" method="post">
			<div class="input-box">
				<input type="text" name="username" placeholder="Enter your name"
					required>
			</div>
			<div class="input-box">
				<input type="text" name="email" placeholder="Enter your email"
					required>
			</div>
			<div class="input-box">
				<input type="number" name="mobile"
					placeholder="Enter your mobile number" required>
			</div>
			<div class="input-box">
				<input type="text" name="password" placeholder="Create password"
					required>
			</div>
			<div class="input-box">
				<select name="role">
					<option disabled="disabled" selected="selected">Select
						Role</option>
					<option value="ADMIN">ADMIN</option>
					<option value="USER">USER</option>
				</select>
			</div>
			<div class="policy">
				<input type="checkbox">
				<h3>I accept all terms and condition</h3>
			</div>
			<div class="input-box button">
				<input type="Submit" value="Register Now">
			</div>
			
			<div class="text">
				<h3>
					Already have an account? <a href="login">Login now</a>
				</h3>
			</div>
		</form>
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>

		<h1><%=message%></h1>
		<%
		}
		%>
	</div>
</body>
</html>