package uts.isd.model;

import java.io.Serializable;

public class User implements Serializable {

    private String ID;
    private String name;
    private String email;
    private String password;   
    private String phone;
    private String position;
    private boolean status;

    public User() { }
    
    public User(String ID) {
        this.ID = ID;
    }
    
    public User(String ID, String name, String email, String password, String phone) {
        this(name, email , password, phone);
        this.ID = ID;
        this.status = true;
        this.position = "Customer";
    }
    
    public User(String name, String email, String password, String phone) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.status = true;
    }
    
    public User(String ID, String name, String email, String password, String phone, String position) {
        this.ID = ID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.position = position;
        this.status = true;
    }
    
    public User(String ID, String name, String email, String password, String phone, Boolean status) {
        this.ID = ID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.position = "Customer";
        this.status = status;
    }
    
    public void updateDetails(String ID, String name, String email, String password, String phone){
        this.ID = ID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
    }
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public boolean getStatus() {
        return status;
    }
    
    public void setStatus(Boolean status) {
        this.status = status;
    }
    
    public String getPosition() {
        return position;
    }
     
    public void setPosition(String position) {
        this.position = position;
    }
    
    public boolean matchPassword(String password){
        return this.password.equals(password);
    }
    
    public boolean matchId(String ID){
        return this.ID.equals(ID);
    }
    
    public boolean checkDetails(String ID, String password){
        return matchId(ID) && matchPassword(password);
    }

    @Override
    public String toString() {
        return name;
    }
    
    public boolean isAdmin() {
        return (Integer.parseInt(ID)/100000) == 2;
    }
    
}
