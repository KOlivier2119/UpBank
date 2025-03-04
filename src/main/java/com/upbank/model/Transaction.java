package com.upbank.model;

import java.util.Date;

public class Transaction {
    private String type;
    private double amount;
    private Date date;

    public Transaction(String type, double amount, Date date) {
        this.type = type;
        this.amount = amount;
        this.date = date;
    }

    // Getters and Setters
    public String getType() {
        return type;
    }

    public double getAmount() {
        return amount;
    }

    public Date getDate() {
        return date;
    }
}