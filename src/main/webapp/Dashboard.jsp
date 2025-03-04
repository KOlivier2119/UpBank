<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.upbank.model.User" %>
<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setHeader("Expires", "0"); // Proxies


    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>UpBank Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar-brand {
            font-weight: bold;
        }
        .card {
            margin-bottom: 1rem;
        }
        .dashboard-header {
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .logout-btn {
            color: #fff;
        }
        .balance {
            font-size: 1.5rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="#">UpBank</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Accounts</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Transactions</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Reports</a>
            </li>
        </ul>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link logout-btn" href="${pageContext.request.contextPath}/logout">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Main Dashboard Container -->
<div class="container-fluid dashboard-header">
    <h2>Welcome, <%= user.getFirstName() %>!</h2>

    <div class="row">
        <!-- Left Column: Charts & Overview -->
        <div class="col-md-8">
            <!-- Account Balance Card -->
            <div class="card text-white bg-success">
                <div class="card-header">Account Balance</div>
                <div class="card-body">
                    <p class="balance">$2,500.00</p>
                    <p>Last updated: March 4, 2025</p>
                </div>
            </div>

            <!-- Account Balance Over Time Chart -->
            <div class="card">
                <div class="card-header">Account Balance Over Time</div>
                <div class="card-body">
                    <canvas id="balanceChart" height="150"></canvas>
                </div>
            </div>

            <!-- Expense Distribution Chart -->
            <div class="card">
                <div class="card-header">Expense Distribution</div>
                <div class="card-body">
                    <canvas id="expenseChart" height="150"></canvas>
                </div>
            </div>
        </div>

        <!-- Right Column: Recent Activity & Notifications -->
        <div class="col-md-4">
            <!-- Recent Transactions -->
            <div class="card">
                <div class="card-header">Recent Transactions</div>
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item">Payment to ABC Store - $50.00</li>
                        <li class="list-group-item">Salary Credit - $2000.00</li>
                        <li class="list-group-item">Online Purchase - $75.00</li>
                        <li class="list-group-item">Utility Bill - $120.00</li>
                        <li class="list-group-item">Transfer Received - $300.00</li>
                    </ul>
                </div>
            </div>

            <!-- Notifications -->
            <div class="card mt-3">
                <div class="card-header">Notifications</div>
                <div class="card-body">
                    <p>No new notifications</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Include JS libraries -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Chart.js Scripts -->
<script>
    // Account Balance Over Time Chart Data
    const balanceCtx = document.getElementById('balanceChart').getContext('2d');
    const balanceChart = new Chart(balanceCtx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'Account Balance',
                data: [1500, 1700, 1600, 1800, 1750, 2500],
                backgroundColor: 'rgba(0, 123, 255, 0.2)',
                borderColor: 'rgba(0, 123, 255, 1)',
                borderWidth: 2,
                fill: true
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    });

    // Expense Distribution Chart Data
    const expenseCtx = document.getElementById('expenseChart').getContext('2d');
    const expenseChart = new Chart(expenseCtx, {
        type: 'doughnut',
        data: {
            labels: ['Food', 'Rent', 'Utilities', 'Entertainment', 'Others'],
            datasets: [{
                data: [30, 40, 10, 10, 10],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.6)',
                    'rgba(54, 162, 235, 0.6)',
                    'rgba(255, 206, 86, 0.6)',
                    'rgba(75, 192, 192, 0.6)',
                    'rgba(153, 102, 255, 0.6)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    });
</script>
</body>
</html>