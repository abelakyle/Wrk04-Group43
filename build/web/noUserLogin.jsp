<%-- 
    Document   : noUserLogin
    Created on : 01/06/2019, 2:07:59 PM
    Author     : william
--%>
<%@page import="uts.isd.model.dao.*"%>
<%@page import="java.util.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style/stylish.css"> 
        <script type="text/javascript" src="js/script.js"></script>
        <title>No Login!</title>
    </head>
    <jsp:include page="header.jsp"/>
    <body>
        <p>You must be logged in to view this page, or click <a href="index.jsp">here</a> to go home.</p>
    </body>
</html>
