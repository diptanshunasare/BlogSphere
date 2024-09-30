<%@page import="com.dip.springmvc.dto.Role"%>
<%@page import="com.dip.springmvc.dto.User"%>
<%@page import="com.dip.springmvc.dto.WebBlogDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My-Blogs</title>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"  />   
    <style>
      * {
        padding: 0;
        margin: 0;
        text-decoration: none;
        list-style: none;
        box-sizing: border-box;
      }

      body {
        font-family: "Montserrat", sans-serif;
        background-color: #f4f4f4;
      }
      
label.logo {
  color: white;
  font-size: 25px;
  line-height: 80px;
  padding: 0 100px;
  font-weight: bold;
}
      nav {
        background: #0082e6;
        height: 80px;
        width: 100%;
      }

      nav ul {
        float: right;
        margin-right: 20px;
      }

      nav ul li {
        display: inline-block;
        line-height: 80px;
        margin: 0 5px;
      }

      nav ul li a {
        color: white;
        font-size: 17px;
        padding: 7px 13px;
        border-radius: 3px;
        text-transform: uppercase;
      }

      a.active,
      a:hover {
        background: #1b9bff;
        transition: 0.5s;
      }

      .checkbtn {
        font-size: 22px;
        color: white;
        float: right;
        line-height: 80px;
        margin-right: 30px;
        cursor: pointer;
        display: none;
      }

      #check {
        display: none;
      }

      @media (max-width: 1050px) {
        label.logo {
          padding-left: 30px;
        }
        nav ul li a {
          font-size: 16px;
        }
      }

      /* Responsive media query code for small screen */
      @media (max-width: 890px) {
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
        a:hover,
        a.active {
          background: none;
          color: #0082e6;
        }
        #check:checked ~ ul {
          left: 0;
        }
      }


      a {
        outline: none;
        text-decoration: none;
      }
      .content {
        font-family: "Times New Roman", Times, serif;
        text-align: justify;
      }

      .container{
        background-color: #fff;
        margin-top: 30px;
        padding: 20px;
        border-radius: 30px;
      }
      .title{
        font-size: x-large;
      }
      nav {
  background: #0082e6;
  height: 80px;
  width: 100%;
  position: fixed; /* Add this to fix the navbar */
  top: 0; /* Stick the navbar to the top */
  left: 0;
  z-index: 1000; /* Make sure the navbar stays on top of other content */
}

body {
  margin-top: 80px; /* Add padding to prevent content from overlapping the fixed navbar */
}
      
    </style>	
</head>
<body>
	<%
	User user = (User) session.getAttribute("singleUser");
	@SuppressWarnings("unchecked")
	List<WebBlogDTO> blogs = (List<WebBlogDTO>) request.getAttribute("blogs");
	if (blogs != null) {
	%>
	<nav>
		<input type="checkbox" id="check"> <label for="check"
			class="checkbtn"> <i class="fas fa-bars"></i>
		</label> <label class="logo">BlogSphere</label>
		<ul>
			<li><a class="active" href="home">HOME</a></li>
			<li><a href="edit-user">EDIT PROFILE</a></li>
			<li><a href="delete-user">DELETE ACCOUNT</a></li>
			<li><a href="logout">LOGOUT</a></li>
		</ul>
	</nav>
	<%
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
        <div class="icons d-flex mx-3 align-content-center">
          <div class="text-dark"><i class="fa-solid fa-heart mx-3"></i></div>
          <div class="text-dark"><i class="fa-solid fa-comment mx-3"></i></div>
          <div class="text-dark"><i class="fa-solid fa-share mx-3"></i></div>
        </div>
        <div class="author">
          <p class="text-secondary">-By <%=blog.getAuthor()%></p>
        </div>
        <div class="button">
        <button class=" btn btn-success"
onclick="location.href='update-blog?blog-id=<%=blog.getId()%>&user-id=<%=blog.getUserId()%>'">Update</button>
<button class="btn btn-danger"
onclick="location.href='delete-blog?blog-id=<%=blog.getId()%>&user-id=<%=blog.getUserId()%>'">Delete</button>
        </div>
    </div>
  </div>
	<%
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