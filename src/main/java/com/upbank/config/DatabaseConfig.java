package com.upbank.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConfig {

    private static final String URL = "jdbc:postgresql://localhost:5432/upbank"; // replace with your PostgreSQL URL
    private static final String USER = "postgres"; // replace with your database username
    private static final String PASSWORD = "Kom0852@"; // replace with your database password
    private static Connection connection;

    // Static block to load the PostgreSQL JDBC driver
    static {
        try {
            // Load PostgreSQL JDBC driver (not needed for modern versions of JDBC, but good practice)
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to get a connection to the database
    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        }
        return connection;
    }

    // Method to close the database connection
    public static void shutdown() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
