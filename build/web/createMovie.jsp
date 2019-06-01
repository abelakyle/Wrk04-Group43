<%-- 
    Document   : addMovie
    Created on : 31/05/2019, 3:03:17 AM
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
        <title>Add Movie</title>
    </head>
    <body>

        <jsp:include page="header.jsp"/>
        <%
            User user = (User) session.getAttribute("userLogin");

            if (user == null) {%>
        <div class="alert alert-danger">
            <strong>Error!</strong> You must login to add movies to the database. 
            Click <a href="login.jsp">here</a> to login.
        </div>
        <%
        } else {
            if (session.getAttribute("errorCreate") != null) {%>
        <div class="alert alert-danger">
            <strong>Error!</strong> <%= session.getAttribute("errorCreate")%>
        </div>    
        <%
            session.setAttribute("errorCreate", null);
        } else if (session.getAttribute("successCreate") != null) {%>
        <div class="alert alert-success">
            <strong>Success!</strong> <%= session.getAttribute("successCreate")%>
        </div>
        <%      session.setAttribute("successCreate", null);
                    } %>
        <form action="createMovieAction.jsp" method="POST">
            <table>
                <tr><td>Title</td><td><input type="text" name="title" autofocus></td></tr>
                <tr><td>Genre</td><td><select name="genre">
                            <option disabled selected value> -- select an option -- </option>
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
                        </select></td></tr>
                <tr><td>Price</td><td><input type="text" name="price"></td></tr>
                <tr><td>Stock</td><td><input type="text" name="stock"></td></tr>
                <tr>
                    <td><label for=""></label></td>
                    <td><br><input name="" type="submit" value="Add Movie">
                        &nbsp; 
                        <input type="reset">
                        &nbsp;
                        <button class="button" type="button" onclick="location.href = 'searchMovie.jsp'" > Cancel </button> 
                    </td>
                </tr>
            </table>
        </form>
        <% }%>
    </body>
</html>
