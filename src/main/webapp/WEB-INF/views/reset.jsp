<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reset Password</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #5372F0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.login-container {
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	width: 300px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #333;
}

.input-group {
	margin-bottom: 20px;
}

input[type="text"], input[type="password"] {
	width: 280px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

button {
	width: 100%;
	padding: 10px;
	border: none;
	background-color: #5372F0;
	color: white;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #2c52ed;
}

label {
	display: block;
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<div class="login-container">
	<% String message = (String) request.getAttribute("message");
	if(message!=null){
	%>
	
	<h4><%= message %></h4>
	<% } %>
		<form action="./newPassword" method="post">
			<h2>Reset Password</h2>
			<div class="input-group">
				<label for="email"> Enter your email</label> <input
					type="text" id="email" name="email" required>
			</div>
			<div class="input-group">
				<label for="oldpassword">Old Password</label> <input
					type="password" id="old-password" name="oldpassword" required>
			</div>
			<div class="input-group">
				<label for="new-password">New Password</label> <input
					type="password" id="new-password" name="newpassword" required>
			</div>
			<button type="submit">Reset Password</button>
		</form>
	</div>
</body>
</html>
