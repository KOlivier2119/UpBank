-- Create the database
CREATE DATABASE IF NOT EXISTS upbank;

-- Use the created database
USE upbank;

-- Create the 'users' table
CREATE TABLE IF NOT EXISTS users (
                                     id INT PRIMARY KEY AUTO_INCREMENT,
                                     first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    language VARCHAR(50) NOT NULL
    );

-- Create the 'accounts' table
CREATE TABLE IF NOT EXISTS accounts (
                                        id INT PRIMARY KEY AUTO_INCREMENT,
                                        user_id INT NOT NULL,
                                        balance DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    );

-- Example data insertion (optional)
INSERT INTO users (first_name, last_name, email, password, language)
VALUES
    ('John', 'Doe', 'john.doe@example.com', 'hashed_password_example', 'English');

-- Inserting an account for the above user (optional)
INSERT INTO accounts (user_id, balance)
VALUES
    (1, 100.00);
