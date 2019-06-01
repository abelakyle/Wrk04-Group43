<%-- 
    Document   : adminManagement
    Created on : 31/05/2019, 12:08:01 AM
    Author     : william
--%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style/stylish.css"> 
        <script type="text/javascript" src="js/script.js"></script>
        <title>Admin</title>
    </head>
    <jsp:include page="header.jsp"/>
    <%
        User userLogin = (User) session.getAttribute("userLogin");
        if (userLogin == null || !userLogin.isAdmin()) {
            response.sendRedirect("noUserLogin.jsp");
        }
    %>
    <body>
        <p><a href="userManage.jsp">Manage User</a></p>
        <p><a href="staffManage.jsp">Manage Staff</a></p>
    </body>
</html>
