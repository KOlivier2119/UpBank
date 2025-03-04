package com.upbank.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * HomeServlet - Handles requests to "/home"
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Writing a simple HTML response
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>UpBank - Home</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }");
            out.println("h1 { color: #007bff; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Welcome to UpBank</h1>");
            out.println("<p>Your trusted digital banking solution.</p>");
            out.println("<a href='index.jsp'>Go to Home Page</a>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
