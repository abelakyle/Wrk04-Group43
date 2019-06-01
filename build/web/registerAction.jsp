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
                        DBManager manager = (DBManager)session.getAttribute("manager");
                        
                        String name = request.getParameter("name");
                        String email = request.getParameter("email");
                        String password = request.getParameter("password");
                        String phone = request.getParameter("phone");
                        
                        int key = 100000 + (new Random().nextInt(99999));
                        String ID = "" + key;

                        User users = new User( ID, name, email,  password, phone);                                   
                        manager.addUser( ID, name, email,  password, phone);                        
                        
                        if (name.equals("") || email.equals("") || password.equals("") || phone.equals("")) {
                            session.setAttribute("createErr", "Failed to create user");
                            response.sendRedirect("register.jsp");
                        }else{
                            session.setAttribute("userLogin", users);
                            response.sendRedirect("welcome.jsp");
                        }
                %>
        </body>
</html>
