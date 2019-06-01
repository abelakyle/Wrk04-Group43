
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
        <link rel="stylesheet" href="css/demo.css"> 
        <script type="text/javascript" src="js/script.js"></script>
        <title>Delete Account Page</title>
    </head>

    <jsp:include page="header.jsp"/>
    <%
        User user = (User) session.getAttribute("userEdit");
    %>
    <body >

        <h1>Are you sure you want to delete this account?<h1>        
        <form action="delete_user.jsp" method="POST">
            <table>
                <tr><td>User ID</td><td><%= user.getID()%></td></tr>

                <tr>
                    <td>
                        <button class="button" type="button" onclick="location.href = 'deleted.jsp'" > Yes </button>
                        &emsp; 
                        <button class="button" type="button" onclick="location.href = 'edit_user.jsp'" > No </button>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>

