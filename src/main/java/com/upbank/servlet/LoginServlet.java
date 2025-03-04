package com.upbank.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Logic to authenticate user (check in database)

        // Simple login success message (you would replace this with real authentication logic)
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h3>Welcome back, " + email + "!</h3>");
    }
}
