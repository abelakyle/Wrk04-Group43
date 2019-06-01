<%-- 
    Document   : editMovie
    Created on : 31/05/2019, 5:42:40 PM
    Author     : Liam
--%>

<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Movie</title>
        <link rel="stylesheet" type="text/css" href="style/stylish.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <%
            User user = (User) session.getAttribute("userLogin");

            if (user == null) { %>
        <div class="alert alert-danger">
            <strong>Error!</strong> You must login to add movies to the database. 
            Click <a href="login.jsp">here</a> to login.
        </div>
        <%
        } else {
            DBManager manager = (DBManager) session.getAttribute("manager");
            Movie movie;

            if (request.getParameter("ID") == null) {
                movie = manager.findMovie(Integer.parseInt(session.getAttribute("ID").toString()));
            } else {
                movie = manager.findMovie(Integer.parseInt(request.getParameter("ID")));
            }

            if (session.getAttribute("errorEdit") != null) {%>
        <div class="alert alert-danger">
            <strong>Error!</strong> <%= session.getAttribute("errorEdit")%>
        </div>    
        <% session.setAttribute("errorEdit", null);
            }%>
        <h1>Edit Movie</h1>        
        <form action="editMovieAction.jsp" method="POST">
            <table>
                <tr><td>Movie ID</td><td><input type="hidden" value="<%= movie.getID()%>" name="ID"><%= movie.getID()%></td></tr>
                <tr><td>Title</td><td><input type="text" value="<%= movie.getTitle()%>" name="title"></td></tr>
                <tr><td>Genre</td><td>
                        <select name="genre" value="<%= movie.getGenre()%>"> 
                            <option value="Action" <% if (movie.getGenre().equals("Action")) {
                                    out.print("selected value");
                                } %>>Action</option>
                            <option value="Adventure" <% if (movie.getGenre().equals("Adventure")) {
                                    out.print("selected value");
                                } %>>Adventure</option>
                            <option value="Comedy" <% if (movie.getGenre().equals("Comedy")) {
                                    out.print("selected value");
                                } %>>Comedy</option>
                            <option value="Crime" <% if (movie.getGenre().equals("Crime")) {
                                    out.print("selected value");
                                } %>>Crime</option>
                            <option value="Drama" <% if (movie.getGenre().equals("Drama")) {
                                    out.print("selected value");
                                } %>>Drama</option>
                            <option value="Fantasy" <% if (movie.getGenre().equals("Fantasy")) {
                                    out.print("selected value");
                                } %>>Fantasy</option>
                            <option value="Historical" <% if (movie.getGenre().equals("Historical")) {
                                    out.print("selected value");
                                } %>>Historical</option>
                            <option value="Horror" <% if (movie.getGenre().equals("Horror")) {
                                    out.print("selected value");
                                } %>>Horror</option>
                            <option value="Romance" <% if (movie.getGenre().equals("Romance")) {
                                    out.print("selected value");
                                } %>>Romance</option>
                            <option value="Science Fiction" <% if (movie.getGenre().equals("Science Fiction")) {
                                    out.print("selected value");
                                } %>>Science Fiction</option>
                            <option value="Thriller" <% if (movie.getGenre().equals("Thriller")) {
                                    out.print("selected value");
                                }%>>Thriller</option>
                        </select> 
                    </td></tr>                
                <tr><td>Price</td><td><input type="text" value="<%= movie.getPrice()%>" min="1" name="price"></td></tr>   
                <tr><td>Stock</td><td><input type="text" value="<%= movie.getStock()%>" name="stock"></td></tr>
                <tr><td></td>
                    <td><input class="button" type="submit" value="Save"> 
                        &emsp; 
                        <button class="button" type="button" onclick="location.href = 'searchMovie.jsp'" > Cancel </button>
                    </td>
                </tr>
            </table>
        </form>
        <% }%>
    </body>
</html>
