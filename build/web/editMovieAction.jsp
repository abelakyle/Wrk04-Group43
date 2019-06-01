<%-- 
    Document   : editMovieAction.jsp
    Created on : 01/06/2019, 4:41:49 PM
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
    </head>
    <body>
        <%
            DBManager manager = (DBManager) session.getAttribute("manager");
            
            String id = request.getParameter("ID");
            String title = request.getParameter("title");
            String genre = request.getParameter("genre");
            String price = request.getParameter("price");
            String stock = request.getParameter("stock");

            boolean checkTitle = (title.length() <= 20);
            boolean checkPrice = price.matches("[0-9]+(\\.[0-9][0-9]?)?");
            boolean checkStock = stock.matches("[0-9]*$");

            if (id == null || title == null || genre == null || price == null || stock == null) {
                session.setAttribute("errorEdit", "Please fill out all details5");
                session.setAttribute("ID", id);
                response.sendRedirect("editMovie.jsp");
            } else if (id.isEmpty() ||title.isEmpty() || genre.isEmpty() || price.isEmpty() || stock.isEmpty()) {
                session.setAttribute("errorEdit", "Please fill out all details");
                session.setAttribute("ID", id);
                response.sendRedirect("editMovie.jsp");
            } else if (!checkTitle) {
                session.setAttribute("errorEdit", "The movie title must only contain 40 characters maximum");
                session.setAttribute("ID", id);
                response.sendRedirect("editMovie.jsp");
            } else if (!checkPrice) {
                session.setAttribute("errorEdit", "The price format has not been entered correctly");
                session.setAttribute("ID", id);
                response.sendRedirect("editMovie.jsp");
            } else if (price.length() > 9) {
                session.setAttribute("errorEdit", "The price value can only contain maximum 9 digits.");
                session.setAttribute("ID", id);
                response.sendRedirect("editMovie.jsp");
            } else if (!checkStock) {
                session.setAttribute("errorEdit", "The stock value must only contain numbers");
                session.setAttribute("ID", id);
                response.sendRedirect("editMovie.jsp");
            } else if (stock.length() > 9) {
                session.setAttribute("errorEdit", "The stock value can only contain maximum 9 digits.");
                session.setAttribute("ID", id);
                response.sendRedirect("editMovie.jsp");
            } else {
                session.setAttribute("successEdit", "The movie has been successfully added to the database");
                manager.updateMovie(Integer.parseInt(id), title, genre, Double.parseDouble(price), Integer.parseInt(stock));
                response.sendRedirect("searchMovie.jsp");
            }
        %>
    </body>
</html>
