<%-- 
    Document   : editMovie
    Created on : 31/05/2019, 5:42:40 PM
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
        <title>Delete User</title>
        <link rel="stylesheet" type="text/css" href="style/stylish.css">
    </head>

    <jsp:include page="header.jsp"/>
    <%
        User userLogin = (User) session.getAttribute("userLogin");
        if (userLogin == null || !userLogin.isAdmin()) {
            response.sendRedirect("noUserLogin.jsp");
        }
    %>

    <body>
        <%
            DBManager manager = (DBManager) session.getAttribute("manager");
            String id = request.getParameter("ID");

            User user = manager.findUserById(id);

            if (user == null) { %>
        <div class="alert alert-danger">
            <p><strong>Error!</strong> No User found!
                Please go back to <a href="userManage.jsp">User List</a> .
        </div>
        <% } else {
        %>


        <form action="deleteUserAdmin.jsp" method="POST">
            <table>
                <h3>Are you sure you want to delete the following user?</h3>
                <tr><td>User ID</td><td><input type="text" name="ID" value="<%=id%>" readonly="readonly"></td>
                <tr><td>Full name</td><td><input type="text" value="<%= user.getName()%>" name="name" readonly="readonly"></td></tr>
                <tr><td>Email</td><td><input type="text" value="<%= user.getEmail()%>" name="email" readonly="readonly"></td></tr>                
                <tr><td>Password</td><td><input type="text" value="<%= user.getPassword()%>" name="password" readonly="readonly"></td></tr>   
                <tr><td>Phone number</td><td><input type="text" value="<%= user.getPhone()%>" name="phone" readonly="readonly"></td></tr>
                <tr><td><input type="hidden" value="updated" name="updated"></td>
                    <td><input class="button" type="submit" value="Delete"> 
                        &emsp;
                        <button class="button" type="button" onclick="location.href = 'userManage.jsp'">Cancel</button>
                    </td>
                </tr>
            </table>
        </form>

        <%
            if (request.getParameter("updated") != null) {
                manager.deleteUser(user.getID());

        %>
        <p class="outline"> User has been deleted. Click <a href="userManage.jsp">here</a> to go back</p>
        <% 
            }
            }
        %>
    </body>
</html>
