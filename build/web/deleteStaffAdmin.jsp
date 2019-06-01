

<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Staff</title>
        <link rel="stylesheet" type="text/css" href="style/stylish.css">
    </head>

    <jsp:include page="header.jsp"/>

    <body>
        <%
            DBManager manager = (DBManager) session.getAttribute("manager");
            String id = request.getParameter("ID");

            User user = manager.findStaffById(id);

            if (user == null) { %>
        <div class="alert alert-danger">
            <p><strong>Error!</strong> No User found!
                Please go back to <a href="staffManage.jsp">User List</a> .
        </div>
        <% } else {
        %>


        <form action="deleteStaffAdmin.jsp" method="POST">
            <table>
                <h3>Are you sure you want to delete the following staff?</h3>
                <tr><td>User ID</td><td><input type="text" name="ID" value="<%=id%>" readonly="readonly"></td>
                <tr><td>Full name</td><td><input type="text" value="<%= user.getName()%>" name="name" readonly="readonly"></td></tr>
                <tr><td>Email</td><td><input type="text" value="<%= user.getEmail()%>" name="email" readonly="readonly"></td></tr>                
                <tr><td>Password</td><td><input type="text" value="<%= user.getPassword()%>" name="password" readonly="readonly"></td></tr>   
                <tr><td>Phone number</td><td><input type="text" value="<%= user.getPhone()%>" name="phone" readonly="readonly"></td></tr>
                <tr><td>Position</td><td><input type="text" value="<%= user.getPosition()%>" name="position" readonly="readonly"></td></tr>
                <tr><td><input type="hidden" value="updated" name="updated"></td>
                    <td><input class="button" type="submit" value="Delete"> 
                        &emsp;
                        <button class="button" type="button" onclick="location.href = 'staffManage.jsp'">Cancel</button>
                    </td>
                </tr>
            </table>
        </form>

        <%
            if (request.getParameter("updated") != null) {
                manager.deleteUser(user.getID());

        %>
        <p class="outline"> User has been deleted. Click <a href="staffManage.jsp">here</a> to go back</p>
        <%                }
            }
        %>
    </body>
</html>
