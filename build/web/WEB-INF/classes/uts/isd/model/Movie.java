package uts.isd.model;

import java.io.Serializable;

public class Movie implements Serializable {
    
    // Movie variables
    private int ID;
    private String title;
    private String genre;
    private double price;
    private int stock;
    
    // Constructors to create movie object
    public Movie() { }
    
    public Movie(int ID, String title, String genre, double price, int stock) {
        this.ID = ID;
        this.title = title;
        this.genre = genre;
        this.price = price;
        this.stock = stock;
    }
    
    // Update functions
    public void updateDetails(int ID, String title, String genre, double price, int stock) {
        this.ID = ID;
        this.title = title;
        this.genre = genre;
        this.price = price;
        this.stock = stock;
    }
    
    // Get & Set functions
    public int getID() {
        return ID;
    }
    
    public void setID(int ID) {
        this.ID = ID;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getGenre() {
        return genre;
    }
    
    public void setGenre(String genre) {
        this.genre = genre;
    }
    
    public double getPrice() {
        return price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }
    
    public int getStock() {
        return stock;
    }
    
    public void setStock(int stock) {
        this.stock = stock;
    }
    
    public void removeStock() {
        this.stock = (this.stock - 1);
    }
    
    public void removeStock(int stock) {
        this.stock = (this.stock - stock);
    }
    
    // Boolean functions
    public boolean matchID(int ID) {
        return this.ID == ID;
    }

    public boolean matchTitle(String title) {
        return this.title.equals(title);
    }
    
    public boolean matchGenre(String genre) {
        return this.genre.equals(genre);
    }
    
    // Default toString override
    @Override
    public String toString() {
        return title;
    }
}
