<%-- 
    Document   : userManage
    Created on : 31/05/2019, 12:21:43 AM
    Author     : william
--%>
<%@page import="uts.isd.model.dao.*"%>
<%@page import="java.util.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administration</title>
        <link rel="stylesheet" href="style/stylish.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/script.js"></script>
    </head>
    <jsp:include page="header.jsp"/>
    <body align="center">
        <p><a href="addUserAdmin.jsp">Add User</a></p>
        <h3>Search for user</h3>
        <form action="userManage.jsp" method="POST">
            <input style="padding: 10px; width: 40%" type="text" name="search" placeholder="Search by name or phone...">
            <input style="padding: 10px" type="submit" value="Search">
        </form>
        <%
            User userLogin = (User) session.getAttribute("userLogin");
            if (userLogin == null || !userLogin.isAdmin()) {
                response.sendRedirect("noUserLogin.jsp");
            }

            DBManager manager = (DBManager) session.getAttribute("manager");
            String search = request.getParameter("search");
            if (search != null && !search.isEmpty() && manager.userExists(search)) {
                User[] users = manager.findUserByIdOrName(search);
                session.setAttribute("userlist", users);

            } else {
                User[] users = manager.listAllUsers();
                session.setAttribute("userlist", users);
            }

        %>

        <div align="center">
            <table border="1" cellpadding="5">
                <% if (search != null && !search.isEmpty() && manager.userExists(search)) { %>
                <caption><h2>Searching for "<% out.print(search); %>"</h2></caption>
                <% } else {%>
                <caption><h2>All users</h2></caption>
                <% } %>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Phone</th>
                    <th>Position</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                <%   try {
                        User[] users = (User[]) session.getAttribute("userlist");

                        for (User user : users) {
                %>

                <tr>
                    <td><%=user.getID()%></td>
                    <td><%=user.getName()%></td>
                    <td><%=user.getEmail()%></td>
                    <td><%=user.getPassword()%></td>
                    <td><%=user.getPhone()%></td>
                    <td><%=user.getPosition()%></td>
                    <td><%if (user.getStatus()) {%>on<%} else {%>off<%}%></td>
                    <td>
                        <form action="editUserAdmin.jsp" method="POST">
                            <button type="submit" name="ID" value="<%out.print(user.getID());%>">Edit</button> 
                        </form>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <form action="deleteUserAdmin.jsp" method="POST">
                            <button type="submit" name="ID" value="<%out.print(user.getID());%>">Delete</button> 
                        </form>                   
                    </td>
                </tr>
                <% } %>
            </table>
            <%  } catch (NullPointerException e) { %>     
            <p> NO USERS FOUND </p>
            <%      }%>

        </div>   


    </body>
</html>
