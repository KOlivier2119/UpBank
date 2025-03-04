package com.upbank.servlet;

import com.upbank.dao.UserDAO;
import com.upbank.model.User;
import jakarta.servlet.ServletException;
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


        UserDAO userDAO = new UserDAO();
        if (userDAO.isEmailTaken(email)) {

            request.setAttribute("errorMessage", "Email is already registered!");
            request.getRequestDispatcher("/registerPage").forward(request, response);
        } else {

            User user = new User(firstname, lastname, email, password, language);

            boolean registrationSuccess = userDAO.registerUser(user);
            if (registrationSuccess) {
                response.sendRedirect("/UpBank_war_exploded/loginPage");
            } else {
                request.setAttribute("errorMessage", "An error occurred during registration. Please try again.");
                request.getRequestDispatcher("/registerPage").forward(request, response);
            }
        }
    }
}
