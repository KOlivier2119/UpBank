<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Registration</title>
</head>
<body style="display: flex; justify-content: center; align-items: center; height: 100vh; background-color: #f4f4f4;">

<div style="background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); width: 400px; text-align: center;">
    <h1 style="color: #333; margin-bottom: 20px;">User Registration</h1>

    <form method="post" action="register.jsp" style="display: flex; flex-direction: column; gap: 10px;">

        <label for="firstname" style="text-align: left; font-weight: bold;">First Name:</label>
        <input name="firstname" required id="firstname" type="text" style="padding: 8px; border: 1px solid #ccc; border-radius: 5px;">

        <label for="lastname" style="text-align: left; font-weight: bold;">Last Name:</label>
        <input name="lastname" required id="lastname" type="text" style="padding: 8px; border: 1px solid #ccc; border-radius: 5px;">

        <label for="language" style="text-align: left; font-weight: bold;">Preferred Language:</label>
        <select name="language" required id="language" style="padding: 8px; border: 1px solid #ccc; border-radius: 5px;">
            <option value="" disabled selected>Select your language</option>
            <option value="English">English</option>
            <option value="French">French</option>
            <option value="Italian">Italian</option>
            <option value="Russian">Russian</option>
        </select>

        <label for="email" style="text-align: left; font-weight: bold;">Email:</label>
        <input name="email" type="email" required id="email" style="padding: 8px; border: 1px solid #ccc; border-radius: 5px;">

        <label for="password" style="text-align: left; font-weight: bold;">Password:</label>
        <input name="password" type="password" required id="password" style="padding: 8px; border: 1px solid #ccc; border-radius: 5px;">

        <input type="submit" value="Register"
               style="padding: 10px; background-color: #007bff; color: white; font-size: 16px; border: none; border-radius: 5px; cursor: pointer; margin-top: 10px;">
    </form>
</div>

</body>
</html>
