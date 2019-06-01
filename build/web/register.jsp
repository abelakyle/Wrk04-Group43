<%-- 
    Document   : register
    Created on : 18/04/2019, 1:02:59 PM
    Author     : carti
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/stylish.css">
        <title>Register</title>
    </head>

    <jsp:include page="header.jsp"/>

    <body>
        <h1>Register</h1>
        <form action="registerAction.jsp" method="POST">
            <table>
                <tr><td>Full Name</td><td><input type="text" name="name"></td></tr>
                <tr><td>Email</td><td><input type="text" name="email"></td></tr>
                <tr><td>Password</td><td><input type="password" name="password"></td></tr>
                <tr><td>Phone Number</td><td><input type="text" name="phone"></td></tr>
                <tr>
                    <td><label for=""></label></td>
                    <td><input name="" type="submit" value="Register">
                        &nbsp; 
                        <button class="button" type="button" onclick="location.href = 'index.jsp'" > Home Page </button>
                    </td>
                </tr>
            </table>
        </form>       
    </body>
</html>
