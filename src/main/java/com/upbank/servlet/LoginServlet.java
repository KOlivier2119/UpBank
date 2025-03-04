package com.upbank.servlet;

import com.upbank.dao.UserDAO;
import com.upbank.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Assuming a UserDAO exists to validate credentials from the database
        UserDAO userDAO = new UserDAO();
        boolean user = userDAO.validateUser(email, password);

        if (user) {
            // Successful login: Redirect to the dashboard
            HttpSession session = request.getSession();
            session.setAttribute("user", user); // Store the user object in the session
            response.sendRedirect("Dashboard.jsp"); // Redirect to the dashboard page
        } else {
            // Invalid login: Show error message
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response); // Forward back to login page
        }
    }
}
