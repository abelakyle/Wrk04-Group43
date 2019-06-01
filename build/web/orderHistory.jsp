<%-- 
    Document   : orderHistory
    Created on : 28/05/2019, 8:37:07 PM
    Author     : Kyle_2
--%>

<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/stylish.css">
        <title>Order History</title>
    </head>

    <jsp:include page="header.jsp"/>

    <body>
    <center>
        <h1>Order History</h1>
        <h2>
            <table align="center" >
                <tr>
                    <td>
                        <form action="orderHistoryAction.jsp" >
                            <table>
                                <tr><td><input type="text" name="id" placeholder="search by ID"></td>
                                    <td><input type="text" name="date" placeholder="search by date"></td>
                                    <td><button type="submit" >submit</button></td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
        </h2>
    </center>
</body>
</html>
