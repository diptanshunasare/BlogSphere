<%@page import="com.dip.springmvc.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #4D7CFF;
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            width: 300px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 8px;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4D7CFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #3A61D0;
        }
        .txt{
        color:black;	
        }
    </style>
</head>
<body>
    <%
    User user = (User) request.getAttribute("user");
    %>
    <div>
        <form action="./update-user" method="post">
            <table>
                <tr>
                    <td class="txt">Id</td>
                    <td><input type="text" name="id" required="required"
                        value="<%=user.getId()%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <td class="txt">Username</td>
                    <td><input type="text" name="username" required="required"
                        value="<%=user.getUserName()%>"></td>
                </tr>
                <tr>
                    <td class="txt">Email</td>
                    <td><input type="email" name="email" required="required"
                        value="<%=user.getEmail()%>"></td>
                </tr>
                <tr>
                    <td class="txt">Mobile</td>
                    <td><input type="text" name="mobile" required="required"
                        value="<%=user.getMobile()%>"></td>
                </tr>
                <tr>
                    <td class="txt">Password</td>
                    <td><input type="password" name="password" required="required"
                        value="<%=user.getPassword()%>"></td>
                </tr>
            </table>
            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>
