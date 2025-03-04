package com.upbank.servlet;

import com.upbank.model.Transaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/transaction")
public class TransactionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        double amount = Double.parseDouble(req.getParameter("amount"));

        HttpSession session = req.getSession();
        double balance = (double) session.getAttribute("balance");
        List<Transaction> transactions = (List<Transaction>) session.getAttribute("transactions");

        if (transactions == null) {
            transactions = new ArrayList<>();
        }

        if ("deposit".equals(action)) {
            balance += amount;
            transactions.add(new Transaction("Deposit", amount, new Date()));
        } else if ("withdraw".equals(action)) {
            if (balance >= amount) {
                balance -= amount;
                transactions.add(new Transaction("Withdrawal", amount, new Date()));
            } else {
                req.setAttribute("error", "Insufficient balance");
            }
        }

        session.setAttribute("balance", balance);
        session.setAttribute("transactions", transactions);
        resp.sendRedirect("Dashboard.jsp");
    }
}