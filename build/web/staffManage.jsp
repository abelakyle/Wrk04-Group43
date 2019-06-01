<%-- 
    Document   : staffManage
    Created on : Jun 1, 2019, 11:37:27 AM
    Author     : gusck
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

    <body style="text-align:center">
        <p><a href="addStaffAdmin.jsp">Add Staff</a></p>
        <h3>Search for staff</h3>
        <form action="staffManage.jsp" method="POST">
            <input style="padding: 10px; width: 40%" type="text" name="search" placeholder="Search by name or position...">
            <input style="padding: 10px" type="submit" value="Search">
        </form>
        <%
           DBManager manager = (DBManager) session.getAttribute("manager");
           String search = request.getParameter("search");
           if (search != null && !search.isEmpty() && manager.staffExists(search)) {
              User[] users = manager.findStaffByIdOrName(search);
              session.setAttribute("stafflist", users);               
          } else {
                User[] users = manager.listAllStaffs();
                session.setAttribute("stafflist", users);
           }

        %>
       
        <div align="center">
            <table border="1" cellpadding="5">
                <% if(search != null && !search.isEmpty() && manager.staffExists(search)) { %>
                
                <caption><h2>Searching for "<% out.print(search); %>"</h2></caption>
                <% } else {%>
                <caption><h2>All staffs</h2></caption>

                <% } %>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Phone</th>
                    <th>Position</th>
                    <th>Actions</th>
                </tr>
                <%   try {
                        User[] users = (User[]) session.getAttribute("stafflist");
                        for (User user : users) {
                %>

                <tr>
                    <td><% out.print(user.getID());%></td>
                    <td><% out.print(user.getName());%></td>
                    <td><% out.print(user.getEmail());%></td>
                    <td><% out.print(user.getPassword());%></td>
                    <td><% out.print(user.getPhone());%></td>
                    <td><% out.print(user.getPosition());%></td>

                    <td>
                        <form action="editStaffAdmin.jsp" method="POST">
                            <button type="submit" name="ID" value="<%out.print(user.getID());%>">Edit</button> 
                        </form>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <form action="deleteStaffAdmin.jsp" method="POST">
                            <button type="submit" name="ID" value="<%out.print(user.getID());%>">Delete</button> 
                        </form>                   
                    </td>
                </tr>
                <% } %>
            </table>
            <%  } catch (NullPointerException e) { %>     
        <p> NO STAFFS FOUND </p>
        <%      } %>
                
        </div>      
    </body>
</html>