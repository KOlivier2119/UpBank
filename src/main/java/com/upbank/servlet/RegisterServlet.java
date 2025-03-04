package com.upbank.servlet;

import com.upbank.dao.UserDAO;
import com.upbank.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String language = request.getParameter("language");
        String password = request.getParameter("password");

        // Check if the email is already taken
        UserDAO userDAO = new UserDAO();
        if (userDAO.isEmailTaken(email)) {
            // If email is already taken, show an error message
            request.setAttribute("errorMessage", "Email is already registered!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            // If email is not taken, create a new User object and register
            User user = new User(firstname, lastname, email, password, language);

            boolean registrationSuccess = userDAO.registerUser(user);
            if (registrationSuccess) {
                response.sendRedirect("login.jsp"); // Redirect to login after successful registration
            } else {
                request.setAttribute("errorMessage", "An error occurred during registration. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    }
}
