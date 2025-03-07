package com.mycompany.shopster.entities;

public class Item {
    private String name;
    private int quantity;

    // Add relevant fields, constructors, getters, and setters

    public Item(String name, int quantity) {
        this.name = name;
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public int getQuantity() {
        return quantity;
    }
}
