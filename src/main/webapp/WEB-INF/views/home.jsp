<%@page import="com.dip.springmvc.dto.Role"%>
<%@page import="com.dip.springmvc.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Blog</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap');
* {
  padding: 0;
  margin: 0;
  text-decoration: none;
  list-style: none;
  box-sizing: border-box;
}

body {
  font-family: "Montserrat", sans-serif;
}

nav {
  background: #0082e6;
  height: 80px;
  width: 100%;
}

label.logo {
  color: white;
  font-size: 25px;
  line-height: 80px;
  padding: 0 100px;
  font-weight: bold;
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
  transition: .5s;
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

  label.logo {
    font-size: 22px;
  }

  ul {
    position: fixed;
    width: 100%;
    height: 100vh;
    background: #2c3e50;
    top: 80px;
    left: -100%;
    text-align: center;
    transition: all .5s;
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

  #check:checked~ul {
    left: 0;
  }
}
section {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  text-align: left;
  padding-left: 50px; /* Adjust as needed */
  color: #FFFFFF; /* For white text color */
  height: calc(100vh - 80px); /* Full height minus the nav */
  width: 100%;
  background-color:#30baed;
  background-size: cover;
}

.content h1 {
  font-size: 2.5em; /* Large text */
  margin-bottom: 0.5em; /* Space between the h1 and paragraph */
}

.content p {
  font-size: 1.5em;
  margin-bottom: 1em; /* Space between the paragraph and button */
}

.content button {
  padding: 10px 20px;
  background-color: #0056b3; /* Dark blue, harmonizes with lighter blues */
  border: none;
  color: white;
  font-size: 1.2em;
  cursor: pointer;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}
.content button:hover {
  background-color: #003d7a; /* Even darker blue on hover */
}



    </style>
  </head>

  <body>
    <%
	User user  = (User) session.getAttribute("singleUser");
	if(user.getRole().equals(Role.USER)){
	%>
    <nav>
        <!-- Checkbox for toggling menu -->
        <input type="checkbox" id="check">
        <!-- Menu icon -->
        <label for="check" class="checkbtn">
          <i class="fas fa-bars"></i>
        </label>
        <!-- Site logo -->
        <label class="logo">BlogSphere</label>
        <!-- Navigation links -->
        <ul>
          <li><a class="active" href="blogs">ALL BLOGS</a></li>
          <li><a href="my-blogs">MY BLOGS</a></li>
          <li><a href="edit-user">EDIT PROFILE</a></li>
          <li><a href="delete-user">DELETE ACCOUNT</a></li>
          <li><a href="logout">LOGOUT</a></li>
        </ul>
      </nav>
      <section>
        <div class="content">
          <h1>Publish your passions, your way</h1>
          <p>Create a unique and beautiful blog easily.</p>
          <button onclick="location.href='add-blog-page'">CREATE YOUR BLOG</button>
        </div>
      </section> 
      <%
	} else {
	%>

    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
          <i class="fas fa-bars"></i>
        </label>
        <label class="logo">BlogSphere</label>
        <ul>
          <li><a class="active" href="blogs">ALL BLOGS</a></li>
          <li><a href="edit-user">EDIT PROFILE</a></li>
          <li><a href="delete-user">DELETE ACCOUNT</a></li>
          <li><a href="logout">LOGOUT</a></li>
          <li><a href="get-users">ALL USERS</a></li>
        </ul>
      </nav>
      <section>
        <div class="content">
          <h1>Welcome Admin!!</h1>
          <p>Create a unique and beautiful blog easily.</p>
        </div>
      </section> 
      <%
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
