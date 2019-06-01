<%-- 
    Document   : loginAction
    Created on : 29/05/2019, 5:48:01 PM
    Author     : Kyle
--%>

<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <%
            //Activate the database search-validate once DBManager functions are completed
            DBManager manager = (DBManager) session.getAttribute("manager");

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            User users = manager.findUser(email, password);
            //User user = new User("name",  "ID",  "password",  "email",  "phone",  "address",  "city",  "state",  "postcode",  "dateOfBirth");
            if (users != null && users.getStatus()) {
                session.setAttribute("userLogin", users);
                session.setAttribute("loginDate", manager.stampDate());
                session.setAttribute("loginTime", manager.stampTime());
                response.sendRedirect("home.jsp");
            } else {
                session.setAttribute("existErr", "Failed to login with those details, please try again.");
                response.sendRedirect("login.jsp");
            }
        %>
    </body>
</html>