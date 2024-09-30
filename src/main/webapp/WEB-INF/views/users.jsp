<%@page import="com.dip.springmvc.dto.Role"%>
<%@page import="java.util.List"%>
<%@page import="com.dip.springmvc.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin User List</title>
  <style type="text/css">
  
  * {
  padding: 0;
  margin: 0;
  text-decoration: none;
  list-style: none;
  box-sizing: border-box;
}

  body {
  font-family: "Montserrat", sans-serif;
  background-color: #f9f9f9;
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

.container {
  max-width: 900px;
  margin: 20px auto;
  background-color: #fff;
  padding: 20px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
  border-radius: 8px;
}

h1 {
  text-align: center;
  color: #333;
  margin-bottom: 20px;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

thead {
  background-color: #f4f4f4;
}

th, td {
  padding: 12px 15px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

th {
  background-color: #007bff;
  color: white;
}

td {
  color: #333;
}

.action-btn {
  padding: 8px 12px;
  border: none;
  background-color: green;
  color: white;
  border-radius: 4px;
  cursor: pointer;
}

.action-btn.block {
  background-color: red;
}

.action-btn:hover {
  opacity: 0.9;
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
<nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
          <i class="fas fa-bars"></i>
        </label>
        <label class="logo">BlogSphere</label>
        <ul>
          <li><a class="active" href="blogs">ALL BLOGS</a></li>
          <li><a href="home">HOME</a></li>
          <li><a href="delete-user">DELETE ACCOUNT</a></li>
          <li><a href="logout">LOGOUT</a></li>
          <li><a href="get-users">ALL USERS</a></li>
        </ul>
      </nav>
  <div class="container">
  
  <% @SuppressWarnings("unchecked") 
  List<User> users = (List<User>) request.getAttribute("users");
  %>
    <h1>Admin Dashboard - User List</h1>
    <table>
      <thead>
        <tr>
          <th>User ID</th>
          <th>User Name</th>
          <th>Email</th>
          <th>Mobile</th>
          <th>Role</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
      <% for(User user : users){
    	  if(user.getRole().equals(Role.USER)){
    	  %>
        <tr>
          <td><%= user.getId() %></td>
          <td><%= user.getUserName() %></td>
          <td><%= user.getMobile() %></td>
          <td><%= user.getEmail() %></td>
          <td><%= user.getRole() %></td>
          <%
          if (user.isBlocked()){ %>
          <td><button class="action-btn unblock" onclick="location.href='unblock-user?id=<%= user.getId()%>'">Unblock</button></td>
          <% } else { %>
          <td><button class="action-btn block" onclick="location.href='block-user?id=<%= user.getId()%>'">Block</button></td>
          <% } %>
        </tr>
        
        <% } else {%>
        <tr>
          <td><%= user.getId() %></td>
          <td><%= user.getUserName() %></td>
          <td><%= user.getMobile() %></td>
          <td><%= user.getEmail() %></td>
          <td><%= user.getRole() %></td>
        </tr>
        <%}
    	  } %>
      </tbody>
    </table>
  </div>
</body>
</html>
