package uts.isd.model.dao;

import java.sql.*;
import java.time.*;
import java.text.*;
import java.time.format.DateTimeFormatter;

import java.util.ArrayList;
import java.util.List;
import uts.isd.model.*;

public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public void addUser(String ID, String name, String email, String password, String phone) throws SQLException {
        String createQueryString = "insert into Users " + "values('" + ID + "','" + name + "','" + email + "','" + password + "','" + phone + "','Customer', 'true')";
        boolean recordCreated = st.executeUpdate(createQueryString) > 0;
        //might need testing whether record was created -check Master 
    }

    public void updateUser(String ID, String name, String email, String password, String phone, String position, Boolean status) throws SQLException {

        String createQueryString = "update users set name = '" + name + "', email= '" + email + "', password = '" + password + "', phone = '" + phone + "', position = '" + position + "', status = '" + status + "' where ID='" + ID + "'";
        st.executeUpdate(createQueryString);

        //might need testing whether record was update -check Master
    }

    public User findUser(String email, String password) throws SQLException {

        String createQueryString = "select * from users where email = '" + email + "' and password ='" + password + "'";
        ResultSet rs = st.executeQuery(createQueryString);

        boolean hasUser = rs.next();
        User userFromDB = null;

        if (hasUser) {
            String uID = rs.getString("ID");
            String uName = rs.getString("name");
            String uEmail = rs.getString("email");
            String uPassword = rs.getString("password");
            String uPhone = rs.getString("phone");
            Boolean status = Boolean.parseBoolean(rs.getString("status"));


            userFromDB = new User(uID, uName, uEmail, uPassword, uPhone, status);
        }
        rs.close();

        return userFromDB;

        //need to validate inputs?
        //if user !exist then return error or something
    }

    public void deleteUser(String ID) throws SQLException {
        //code for delete-operation

        String deleteQueryString = "delete from users where ID= '" + ID + "' ";
        boolean recordDeleted = st.executeUpdate(deleteQueryString) > 0;

        if (recordDeleted) {
            System.out.println("record deleted");
        } else {
            System.out.println("record not deleted");
        }
    }

    public User[] listAllUsers() throws SQLException {
        String sql = "SELECT * FROM users where id NOT LIKE '2%'";
        ResultSet resultSet = st.executeQuery(sql);

        ArrayList<User> usersDB = new ArrayList();

        while (resultSet.next()) {
            String id = resultSet.getString("id");
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String password = resultSet.getString("password");
            String phone = resultSet.getString("phone");
            Boolean status = Boolean.parseBoolean(resultSet.getString("status"));

            User user = new User(id, name, email, password, phone, status);
            usersDB.add(user);
        }

        resultSet.close();

        return usersDB.toArray(new User[usersDB.size()]);
    }

    public User findUserById(String search) throws SQLException {
        String sql = "SELECT * FROM USERS WHERE id = '" + search + "'";
        ResultSet resultSet = st.executeQuery(sql);
        User user = null;

        if (resultSet.next()) {
            String id = resultSet.getString("id");
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String password = resultSet.getString("password");
            String phone = resultSet.getString("phone");
            Boolean status = Boolean.parseBoolean(resultSet.getString("status"));

            user = new User(id, name, email, password, phone, status);
        }

        resultSet.close();

        return user;
    }

    public User[] findUserByIdOrName(String search) throws SQLException {
        String sql = "SELECT * FROM users WHERE id NOT LIKE '2%' AND (id LIKE '" + search + "%' OR name LIKE '" + search + "%' OR phone LIKE '" + search + "%')";
        ResultSet resultSet = st.executeQuery(sql);

        ArrayList<User> usersDB = new ArrayList();

        while (resultSet.next()) {
            String id = resultSet.getString("id");
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String password = resultSet.getString("password");
            String phone = resultSet.getString("phone");
            Boolean status = Boolean.parseBoolean(resultSet.getString("status"));

            User user = new User(id, name, email, password, phone, status);
            usersDB.add(user);
        }

        resultSet.close();

        return usersDB.toArray(new User[usersDB.size()]);
    }

    public boolean userExists(String search) throws SQLException {
        String sql = "SELECT * FROM users WHERE id NOT LIKE '2%' AND (id LIKE '" + search + "%' or name LIKE '" + search + "%' OR phone LIKE '" + search + "%')";

        ResultSet resultSet = st.executeQuery(sql);
        return resultSet.next();
    }

    //KYLES FUNCTIONS
    public String stampDate() {
        return LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

    public String stampTime() {
        return LocalTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss"));
    }

    public void createAccessLog(String userID, String loginDate, String loginTime, String logoutTime) throws SQLException {
        String createQueryString = "INSERT INTO ACCESS_LOG (user_id, login_date, login_time, logout_time)" + " values('" + userID + "','" + loginDate + "','" + loginTime + "','" + logoutTime + "')";
        boolean recordCreated = st.executeUpdate(createQueryString) > 0;

        if (recordCreated) {
            System.out.println("record created");
        } else {
            System.out.println("record not created");
        }
    }

    public ArrayList<Log> getAccessLog(String userID) throws SQLException {

        ArrayList<Log> logList = new ArrayList<Log>();

        String createQueryString = "select * from access_log where user_id = '" + userID + "'";
        ResultSet rs = st.executeQuery(createQueryString);

        while (rs.next()) {
            Log log = new Log();
            log.setLogID(rs.getInt(1));
            //log.setUserID(rs.getString(2));
            log.setLoginDate(rs.getString(3));
            log.setLoginTime(rs.getString(4));
            log.setLogoutTime(rs.getString(5));
            logList.add(log);
        }
        return logList;

    }

    public ArrayList<Log> getSearchedLog(String userID, String searchDate) throws SQLException {
        ArrayList<Log> logList = new ArrayList<Log>();

        String createQueryString = "select * from access_log where user_id = '" + userID + "' and login_date = '" + searchDate + "'";
        ResultSet rs = st.executeQuery(createQueryString);

        while (rs.next()) {
            Log log = new Log();
            log.setLogID(rs.getInt(1));
            //log.setUserID(rs.getString(2));
            log.setLoginDate(rs.getString(3));
            log.setLoginTime(rs.getString(4));
            log.setLogoutTime(rs.getString(5));
            logList.add(log);
        }
        return logList;
    }

    public void deleteLog(String eraseID) throws SQLException {
        String deleteQueryString = "delete from access_log where Log_ID = " + eraseID;
        st.executeUpdate(deleteQueryString);
    }

    public boolean logOwned(String eraseID, String userID) throws SQLException {
        String createQueryString = "select * from access_log where Log_ID = " + eraseID + " and User_ID ='" + userID + "'";
        ResultSet rs = st.executeQuery(createQueryString);
        return rs.next();
    }

    //LIAMS FUNCTION
    public void createMovie(int id, String title, String genre, double price, int stock) throws SQLException {
        System.out.println("" + price);
        String createQueryString = "INSERT INTO movies " + "VALUES(" + id + ",'" + title + "','" + genre + "'," + stock + "," + price + ")";
        st.executeUpdate(createQueryString);
    }
    
    // READ MOVIES
    // Find movie by ID
    public Movie findMovie(int id) throws SQLException {
        String createQueryString = "SELECT * FROM movies WHERE ID = " + id;
        ResultSet rs = st.executeQuery(createQueryString);
        
        if (rs.next()) {
            int uID = rs.getInt("ID");
            String uTitle = rs.getString("title");
            String uGenre = rs.getString("genre");
            double uPrice = rs.getDouble("price");
            int uStock = rs.getInt("stock");
            
            return new Movie(uID, uTitle, uGenre, uPrice, uStock);
        } else {
            return null;
        }
    }
    
    // Get all movies in DB
    public Movie[] getMovies() throws SQLException {
        String createQueryString = "SELECT * FROM movies";
        ResultSet rs = st.executeQuery(createQueryString);
        
        ArrayList<Movie> moviesFromDB = new ArrayList();
        
        while (rs.next()) {
            int uID = rs.getInt("ID");
            String uTitle = rs.getString("title");
            String uGenre = rs.getString("genre");
            double uPrice = rs.getDouble("price");
            int uStock = rs.getInt("stock");
            moviesFromDB.add(new Movie(uID, uTitle, uGenre, uPrice, uStock));
        }
        rs.close();
        
        return moviesFromDB.toArray(new Movie[moviesFromDB.size()]);
    }

    
    // Read movies by title & genre + validation
    public Movie[] findMovies(String title, String genre) throws SQLException {
        boolean hasTitle = (title != null && !title.isEmpty());
        boolean hasGenre = (genre != null && !genre.isEmpty());
        
        if (hasTitle && hasGenre) {
            return findMoviesByGenreAndTitle(title, genre);
        } else if (hasTitle && !hasGenre) {
            return findMoviesByTitle(title);
        } else if (!hasTitle && hasGenre) {
            return findMoviesByGenre(genre);
        } else {
            return getMovies();
        }
    }
    
    // Read movies by title only
    public Movie[] findMoviesByTitle(String title) throws SQLException {
        String createQueryString = "SELECT * FROM movies WHERE title LIKE '%"+ title + "%'";
        ResultSet rs = st.executeQuery(createQueryString);
        
        ArrayList<Movie> moviesFromDB = new ArrayList();
        
        while (rs.next()) {
            int uID = rs.getInt("ID");
            String uTitle = rs.getString("title");
            String uGenre = rs.getString("genre");
            double uPrice = rs.getDouble("price");
            int uStock = rs.getInt("stock");
            
            moviesFromDB.add(new Movie(uID, uTitle, uGenre, uPrice, uStock));
        }
        rs.close();

        return moviesFromDB.toArray(new Movie[moviesFromDB.size()]);
    }
    
    // Read movies by genre only
    public Movie[] findMoviesByGenre(String genre) throws SQLException {
        String createQueryString = "SELECT * FROM movies WHERE genre = '" + genre + "'";
        ResultSet rs = st.executeQuery(createQueryString);

        ArrayList<Movie> moviesFromDB = new ArrayList();
        
        while (rs.next()) {
            int uID = rs.getInt("ID");
            String uTitle = rs.getString("title");
            String uGenre = rs.getString("genre");
            double uPrice = rs.getDouble("price");
            int uStock = rs.getInt("stock");
            
            moviesFromDB.add(new Movie(uID, uTitle, uGenre, uPrice, uStock));
        }
        rs.close();

        return moviesFromDB.toArray(new Movie[moviesFromDB.size()]);
    }
    
    // Find all movies by string and title
    public Movie[] findMoviesByGenreAndTitle(String title, String genre) throws SQLException {
        String createQueryString = "SELECT * FROM movies WHERE title LIKE '%" + title + "%' and genre= '" + genre + "'";
        ResultSet rs = st.executeQuery(createQueryString);

        ArrayList<Movie> moviesFromDB = new ArrayList();

        while (rs.next()) {
            int uID = rs.getInt("ID");
            String uTitle = rs.getString("title");
            String uGenre = rs.getString("genre");
            double uPrice = rs.getDouble("price");
            int uStock = rs.getInt("stock");
            
            moviesFromDB.add(new Movie(uID, uTitle, uGenre, uPrice, uStock));
        }
        rs.close();

        return moviesFromDB.toArray(new Movie[moviesFromDB.size()]);
    }
    
    public boolean movieExists(String title) throws SQLException {
        String createQueryString = "SELECT * FROM movies WHERE title LIKE '%"+ title + "%'";
        ResultSet rs = st.executeQuery(createQueryString);
        return rs.next();
    }
    
    // UPDATE MOVIE        
    public void updateMovie(int id, String title, String genre, double price, int stock) throws SQLException {
        String createQueryString = "UPDATE movies SET title ='" + title + "', genre= '" + genre + "', price = " + price + ", stock = " + stock + " WHERE ID =" + id;
        st.executeUpdate(createQueryString);
    }
    
    // DELETE MOVIE
    public void deleteMovie(int id) throws SQLException {
        String deleteQueryString = "DELETE FROM movies WHERE ID = " + id;
        st.executeUpdate(deleteQueryString);
    }

    //ROB'S FUNCTIONS
    public Movie findMovie(String title) throws SQLException {
        String createQueryString = "select * from ISDUSER.MOVIES where title like '%" + title + "%'";

        ResultSet rs = st.executeQuery(createQueryString);

        boolean hasMovie = rs.next();
        Movie movieFromDB = null;

        if (hasMovie) {
            String uID = rs.getString("ID");
            String uTitle = rs.getString("title");
            String uGenre = rs.getString("genre");
            double uPrice = rs.getDouble("price");
            int uStock = rs.getInt("stock");

            movieFromDB = new Movie(Integer.parseInt(uID), uTitle, uGenre, uPrice, uStock);
        }
        rs.close();

        return movieFromDB;
    }

    public Movie[] getAllMovies() throws SQLException {
        String createQueryString = "SELECT * FROM ISDUSER.MOVIES";
        ResultSet rs = st.executeQuery(createQueryString);

        ArrayList<Movie> moviesFromDB = new ArrayList();

        while (rs.next()) {
            String uID = rs.getString("ID");
            String uTitle = rs.getString("title");
            String uGenre = rs.getString("genre");
            double uPrice = rs.getDouble("price");
            int uStock = rs.getInt("stock");

            moviesFromDB.add(new Movie(Integer.parseInt(uID), uTitle, uGenre, uPrice, uStock));
        }
        rs.close();
        return moviesFromDB.toArray(new Movie[moviesFromDB.size()]);
    }

    public void addOrder(String ID, String qty, String created, String address, String city, String state, String postcode, String eta, String price, String status) throws SQLException {
        //code for add-operation
        //INSERT INTO ISDUSER.MOVIES " + "values('" + ID + "','" + title + "','" + genre + "','" + price + "','" + stock + "')";
        String createQueryString = "insert into ISDUSER.ORDERS" + " values('" + ID + "', '" + qty + "', '" + created + "', '" + address + "', '" + city + "', '" + state + "', '" + postcode + "', '" + eta + "', '" + price + "', '" + status + "')";
        boolean recordCreated = st.executeUpdate(createQueryString) > 0;

        if (recordCreated) {
            System.out.println("record created");
        } else {
            System.out.println("record not created");
        }

    }
    //Add a order-data into the database

    public void updateOrder(String ID, String qty, String created, String address, String city, String state, String postcode, String eta, String price, String status) throws SQLException {

        String updateQueryString = "update ISDUSER.ORDERS set qty = '" + qty + "', created='" + created + "', address='" + address + "', city='" + city + "', state='" + state + "', postcode='" + postcode + "', eta='" + eta + "', price='" + price + "', status='" + status + "' where ID='" + ID + "'";
        st.executeUpdate(updateQueryString);

    }

    //Find order by ID in the database
    public Order findOrder(String ID, String date) throws SQLException {
        //setup the select sql query string
        String searchQueryString = "select * from ISDUSER.ORDERS where ID='" + ID + "' AND created='" + date + "'";
        //execute this query using the statement field
        //add the results to a ResultSet
        ResultSet rs = st.executeQuery(searchQueryString);
        //search the ResultSet for a student using the parameters
        boolean hasOrder = rs.next();
        Order orderFromDB = null;

        if (hasOrder) {

            String oID = rs.getString("ID");
            String oQty = rs.getString("qty");
            String oCreated = rs.getString("created");
            String oAddress = rs.getString("address");
            String oCity = rs.getString("city");
            String oState = rs.getString("state");
            String oPostcode = rs.getString("postcode");
            String oEta = rs.getString("eta");
            String oPrice = rs.getString("price");
            String oStatus = rs.getString("status");

            orderFromDB = new Order(oID, oQty, oCreated, oAddress, oCity, oState, oPostcode, oEta, oPrice, oStatus);
        }

        rs.close();
        // st.close();

        return orderFromDB;

    }
    //delete an order from the database

    public void deleteOrder(String ID) throws SQLException {
        //code for delete-operation
        String deleteQueryString = "delete from Orders where ID= '" + ID + "' ";
        boolean recordDeleted = st.executeUpdate(deleteQueryString) > 0;

        if (recordDeleted) {
            System.out.println("record deleted");
        } else {
            System.out.println("record not deleted");
        }
    }

    public Order[] getSavedOrder() throws SQLException {
        String searchQueryString = "select * from ISDUSER.ORDERS where status='saved'";
        ResultSet rs = st.executeQuery(searchQueryString);
        ArrayList<Order> ordersFromDB = new ArrayList();
        //search the ResultSet for a student using the parameters
        //boolean hasOrder = rs.next();

        while (rs.next()) {

            String oID = rs.getString("ID");
            String oQty = rs.getString("qty");
            String oCreated = rs.getString("created");
            String oAddress = rs.getString("address");
            String oCity = rs.getString("city");
            String oState = rs.getString("state");
            String oPostcode = rs.getString("postcode");
            String oEta = rs.getString("eta");
            String oPrice = rs.getString("price");
            String oStatus = rs.getString("status");

            ordersFromDB.add(new Order(oID, oQty, oCreated, oAddress, oCity, oState, oPostcode, oEta, oPrice, oStatus));
        }

        rs.close();
        // st.close();
        return ordersFromDB.toArray(new Order[ordersFromDB.size()]);
    }

    public Order[] getOrderHistory() throws SQLException {
        String searchQueryString = "select * from ISDUSER.ORDERS";
        ResultSet rs = st.executeQuery(searchQueryString);
        ArrayList<Order> ordersFromDB = new ArrayList();
        //search the ResultSet for a student using the parameters
        boolean hasOrder = rs.next();

        while (rs.next()) {

            String oID = rs.getString("ID");
            String oQty = rs.getString("qty");
            String oCreated = rs.getString("created");
            String oAddress = rs.getString("address");
            String oCity = rs.getString("city");
            String oState = rs.getString("state");
            String oPostcode = rs.getString("postcode");
            String oEta = rs.getString("eta");
            String oPrice = rs.getString("price");
            String oStatus = rs.getString("status");

            ordersFromDB.add(new Order(oID, oQty, oCreated, oAddress, oCity, oState, oPostcode, oEta, oPrice, oStatus));
        }
        rs.close();
        // st.close();
        return ordersFromDB.toArray(new Order[ordersFromDB.size()]);

    }

    public Order[] findOrders(String ID, String date) throws SQLException {
        String createQueryString = "SELECT * FROM ISDUSER.ORDERS WHERE id ='" + ID + "' and created= '" + date + "'";
        ResultSet rs = st.executeQuery(createQueryString);

        ArrayList<Order> ordersFromDB = new ArrayList();

        boolean hasOrder = rs.next();

        if (hasOrder) {

            String oID = rs.getString("ID");
            String oQty = rs.getString("qty");
            String oCreated = rs.getString("created");
            String oAddress = rs.getString("address");
            String oCity = rs.getString("city");
            String oState = rs.getString("state");
            String oPostcode = rs.getString("postcode");
            String oEta = rs.getString("eta");
            String oPrice = rs.getString("price");
            String oStatus = rs.getString("status");

            ordersFromDB.add(new Order(oID, oQty, oCreated, oAddress, oCity, oState, oPostcode, oEta, oPrice, oStatus));
        }
        rs.close();
        // st.close();
        return ordersFromDB.toArray(new Order[ordersFromDB.size()]);
    }

    public Order[] findOrdersByID(String ID) throws SQLException {
        String createQueryString = "SELECT * FROM ISDUSER.ORDERS WHERE id ='" + ID + "'";
        ResultSet rs = st.executeQuery(createQueryString);

        ArrayList<Order> ordersFromDB = new ArrayList();

        boolean hasOrder = rs.next();

        if (hasOrder) {

            String oID = rs.getString("ID");
            String oQty = rs.getString("qty");
            String oCreated = rs.getString("created");
            String oAddress = rs.getString("address");
            String oCity = rs.getString("city");
            String oState = rs.getString("state");
            String oPostcode = rs.getString("postcode");
            String oEta = rs.getString("eta");
            String oPrice = rs.getString("price");
            String oStatus = rs.getString("status");

            ordersFromDB.add(new Order(oID, oQty, oCreated, oAddress, oCity, oState, oPostcode, oEta, oPrice, oStatus));
        }
        rs.close();
        // st.close();
        return ordersFromDB.toArray(new Order[ordersFromDB.size()]);
    }

    public Order findOrderByID(String ID) throws SQLException {
        String createQueryString = "SELECT * FROM ISDUSER.ORDERS WHERE id ='" + ID + "'";
        ResultSet rs = st.executeQuery(createQueryString);

        Order orderFromDB = null;

        boolean hasOrder = rs.next();

        if (hasOrder) {

            String oID = rs.getString("ID");
            String oQty = rs.getString("qty");
            String oCreated = rs.getString("created");
            String oAddress = rs.getString("address");
            String oCity = rs.getString("city");
            String oState = rs.getString("state");
            String oPostcode = rs.getString("postcode");
            String oEta = rs.getString("eta");
            String oPrice = rs.getString("price");
            String oStatus = rs.getString("status");

            orderFromDB = new Order(oID, oQty, oCreated, oAddress, oCity, oState, oPostcode, oEta, oPrice, oStatus);
        }
        rs.close();
        // st.close();
        return orderFromDB;
    }

    public Order[] findOrdersByDate(String date) throws SQLException {
        String createQueryString = "SELECT * FROM ISDUSER.ORDERS WHERE created = '" + date + "'";
        ResultSet rs = st.executeQuery(createQueryString);

        ArrayList<Order> ordersFromDB = new ArrayList();

        boolean hasOrder = rs.next();

        if (hasOrder) {

            String oID = rs.getString("ID");
            String oQty = rs.getString("qty");
            String oCreated = rs.getString("created");
            String oAddress = rs.getString("address");
            String oCity = rs.getString("city");
            String oState = rs.getString("state");
            String oPostcode = rs.getString("postcode");
            String oEta = rs.getString("eta");
            String oPrice = rs.getString("price");
            String oStatus = rs.getString("status");

            ordersFromDB.add(new Order(oID, oQty, oCreated, oAddress, oCity, oState, oPostcode, oEta, oPrice, oStatus));
        }
        rs.close();
        // st.close();
        return ordersFromDB.toArray(new Order[ordersFromDB.size()]);
    }

    //SEANS FUNCTION
    public void addStaff(String ID, String name, String email, String password, String phone, String position) throws SQLException {
        String createQueryString = "insert into Users " + "values('" + ID + "','" + name + "','" + email + "','" + password + "','" + phone + "','" + position + "', 'true')";
        boolean recordCreated = st.executeUpdate(createQueryString) > 0;
    }

    public void updateStaff(String ID, String name, String email, String password, String phone, String position) throws SQLException {

        String createQueryString = "update users set name = '" + name + "', email= '" + email + "', password = '" + password + "', phone = '" + phone + "', position = '" + position + "', status = 'true' where ID='" + ID + "'";
        st.executeUpdate(createQueryString);

    }

    public User findStaff(String email, String password) throws SQLException {

        String createQueryString = "select * from users where email = '" + email + "' and password ='" + password + "'";
        ResultSet rs = st.executeQuery(createQueryString);

        boolean hasStaff = rs.next();
        User userFromDB = null;

        if (hasStaff) {
            String sID = rs.getString("ID");
            String sName = rs.getString("name");
            String sEmail = rs.getString("email");
            String sPassword = rs.getString("password");
            String sPhone = rs.getString("phone");
            String sPosition = rs.getString("position");

            userFromDB = new User(sID, sName, sEmail, sPassword, sPhone, sPosition);
        }
        rs.close();

        return userFromDB;

        //need to validate inputs?
        //if user !exist then return error or something
    }

    public User[] listAllStaffs() throws SQLException {
        String sql = "SELECT * FROM users where id LIKE '2%'";
        ResultSet resultSet = st.executeQuery(sql);

        ArrayList<User> usersDB = new ArrayList();

        while (resultSet.next()) {
            String id = resultSet.getString("id");
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String password = resultSet.getString("password");
            String phone = resultSet.getString("phone");
            String position = resultSet.getString("position");

            User user = new User(id, name, email, password, phone, position);
            usersDB.add(user);
        }

        resultSet.close();

        return usersDB.toArray(new User[usersDB.size()]);
    }

    public User findStaffById(String search) throws SQLException {
        String sql = "SELECT * FROM USERS WHERE id = '" + search + "'";
        ResultSet resultSet = st.executeQuery(sql);
        User user = null;

        if (resultSet.next()) {
            String id = resultSet.getString("id");
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String password = resultSet.getString("password");
            String phone = resultSet.getString("phone");
            String position = resultSet.getString("position");

            user = new User(id, name, email, password, phone, position);

        }

        resultSet.close();

        return user;
    }

    public User[] findStaffByIdOrName(String search) throws SQLException {
        String sql = "SELECT * FROM users WHERE id NOT LIKE '2%' AND (id LIKE '" + search + "%' OR name LIKE '" + search + "%' OR position LIKE '" + search + "%')";
        ResultSet resultSet = st.executeQuery(sql);

        ArrayList<User> usersDB = new ArrayList();

        while (resultSet.next()) {
            String id = resultSet.getString("id");
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String password = resultSet.getString("password");
            String phone = resultSet.getString("phone");
            String position = resultSet.getString("position");

            User user = new User(id, name, email, password, phone, position);
            usersDB.add(user);
        }

        resultSet.close();

        return usersDB.toArray(new User[usersDB.size()]);
    }

    public boolean staffExists(String search) throws SQLException {
        String sql = "SELECT * FROM users WHERE id LIKE '2%' AND (name LIKE '" + search + "%' or position LIKE '" + search + "%' OR phone LIKE '" + search + "%')";

        ResultSet resultSet = st.executeQuery(sql);
        return resultSet.next();
    }
}
