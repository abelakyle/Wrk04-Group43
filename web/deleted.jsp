
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
    <body>

        <h1>Are you sure you want to delete this account?<h1>        
        <form action="delete_user.jsp" method="POST">
            <table>
                <tr>
                    <td>
                        <p class="outline">Your account has been deleted. Click <a class="link" href="index.jsp">here</a> to return to the welcome page.</p>
                    </td>
                </tr>
            </table>
        </form>
        <%    
            //Activate the database add-function once DBManager functions are completed
            DBManager manager = (DBManager)session.getAttribute("manager");
            manager.deleteUser(user.getID());
            session.invalidate();
        %>
    </body>
</html>