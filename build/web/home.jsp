<%-- 
    Document   : home
    Created on : 28/05/2019, 7:29:51 PM
    Author     : Kyle_2
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" type="text/css" href="style/stylish.css">
            <title>Home</title>
        </head>

        <jsp:include page="header.jsp"/>
        
        <body>
                <p><a href="myAccount.jsp">My Account</a></p> 
                <p><a href="searchMovie.jsp">Movie Catalogue</a></p>
                <p><a href="cart.jsp">Cart</a></p>
                <p><a href="orderHistory.jsp">Order History</a></p>
        </body> 
        
</html>
