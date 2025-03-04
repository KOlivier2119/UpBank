package com.upbank;

import com.upbank.dao.UserDAO;
import com.upbank.model.User;
import jakarta.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


 class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String language = request.getParameter("language");

        User user = new User(firstName, lastName, email, password,  language);

        if (userDAO.registerUser(user)) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().write("Error: Registration failed.");
        }
    }
}
