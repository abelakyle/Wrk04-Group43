<%-- 
    Document   : index
    Created on : 18/04/2019, 12:57:20 PM
    Author     : carti
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" type="text/css" href="style/stylish.css">
                <title>Online Movie Store</title>
        </head>
        
        <jsp:include page="header.jsp"/>
        
        <body>
                <p><a href="register.jsp">Register</a></p>
                <p><a href="login.jsp">Login</a></p>
                <p><a href="searchMovie.jsp">Movie Catalogue</a></p>
                <p><a href="cart.jsp">Cart</a></p>
                <jsp:include page="/ConnServlet" flush="true" />
        </body>
</html>
