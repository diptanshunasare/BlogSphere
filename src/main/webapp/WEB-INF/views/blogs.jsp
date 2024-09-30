<%@page import="com.dip.springmvc.dto.Role"%>
<%@page import="com.dip.springmvc.dto.WebBlogDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>All-Blogs</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<style>
* {
	padding: 0;
	margin: 0;
	text-decoration: none;
	list-style: none;
	box-sizing: border-box;
}

body {
	font-family: "Montserrat", sans-serif !important;
	background-color: #f4f4f4;
}

nav {
	position: sticky;
	top: 0;
	z-index: 1000; /* Ensures the navbar stays above other elements */
	width: 100%;
}

.container-fluid {
	height: 80px;
}

li {
	font-size: 17px;
}

li.active, li:hover {
	background: #1b9bff;
	transition: 0.5s;
}

nav ul li a {
	color: white;
	font-size: 15px;
	padding: 7px 13px;
	border-radius: 3px;
	text-transform: uppercase;
}

nav ul li {
	line-height: 50px;
}

.box {
	height: 35px;
	outline: none;
	text-decoration: none;
	border: none;
	border-radius: 5px;
}

.opt {
	font-size: small;
}

@media ( max-width : 1050px) {
	label.logo {
		padding-left: 30px;
	}
	nav ul li a {
		font-size: 16px;
	}
}

/* Responsive media query code for small screen */
@media ( max-width : 890px) {
	.checkbtn {
		display: block;
	}
	ul {
		position: fixed;
		width: 100%;
		height: 100vh;
		background: #2c3e50;
		top: 80px;
		left: -100%;
		text-align: center;
		transition: all 0.5s;
	}
	nav ul li {
		display: block;
		margin: 50px 0;
		line-height: 30px;
	}
	nav ul li a {
		font-size: 20px;
	}
	a:hover, a.active {
		background: none;
		color: #0082e6;
	}
	#check:checked ~ ul {
		left: 0;
	}
}

.content {
	font-family: "Times New Roman", Times, serif;
	text-align: justify;
}

.container {
	background-color: #fff;
	margin-top: 30px;
	padding: 20px;
	border-radius: 30px;
}

.title {
	font-size: x-large;
}

.buttonx {
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<%
	@SuppressWarnings("unchecked")
	List<WebBlogDTO> blogs = (List<WebBlogDTO>) request.getAttribute("blogs");
	Role role = (Role) request.getAttribute("role");
	if (blogs != null) {
	%>
	<nav
		class="container-fluid bg-primary d-flex justify-content-between align-items-center">
		<div class="d-flex">
			<form action="./search">
				<input class="box search-box p-2 me-2" type="search" name="query"
					placeholder="Search here..." />
				<button class="buttonx btn btn-success" type="submit">Search</button>
			</form>
			<form class="mx-4" action="./sort">
				<select name="index" class="box me-2 opt search-box"
					required="required">
					<option value="1">NEWEST FIRST</option>
					<option value="0">OLDEST FIRST</option>
				</select> <input class="buttonx btn btn-success" type="submit" value="Sort" />
			</form>
		</div>
		<div>
			<ul class="d-flex">
				<li class="active"><a
					class="text-light mx-3 fw-light text-decoration-none" href="home">HOME</a>
				</li>
				<li><a class="text-light mx-3 fw-light text-decoration-none"
					href="edit-user">EDIT PROFILE</a></li>
				<li><a class="text-light mx-3 fw-light text-decoration-none"
					href="delete-user">DELETE ACCOUNT</a></li>
				<li><a class="text-light mx-3 fw-light text-decoration-none"
					href="logout">LOGOUT</a></li>
			</ul>
		</div>
	</nav>

	<%
	if (role != null && role.equals(Role.USER)) {

		for (WebBlogDTO blog : blogs) {
	%>
	<div class="container">
		<div class="box-1 container-fluid d-flex justify-content-between">
			<div class="title mx-3 fw-bold"><%=blog.getTitle()%></div>
			<div class="date"><%=blog.getDate()%></div>
		</div>
		<hr />
		<div class="content p-2">
			<%=blog.getContent()%>
		</div>
		<hr>
		<div class="box-2 d-flex text-light justify-content-between">
			<div class="icons d-flex mx-3">
				<div class="text-dark">
					<i class="fa-solid fa-heart mx-3"></i>
				</div>
				<div class="text-dark">
					<i class="fa-solid fa-comment mx-3"></i>
				</div>
				<div class="text-dark">
					<i class="fa-solid fa-share mx-3"></i>
				</div>
			</div>
			<div class="author">
				<p class="text-secondary">
					-By
					<%=blog.getAuthor()%></p>
			</div>
		</div>
	</div>
	<%
	}
	} else {
	for (WebBlogDTO blog : blogs) {
	%>

	<div class="container">
		<div class="box-1 container-fluid d-flex justify-content-between">
			<div class="title mx-3 fw-bold"><%=blog.getTitle()%></div>
			<div class="date"><%=blog.getDate()%></div>
		</div>
		<hr />
		<div class="content p-2">
			<%=blog.getContent()%>
		</div>
		<hr>
		<div class="box-2 d-flex text-light justify-content-between">
			<div class="icons d-flex mx-3">
				<div class="text-dark">
					<i class="fa-solid fa-heart mx-3"></i>
				</div>
				<div class="text-dark">
					<i class="fa-solid fa-comment mx-3"></i>
				</div>
				<div class="text-dark">
					<i class="fa-solid fa-share mx-3"></i>
				</div>
			</div>
			<div class="author">
				<p class="text-secondary">
					-By
					<%=blog.getAuthor()%></p>
			</div>
			<div class="button">
				<button class="btn btn-danger"
					onclick="location.href='delete-blog?blog-id=<%=blog.getId()%>&user-id=<%=blog.getUserId()%>'">Delete</button>
			</div>
		</div>
	</div>
	<%
	}

	}
	}

	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<h3><%=message%></h3>
	<%
	}
	%>
</body>
</html>
