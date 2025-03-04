<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UpBank - Register</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            color: #333;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            font-size: 2em;
            margin-bottom: 20px;
            color: #007bff;
        }

        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            margin: auto;
        }

        label {
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
            color: #555;
        }

        input[type="text"], input[type="email"], input[type="password"], select {
            padding: 12px;
            margin: 10px 0;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1em;
        }

        input[type="submit"] {
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1.1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        select {
            background-color: #fff;
            cursor: pointer;
        }

        .form-container select:focus,
        .form-container input:focus {
            outline: none;
            border-color: #007bff;
        }

        .form-container .language-select {
            margin-bottom: 20px;
        }
    </style>

    <script>
        function changeLanguage() {
            var language = document.getElementById("language").value;
            var firstNameLabel = document.getElementById("firstNameLabel");
            var lastNameLabel = document.getElementById("lastNameLabel");
            var emailLabel = document.getElementById("emailLabel");
            var passwordLabel = document.getElementById("passwordLabel");
            var submitButton = document.getElementById("submitBtn");
            var firstNamePlaceholder = document.getElementById("firstname");
            var lastNamePlaceholder = document.getElementById("lastname");
            var emailPlaceholder = document.getElementById("email");
            var passwordPlaceholder = document.getElementById("password");

            if (language == "English") {
                firstNameLabel.innerHTML = "First Name";
                lastNameLabel.innerHTML = "Last Name";
                emailLabel.innerHTML = "Email";
                passwordLabel.innerHTML = "Password";
                submitButton.value = "Register";
                firstNamePlaceholder.placeholder = "Enter your first name";
                lastNamePlaceholder.placeholder = "Enter your last name";
                emailPlaceholder.placeholder = "Enter your email address";
                passwordPlaceholder.placeholder = "Enter your password";
            } else if (language == "French") {
                firstNameLabel.innerHTML = "Prénom";
                lastNameLabel.innerHTML = "Nom de famille";
                emailLabel.innerHTML = "E-mail";
                passwordLabel.innerHTML = "Mot de passe";
                submitButton.value = "S'inscrire";
                firstNamePlaceholder.placeholder = "Entrez votre prénom";
                lastNamePlaceholder.placeholder = "Entrez votre nom de famille";
                emailPlaceholder.placeholder = "Entrez votre adresse e-mail";
                passwordPlaceholder.placeholder = "Entrez votre mot de passe";
            } else if (language == "Italian") {
                firstNameLabel.innerHTML = "Nome";
                lastNameLabel.innerHTML = "Cognome";
                emailLabel.innerHTML = "E-mail";
                passwordLabel.innerHTML = "Password";
                submitButton.value = "Registrati";
                firstNamePlaceholder.placeholder = "Inserisci il tuo nome";
                lastNamePlaceholder.placeholder = "Inserisci il tuo cognome";
                emailPlaceholder.placeholder = "Inserisci il tuo indirizzo email";
                passwordPlaceholder.placeholder = "Inserisci la tua password";
            } else if (language == "Russian") {
                firstNameLabel.innerHTML = "Имя";
                lastNameLabel.innerHTML = "Фамилия";
                emailLabel.innerHTML = "Электронная почта";
                passwordLabel.innerHTML = "Пароль";
                submitButton.value = "Зарегистрироваться";
                firstNamePlaceholder.placeholder = "Введите ваше имя";
                lastNamePlaceholder.placeholder = "Введите вашу фамилию";
                emailPlaceholder.placeholder = "Введите ваш адрес электронной почты";
                passwordPlaceholder.placeholder = "Введите ваш пароль";
            }
        }
    </script>
</head>
<body>

<h1>Register for UpBank</h1>

<div class="form-container">
    <form method="post" action="registerServlet">

        <!-- Language Selection Comes First -->
        <div class="language-select">
            <label for="language">Select Language</label>
            <select name="language" id="language" required onchange="changeLanguage()">
                <option value="" disabled selected>Select Language</option>
                <option value="English">English</option>
                <option value="French">French</option>
                <option value="Italian">Italian</option>
                <option value="Russian">Russian</option>
            </select>
        </div>

        <label id="firstNameLabel">First Name</label>
        <input id="firstname" name="firstname" required type="text" placeholder="Enter your first name">

        <label id="lastNameLabel">Last Name</label>
        <input id="lastname" name="lastname" required type="text" placeholder="Enter your last name">

        <label id="emailLabel">Email</label>
        <input id="email" name="email" required type="email" placeholder="Enter your email address">

        <label id="passwordLabel">Password</label>
        <input id="password" name="password" required type="password" placeholder="Enter your password">

        <input id="submitBtn" type="submit" value="Register">
    </form>
</div>

</body>
</html>
