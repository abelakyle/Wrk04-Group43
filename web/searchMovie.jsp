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
        <link rel="stylesheet" type="text/css" href="style/stylish.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Find Movie</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <%
            if (session.getAttribute("successEdit") != null) { %>
        <div class="alert alert-success">
            <strong>Success!</strong> You have successfully saved changes to the movie in the database.
        </div>
            <%
                session.setAttribute("successEdit", null);
            } %>
        <p>
        <table align="center" width="700px">
            <% 
                User userLogin = (User) session.getAttribute("userLogin");
                
                if (userLogin != null) { %>
            <tr><td align="center"><h3><a href='createMovie.jsp'>Add Movie</a></h3></td></tr>
            <% } %>
            <tr>
                <td>
                    <form class="search" name="search" action="searchMovie.jsp" style="margin:auto;" method="POST">
                        <input type="text" name="title" placeholder="Search movie by title...">
                        <select name="genre">
                            <option disabled selected value> -- select genre -- </option>
                            <option value="Action">Action</option>
                            <option value="Adventure">Adventure</option>
                            <option value="Comedy">Comedy</option>
                            <option value="Crime">Crime</option>
                            <option value="Drama">Drama</option>
                            <option value="Fantasy">Fantasy</option>
                            <option value="Historical">Historical</option>
                            <option value="Horror">Horror</option>
                            <option value="Romance">Romance</option>
                            <option value="Science Fiction">Science Fiction</option>
                            <option value="Thriller">Thriller</option>
                        </select>
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </td>
            </tr>
        </table><p>
        <%  
            DBManager manager = (DBManager) session.getAttribute("manager");

            String title = request.getParameter("title");
            String genre = request.getParameter("genre");

            Movie[] movies = manager.findMovies(title, genre);
            
            if (movies != null && movies.length > 0) {
        %>
        <div align="center">
            <table border="1" cellpadding="5">
                <tr>
                    <td><b>ID</b></td>
                    <td><b>Title</b></td>
                    <td><b>Genre</b></td>
                    <td><b>Price</b></td>
                    <td><b>Stock</b></td>
                    <%
                        if (userLogin != null) {
                            out.println("<td><b>Actions</b></td>");
                        } 
                        
                        out.println("</tr>");
                        
                        for (int i = 0; i < movies.length; i++) {
                    %>
                <tr>
                    <td> <%= movies[i].getID()%> </td>
                    <td> <%= movies[i].getTitle()%> </td>
                    <td> <%= movies[i].getGenre()%> </td>
                    <td> <%= movies[i].getPrice()%> </td>
                    <td> <%= movies[i].getStock()%> </td>
                    <%
                            if (userLogin != null) {%>
                    <td>
                        <form action="editMovie.jsp" method="POST">
                            <button type="submit" name="ID" value="<%= movies[i].getID()%>">Edit</button>
                        </form>
                        <form action="deleteMovie.jsp" method="POST">
                            <button type="submit" name="ID" value="<%= movies[i].getID()%>">Delete</button>
                        </form>
                    </td>
                    <%      }

                            out.print("</tr>");

                            if ((i + 1) == movies.length) {
                                out.print("</table>");
                                out.print("</div>");
                            }     
                        }
                    } else if (userLogin != null) { %>
                <div class="alert-danger">
                    <strong>Warning!</strong> 
                    No movies found. Click <a href="createMovie.jsp">here</a> to create a movie in the database.
                </div> 
                <%
                    } else { %>
                <div class="alert-danger">
                    <strong>Warning!</strong> 
                    No movies found. Click <a href="searchMovie.jsp">here</a> to view all movies in the database.
                </div> 
        <%          }%>
    </body>
</html>
