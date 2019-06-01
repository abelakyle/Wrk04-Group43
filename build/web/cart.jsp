<%-- 
    Document   : cart
    Created on : 28/05/2019, 7:24:55 PM
    Author     : Kyle_2
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
        <title>List of movies</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
	<% DBManager manager = (DBManager) session.getAttribute("manager"); 
	Movie[] movies = (Movie[]) manager.getAllMovies();
	Order[] orders = (Order[]) manager.getSavedOrder();
	%>
       <h2 align="center">Movie List</h2>
	<form action="orderMovie.jsp" style="margin:auto;">
	<table align="center">	
            <tr>
                <td><b>Name</b></td>
                <td><b>Genre</b></td>
                <td><b>Price</b></td>
		<td><b>Add to cart</b></td>
            </tr>
        <%

                for (int i = 0; i < movies.length; i++) { %>
                <tr>
                    <td> <% out.print(movies[i].getTitle()); %> </td>
                    <td> <% out.print(movies[i].getGenre()); %> </td>
                    <td> <% out.print(movies[i].getPrice()); %> </td>
		    
		    <td><input type="checkbox" name="selected" value="${movies[i].title}"/></td>
                </tr>
		
                <%
                }
		%>
		</table>
		<tr><p align="center"><button type="submit" name="addToCart" value="true">Add to cart</button></p></tr>
	</form>
	<h2 align="center">Saved Orders</h2>
	<form action="orderMovie.jsp" style="margin:auto;">
	<table align="center">	
            <tr>
                <td><b>ID</b></td>
                <td><b>Quantity</b></td>
                <td><b>Date Processed</b></td>
		<td><b>Address</b></td>
		<td><b>City</b></td>
		<td><b>State</b></td>
		<td><b>Postcode</b></td>
		<td><b>ETA</b></td>
		<td><b>Price</b></td>
            </tr>
        <%

                for (int i = 0; i < orders.length; i++) { %>
                <tr>
                    <td> <% out.print(orders[i].getID()); %> </td>
                    <td> <% out.print(orders[i].getQty()); %> </td>
                    <td> <% out.print(orders[i].getCreated()); %> </td>
		    <td> <% out.print(orders[i].getAddress()); %> </td>
                    <td> <% out.print(orders[i].getCity()); %> </td>
		    <td> <% out.print(orders[i].getState()); %> </td>
		    <td> <% out.print(orders[i].getPostcode()); %> </td>
		    <td> <% out.print(orders[i].getEta()); %> </td>
		    <td> <% out.print(orders[i].getPrice()); %> </td>
		</tr>    
		
		    <tr><td><button type="submit" name="submitType" value="edit">Edit
			<button type="submit" name="submitType" value ="cancel">Cancel<td>
			<hidden ><input type="hidden" value="<%=orders[i].getID()%>" name="orderID">
		</tr>
                <%
                }
		%>
		</table>
	</form>

        </tr>
    </body>
</html>
