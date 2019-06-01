<%-- 
    Document   : addStaffAdmin
    Created on : Jun 1, 2019, 11:15:31 AM
    Author     : gusck
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
    <%
        User userLogin = (User) session.getAttribute("userLogin");
        if (userLogin == null || !userLogin.isAdmin()) {
            response.sendRedirect("noUserLogin.jsp");
        }
    %>
    <body>
        <h1>Create Staff</h1>
        <form action="addStaffAdminAction.jsp" method="POST">
            <table>
                <tr><td>Full Name</td><td><input type="text" name="name"></td></tr>
                <tr><td>Email</td><td><input type="text" name="email"></td></tr>
                <tr><td>Password</td><td><input type="password" name="password"></td></tr>
                <tr><td>Phone Number</td><td><input type="text" name="phone"></td></tr>
                <tr><td>Position</td><td><input type="text" name="position"></td>                   
                </tr>

                <tr>
                    <td><label for=""></label></td>
                    <td><input name="" type="submit" value="Add Staff">
                        &nbsp; 
                        <button class="button" type="button" onclick="location.href = 'staffManage.jsp'" > Cancel </button>
                    </td>
                </tr>
            </table>
        </form>       
    </body>
</html>