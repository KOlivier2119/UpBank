CREATE DATABASE upbank;
USE upbank;

CREATE TABLE users (
                       id INT PRIMARY KEY AUTO_INCREMENT,
                       first_name VARCHAR(50),
                       last_name VARCHAR(50),
                       email VARCHAR(100) UNIQUE,
                       password VARCHAR(255),
                       language VARCHAR(255)
);

CREATE TABLE accounts (
                          id INT PRIMARY KEY AUTO_INCREMENT,
                          user_id INT,
                          balance DECIMAL(10,2) DEFAULT 0.00,
                          FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
