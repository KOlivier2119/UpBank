package com.upbank.dao;

import com.upbank.model.User;
import com.upbank.config.DatabaseConfig;
import jakarta.persistence.*;

public class UserDAO {

    private EntityManagerFactory emf = DatabaseConfig.getEntityManagerFactory();

    // Register a new user in the database
    public boolean registerUser(User user) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    // Validate user login credentials (email and password)
    public boolean validateUser(String email, String password) {
        EntityManager em = emf.createEntityManager();
        try {
            String query = "SELECT u FROM User u WHERE u.email = :email AND u.password = :password";
            TypedQuery<User> typedQuery = em.createQuery(query, User.class);
            typedQuery.setParameter("email", email);
            typedQuery.setParameter("password", password);

            User user = typedQuery.getResultList().stream().findFirst().orElse(null);

            return user != null; // Return true if user found, otherwise false
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    // Check if email already exists in the database (for registration)
    public boolean isEmailTaken(String email) {
        EntityManager em = emf.createEntityManager();
        try {
            String query = "SELECT COUNT(u) FROM User u WHERE u.email = :email";
            TypedQuery<Long> typedQuery = em.createQuery(query, Long.class);
            typedQuery.setParameter("email", email);

            Long count = typedQuery.getSingleResult();
            return count > 0; // Return true if email exists
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    // Get a user by email (for fetching user details, etc.)
    public User getUserByEmail(String email) {
        EntityManager em = emf.createEntityManager();
        try {
            String query = "SELECT u FROM User u WHERE u.email = :email";
            TypedQuery<User> typedQuery = em.createQuery(query, User.class);
            typedQuery.setParameter("email", email);

            return typedQuery.getResultList().stream().findFirst().orElse(null); // Return the user or null
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            em.close();
        }
    }
}
