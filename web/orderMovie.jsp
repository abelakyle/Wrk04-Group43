<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/stylish.css">
        <title>Order History</title>
    </head>

    <jsp:include page="header.jsp"/>

    <body>
        <% DBManager manager = (DBManager) session.getAttribute("manager");
            String[] selectedMovieTitles = request.getParameterValues("selected");
            String submitType = request.getParameter("submitType");
            String addToCart = request.getParameter("addToCart");

            if (selectedMovieTitles == null && addToCart != null) {
                response.sendRedirect("cart.jsp");
            } else if (selectedMovieTitles != null && submitType == null) {
        %>
        <h2>My Order <h2>
                <table align="center">
                    <tr>
                        <td><b>Name</b></td>
                        <td><b>Genre</b></td>
                        <td><b>Price</b></td>
                    </tr>
                    <%
                        double price = 0;
                        for (int i = 0; i < selectedMovieTitles.length; i++) {
                            Movie movie = manager.findMovie(selectedMovieTitles[i]);
                            price += movie.getPrice();
                    %>	
                    <tr>
                        <td> <% out.print(movie.getTitle()); %> </td>
                        <td> <% out.print(movie.getGenre()); %> </td>
                        <td> <% out.print(movie.getPrice()); %> </td>
                    </tr>
                    <%
                        }

                    %>


                    <%
                    %>
                    <form action="orderMovieAction.jsp" style="margin:auto;">
                        <table align="center">	
                            <tr><td>Quantity</td><td><input value ="<%= selectedMovieTitles.length%>" name="quantity" readonly></td></tr>
                            <tr><td>Date processed</td><td><input value="<%= (new java.util.Date()).toLocaleString()%>" name="date" readonly></td></tr>
                            <tr><td>ETA</td><td><input value="<%= (new java.util.Date()).toLocaleString()%>" name="eta" readonly></td></tr>
                            <tr><td>Price</td><td><input value="<%= price%>" name="price" readonly></td></tr> 
                            <tr><td>Address</td><td><input type="text" name="address"></td></tr>                
                            <tr><td>City</td><td><input type="text" name="city"></td></tr>  
                            <tr><td>State</td><td><input type="text" name="state"></td></tr>  
                            <tr><td>Postcode</td><td><input type="text" name="postcode"></td></tr> 
                            <input type="hidden" value="false" name="edited">
                            <tr><td><input type="radio" name="submitType" value ="save" checked="checked">Save
                                <input type="radio" name="submitType" value ="submit">Submit<td>
                        </table>
                        <p align="center">
                            <button align="centre" name="submit" type="submit">Ok</button>
                        </p>

                        <%} else if (submitType.equals("edit")) {
                            Order order = manager.findOrderByID(request.getParameter("orderID"));
                        %>
                        <h2>Edit Order <h2>
                                <form action="orderMovieAction.jsp" style="margin:auto;">
                                    <table align="center">	
                                        <tr><td>Quantity</td><td><input value ="<%= order.getQty()%>" name="quantity" readonly></td></tr>
                                        <tr><td>Date processed</td><td><input value="<%= order.getCreated()%>" name="date" readonly></td></tr>
                                        <tr><td>ETA</td><td><input value="<%= order.getEta()%>" name="eta" readonly></td></tr>
                                        <tr><td>Price</td><td><input value="<%= order.getPrice()%>" name="price" readonly></td></tr> 
                                        <tr><td>Address</td><td><input type="text" value="<%= order.getAddress()%>" name="address"></td></tr>                
                                        <tr><td>City</td><td><input type="text" value="<%= order.getCity()%>" name="city"></td></tr>  
                                        <tr><td>State</td><td><input type="text" value="<%= order.getState()%>" name="state"></td></tr>  
                                        <tr><td>Postcode</td><td><input type="text" value="<%= order.getPostcode()%>" name="postcode"></td></tr> 
                                        <hidden><input type="hidden" value="<%= order.getID()%>" name="id">
                                            <hidden><input type="hidden" value="true" name="edited">
                                                <tr><td><input type="radio" name="submitType" value ="save" checked>Save
                                                    <input type="radio" name="submitType" value ="submit">Submit<td>
                                                        </table>
                                                        <p align="center">
                                                            <button align="centre" name="submit" type="submit">Ok</button>
                                                        </p>
                                                        <% } else if (submitType.equals("cancel")) {
                                                                Order order = manager.findOrderByID(request.getParameter("orderID"));
                                                                manager.updateOrder(order.getID(), order.getQty(), order.getCreated(), order.getAddress(), order.getCity(), order.getState(), order.getPostcode(), order.getEta(), order.getPrice(), "cancelled");
                                                                response.sendRedirect("home.jsp");
                                                            }

                                                        %>
                                                        </body>
                                                        </html>
