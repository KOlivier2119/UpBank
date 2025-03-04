package com.upbank.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class LogOutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the current session, if one exists
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Invalidate the session to log the user out
            session.invalidate();
        }
        // Redirect to the login page (adjust the URL if necessary)
        response.sendRedirect("login.jsp");
    }
}
