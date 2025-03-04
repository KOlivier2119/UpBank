package com.upbank.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;


public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String language = request.getParameter("language");
        String password = request.getParameter("password");

        // Logic for storing user in the database (or processing it)

        // Response after registration (Simple response)
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h3>User " + firstname + " registered successfully!</h3>");
    }
}
