<%@page import="com.dip.springmvc.dto.WebBlogDTO"%>
<%@page import="com.dip.springmvc.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit-blog</title>
<style type="text/css">
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
            input[type="text"],
    textarea {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        margin-bottom: 16px;
        resize: none;
    }
</style>
</head>
<body>
<% WebBlogDTO blog = (WebBlogDTO) request.getAttribute("blog"); %>
    <div>
        <form action="./edit-blog" method="post">
            <table>
                <tr>
                    <td class="txt">Id</td>
                    <td><input type="text" name="id" required="required"
                        value="<%=blog.getId()%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <td class="txt">Title</td>
                    <td><input type="text" name="title" required="required"
                        value="<%=blog.getTitle()%>"></td>
                </tr>
                <tr>
                    <td class="txt">Content</td>
                    <td><textarea id="content" rows="8" cols="18" name="content" placeholder="What's on your mind?" required="required"><%= blog.getContent() %></textarea></td>
                </tr>
                <tr>
                    <td class="txt">Author</td>
                    <td><input type="text" name="author" required="required"
                        value="<%=blog.getAuthor()%>"></td>
                </tr>
            </table>
            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>