package com.upbank.dao;

import com.upbank.model.User;
import com.upbank.config.DatabaseConfig;
import jakarta.persistence.*;

public class UserDAO {
    private EntityManagerFactory emf = DatabaseConfig.getEntityManagerFactory();

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
}
