package com.upbank.dao;

import com.upbank.model.User;
import com.upbank.config.DatabaseConfig;
import java.sql.*;

public class UserDAO {

    // Register a new user in the database
    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (first_name, last_name, email, password, language) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, user.getFirstName());
            statement.setString(2, user.getLastName());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getLanguage());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0; // Return true if at least one row was inserted
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Validate user login credentials (email and password)
    public boolean validateUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();
            return resultSet.next(); // Returns true if there is a matching user
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Check if email already exists in the database (for registration)
    public boolean isEmailTaken(String email) {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);

            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
            long count = resultSet.getLong(1); // Get the count from the result set
            return count > 0; // Return true if the email exists
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get a user by email (for fetching user details, etc.)
    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email = ?";

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                // If a user is found, create a User object and return it
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setFirstName(resultSet.getString("first_name"));
                user.setLastName(resultSet.getString("last_name"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setLanguage(resultSet.getString("language"));

                return user;
            }
            return null; // Return null if no user is found
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
