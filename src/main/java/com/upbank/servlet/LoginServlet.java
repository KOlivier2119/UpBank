package com.upbank.servlet;

import com.upbank.dao.UserDAO;
import com.upbank.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmail(email);

        if (user != null && user.getPassword().equals(password)) {
            // Create a session and set user attributes
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Initialize balance (you can fetch this from the database or set a default value)
            double initialBalance = 1000.00; // Example initial balance
            session.setAttribute("balance", initialBalance);

            // Set session timeout (30 minutes)
            session.setMaxInactiveInterval(30 * 60);

            // Prevent caching of sensitive pages
            response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            // Redirect to the dashboard
            response.sendRedirect("Dashboard.jsp");
        } else {
            // Handle invalid login
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}