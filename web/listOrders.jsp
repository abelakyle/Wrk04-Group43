<%-- 
    Document   : listOrders
    Created on : 31/05/2019, 5:39:25 PM
    Author     : rober
--%>

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
    <center>
        <h1>Order History</h1>

        <table>
            <tr>
                <td><b>ID</b></td>
                <td><b>Quantity</b></td>
                <td><b>Date</b></td>
                <td><b>Address</b></td>
                <td><b>City</b></td>
                <td><b>State</b></td>
                <td><b>Postcode</b></td>
                <td><b>Processed</b></td>
                <td><b>Cost</b></td>
                <td><b>Status</b></td>

            </tr>
            <%
                try {
                    Order[] orders = (Order[]) session.getAttribute("orderHistory");

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
                <td> <% out.print(orders[i].getStatus()); %> </td>

            </tr>
            <%
                }
            } catch (Exception e) {
            %>

            <div class="alert alert-danger">
                <p><strong>Error!</strong> There are currently no orders to list. 
            </div>

            <%
                }
            %>
            </tr>
            </body>
            </html>
