<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Blog</title>
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
        margin: 0;
        padding: 0;
        height: 100vh;
    }
    label.logo {
  color: white;
  font-size: 25px;
  line-height: 80px;
  padding: 0 100px;
  font-weight: bold;
}
    .container {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        width: 90%;
        max-width: 600px;
        margin:200px auto;
        
    }
    form {
        display: flex;
        flex-direction: column;
    }
    input[type="text"],
    textarea {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        margin-bottom: 16px;
        resize: none; /* Disables resizing for textarea */
    }
    input[type="submit"] {
        background-color: #0056b3;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    input[type="submit"]:hover {
        background-color: #004494;
    }
    label {
        font-weight: bold;
        margin-bottom: 8px;
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
      .center{
      margin:10px auto;
      }
      
</style>
</head>
<body>
   <nav>
   <input type="checkbox" id="check"> <label for="check"
			class="checkbtn"> <i class="fas fa-bars"></i>
		</label> <label class="logo">BlogSphere</label>
      <input type="checkbox" id="check" />
      <label for="check" class="checkbtn"> <i class="fas fa-bars"></i> </label>
      <ul>
        <li><a class="active" href="home">HOME</a></li>
        <li><a href="edit-user">EDIT PROFILE</a></li>
        <li><a href="delete-user">DELETE ACCOUNT</a></li>
        <li><a href="logout">LOGOUT</a></li>
      </ul>
    </nav>
    <div class="container">
        <h2 class="center">Add a New Blog Post</h2>
        <br>
        <form action="./add-blog" method="post">
            <div>
                <label for="title">Title</label>
                <input type="text" id="title" name="title" required autofocus>
            </div>
            <div>
                <label for="content">Content</label>
                <textarea id="content" rows="12" cols="24" name="content" placeholder="What's on your mind?"></textarea>
            </div>
            <div>
                <label for="author">Author</label>
                <input type="text" id="author" name="author" required>
            </div>
            <input type="submit" value="Add Blog">
        </form>
    </div>
</body>
</html>
