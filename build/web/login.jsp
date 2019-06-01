<%-- 
    Document   : login
    Created on : 18/04/2019, 1:00:58 PM
    Author     : carti
--%>

<%@page import="uts.isd.model.User"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" type="text/css" href="style/stylish.css">
                <title>Log In</title>
                
        </head>
        
        
        <jsp:include page="header.jsp"/>
        
        <body>
                <h2>Enter your details to login: <span class="error"><c:if test="${existErr!=null}"><span class="error"><c:out value="${existErr}"/></span></c:if></span></h2>
                <form action="loginAction.jsp" method="POST">
                        <table>
                                <tr><td>Email</td><td><input type="text" name="email"></td></tr>
                                <tr><td>Password</td><td><input type="password" name="password"></td></tr>
                                <tr>
                                    <td><label for=""></label></td>
                                    <td><input name="" type="submit" value="Log In"></td>
                                </tr>
                        <table>
                </form>
                        ${existErr = null}
               
        </body> 
</html>
