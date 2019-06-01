
<%@page import="uts.isd.model.dao.DBManager"%>
<%@page import="uts.isd.model.dao.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="uts.isd.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style/stylish.css"> 
        <script type="text/javascript" src="js/script.js"></script>
        <title>Edit User</title>
    </head>

    <jsp:include page="header.jsp"/>
    <%

        DBManager manager = (DBManager) session.getAttribute("manager");
        

        User user = (User)session.getAttribute("userEdit");
    %> 
    <body >
        <h1>Account Profile</h1>        
        <form action="editUser.jsp" method="POST">
            <table>
                <tr><td>User ID</td><td><%= user.getID()%></td></tr>
                <tr><td>Full name</td><td><input type="text" value="<%= user.getName()%>" name="name"></td></tr>
                <tr><td>Email</td><td><input type="text" value="<%= user.getEmail()%>" name="email"></td></tr>                
                <tr><td>Password</td><td><input type="password" value="<%= user.getPassword()%>" name="password"></td></tr>   
                <tr><td>Phone number</td><td><input type="text" value="<%= user.getPhone()%>" name="phone"></td></tr>
                <tr><td><input type="hidden" value="updated" name="updated"></td>
                    <td><input class="button" type="submit" value="Save"> 
                        &emsp; 
                        <button class="button" type="button" onclick="location.href = 'home.jsp'" > Main Page </button>
                        &emsp; 
                        <button class="button" type="button" onclick="location.href = 'deleteUser.jsp'" > Delete User </button>
                    </td>
                </tr>
            </table>
        </form>
        <%           
            if (request.getParameter("updated") != null) {
                manager.updateUser(user.getID(), request.getParameter("name"), request.getParameter("email"),
                        request.getParameter("password"), request.getParameter("phone"), "Customer", true);
                        User userEdit = manager.findUser(user.getEmail(), request.getParameter("password"));

                if (userEdit != null) {
                    session.setAttribute("user", userEdit);
                %>
                    <p class="outline"> User details updated.</p>
                <%} else {%>
                    <p class="outline"> Could not update database!</p> 
                <%}%>
            <%}%>
    </body>
</html>