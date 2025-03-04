<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to UpBank</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        /* Container Styling */
        .container {
            text-align: center;
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
        }

        /* Heading Styling */
        h1 {
            font-size: 3em;
            color: #007bff;
            margin-bottom: 20px;
        }

        /* Paragraph Styling */
        p {
            font-size: 1.2em;
            margin-bottom: 30px;
            color: #555;
        }

        /* Button Styling */
        .btn {
            display: inline-block;
            padding: 15px 30px;
            font-size: 1.2em;
            color: white;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 6px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .footer {
            position: fixed;
            bottom: 10px;
            font-size: 0.9em;
            color: #888;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Welcome to UpBank</h1>
    <p>Your trusted digital banking solution for a seamless financial experience.</p>
    <a href="register.jsp" class="btn">Get Started - Register Now</a>
    <a href="login.jsp" class="btn">Login</a>
</div>

<div class="footer">
    <p>&copy; 2025 UpBank. All rights reserved.</p>
</div>

</body>
</html>
