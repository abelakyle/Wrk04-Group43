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
        <title> </title>
    </head>
    
        <body>
                <%
                        //Activate the database search-validate once DBManager functions are completed
                        DBManager manager = (DBManager)session.getAttribute("manager");
                        
                        String name = request.getParameter("name");
                        String email = request.getParameter("email");
                        String password = request.getParameter("password");
                        String phone = request.getParameter("phone");
                        String position = request.getParameter("position");

                        int key = 200000 + (new Random().nextInt(99999));
                        String ID= "" + key;

                        User user = new User( ID, name, email,  password, phone, position);                                   
                        manager.addStaff( ID, name, email,  password, phone, position);
                        session.setAttribute("staff", user);                       
                        
                        
                        response.sendRedirect("staffManage.jsp");
                %>
        </body>
</html>
