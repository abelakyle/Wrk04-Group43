<%-- 
    Document   : createActionMovie2
    Created on : 01/06/2019, 5:59:52 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            DBManager manager = (DBManager) session.getAttribute("manager");

            String title = request.getParameter("title");
            String genre = request.getParameter("genre");
            String price = request.getParameter("price");
            String stock = request.getParameter("stock");

            boolean checkTitle = (title.length() <= 20);
            boolean checkPrice = price.matches("[0-9]+(\\.[0-9][0-9]?)?");
            boolean checkStock = stock.matches("[0-9]*$");

            if (title == null || genre == null || price == null || stock == null) {
                session.setAttribute("errorCreate", "Please fill out all details");
                response.sendRedirect("createMovie.jsp");
            } else if (title.isEmpty() || genre.isEmpty() || price.isEmpty() || stock.isEmpty()) {
                session.setAttribute("errorCreate", "Please fill out all details");
                response.sendRedirect("createMovie.jsp");
            } else if (!checkTitle) {
                session.setAttribute("errorCreate", "The movie title must only contain 40 characters maximum");
                response.sendRedirect("createMovie.jsp");
            } else if (!checkPrice) {
                session.setAttribute("errorCreate", "The price format has not been entered correctly");
                response.sendRedirect("createMovie.jsp");
            } else if (price.length() > 9) {
                session.setAttribute("errorCreate", "The price value can only contain maximum 9 digits.");
                response.sendRedirect("createMovie.jsp");
            } else if (!checkStock) {
                session.setAttribute("errorCreate", "The stock value must only contain numbers");
                response.sendRedirect("createMovie.jsp");
            } else if (stock.length() > 9) {
                session.setAttribute("errorCreate", "The stock value can only contain maximum 9 digits.");
                response.sendRedirect("createMovie.jsp");
            } else {
                int id = new Random().nextInt(99999);
                manager.createMovie(id, title, genre, Double.parseDouble(price), Integer.parseInt(stock));
                Movie movie = manager.findMovie(id);

                if (movie != null) {
                    session.setAttribute("successCreate", "The movie has been successfully added to the database");
                    response.sendRedirect("createMovie.jsp");
                } else {
                    session.setAttribute("errorCreate", "The movie could not be added to the database.");
                    response.sendRedirect("createMovie.jsp");
                }
            }
        %>
    </body>
</html>
