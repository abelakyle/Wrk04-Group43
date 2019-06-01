<%-- 
    Document   : findMovieAction
    Created on : 31/05/2019, 6:48:44 AM
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
        <title>Edit User</title>
        <link rel="stylesheet" type="text/css" href="style/stylish.css">
    </head>

    <jsp:include page="header.jsp"/>

    <body>
        <%
            DBManager manager = (DBManager) session.getAttribute("manager");
            int id = Integer.parseInt(request.getParameter("ID"));
            
            Movie movie = manager.findMovie(id);

            if (movie == null) { %>
        <div class="alert alert-danger">
            <p><strong>Error!</strong> No Movie found!
                Please go back to <a href="searchMovie.jsp">Movie List</a> .
        </div>
        <% } else {
        %>


        <form action="deleteMovie.jsp" method="POST">
            <table>
                <h3>Are you sure you want to delete the following Movie?</h3>
                <tr><td>Movie ID</td><td><input type="text" name="ID" value="<%=id%>" readonly="readonly"></td>
                <tr><td>Title</td><td><input type="text" value="<%= movie.getTitle()%>" name="title" readonly="readonly"></td></tr>
                <tr><td>Genre</td><td><input type="text" value="<%= movie.getGenre()%>" name="genre" readonly="readonly"></td></tr>                
                <tr><td>Price</td><td><input type="text" value="<%= movie.getPrice()%>" name="price" readonly="readonly"></td></tr>   
                <tr><td>Stock</td><td><input type="text" value="<%= movie.getStock()%>" name="stock" readonly="readonly"></td></tr>
                <tr><td><input type="hidden" value="updated" name="updated"></td>
                    <td><input class="button" type="submit" value="Delete"> 
                        &emsp;
                        <button class="button" type="button" onclick="location.href = 'searchMovie.jsp'">Cancel</button>
                    </td>
                </tr>
            </table>
        </form>

        <%
            if (request.getParameter("updated") != null) {
                manager.deleteMovie(movie.getID());

        %>
        <div class="alert-success">
            <strong> Successfully deleted! </strong>
            Click <a href="searchMovie.jsp">here</a> to go back
        </div>
        <% 
            }
            }
        %>
    </body>
</html>