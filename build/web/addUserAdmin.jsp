<%-- 
    Document   : register
    Created on : 18/04/2019, 1:02:59 PM
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
        <title>Add User</title>
    </head>

    <jsp:include page="header.jsp"/>
    <%
        User userLogin = (User) session.getAttribute("userLogin");
        if (userLogin == null || !userLogin.isAdmin()) {
            response.sendRedirect("noUserLogin.jsp");
        }
    %>
    
    <body>
        <h1>Create User</h1> <h1><c:if test="${incomplete!=null}"><span class="error"><c:out value="${incomplete}"/></span></c:if></span></h1>
        <form action="addUserAdminAction.jsp" method="POST">
            <table>
                <tr><td>Full Name</td><td><input type="text" name="name"></td></tr>
                <tr><td>Email</td><td><input type="text" name="email"></td></tr>
                <tr><td>Password</td><td><input type="password" name="password"></td></tr>
                <tr><td>Phone Number</td><td><input type="text" name="phone"></td></tr>
                <tr>
                    <td><label for=""></label></td>
                    <td><input name="" type="submit" value="Add User">
                        &nbsp; 
                        <button class="button" type="button" onclick="location.href = 'userManage.jsp'" > Cancel </button>
                    </td>
                </tr>
            </table>
        </form> 
        ${incomplete = null}
    </body>
</html>
