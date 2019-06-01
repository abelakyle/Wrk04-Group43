<%-- 
    Document   : loginAction
    Created on : 29/05/2019, 5:48:01 PM
    Author     : Kyle
--%>

<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.regex.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
    </head>

    <body>
        <%
            //Activate the database search-validate once DBManager functions are completed

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");

            int key = 100000 + (new Random().nextInt(99999));
            String ID = "" + key;

            boolean checkName = Pattern.matches("[a-zA-Z]{0,20}", name);                          //validator
            boolean checkEmail = Pattern.matches("([a-zA-Z\\d]+@[a-zA-Z\\d.]+)", email);
            boolean checkPassword = (password.length() <= 20);
            boolean checkPhone = Pattern.matches("[\\d]{0,10}", phone);

            if (name.isEmpty() || email.isEmpty() || password.isEmpty() || phone.isEmpty()) {
                session.setAttribute("incomplete", "Please fill out all details.");
                response.sendRedirect("addUserAdmin.jsp");
            } else if (!checkName || !checkEmail || !checkPassword || !checkPhone) {
                if (!checkName) {
                    session.setAttribute("incomplete", "Please enter a valid name.");
                    response.sendRedirect("addUserAdmin.jsp");
                } else if (!checkEmail) {
                    session.setAttribute("incomplete", "Please enter a valid email.");
                    response.sendRedirect("addUserAdmin.jsp");
                } else if (!checkPassword) {
                    session.setAttribute("incomplete", "Please enter a password less than 20 charachters.");
                    response.sendRedirect("addUserAdmin.jsp");
                } else if (!checkPhone) {
                    session.setAttribute("incomplete", "Please enter a valid phone number.");
                    response.sendRedirect("addUserAdmin.jsp");
                }
            } else {
                DBManager manager = (DBManager) session.getAttribute("manager");
                User users = new User(ID, name, email, password, phone);
                manager.addUser(ID, name, email, password, phone);
                session.setAttribute("user", users);
                response.sendRedirect("userManage.jsp");
            }

        %>
    </body>
</html>

