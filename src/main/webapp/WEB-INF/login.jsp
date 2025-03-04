<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UpBank - Login</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; background-color: #f4f4f4; }
        .form-container { background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); width: 300px; margin: auto; }
        input[type="email"], input[type="password"] { padding: 10px; margin: 10px; width: 100%; border: 1px solid #ccc; border-radius: 5px; }
        input[type="submit"] { padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer; }
        input[type="submit"]:hover { background-color: #0056b3; }
    </style>
</head>
<body>

<h1>Login to UpBank</h1>

<div class="form-container">
    <form method="post" action="loginServlet">
        <input name="email" required type="email" placeholder="Email">
        <input name="password" required type="password" placeholder="Password">

        <input type="submit" value="Login">
    </form>
</div>

</body>
</html>
