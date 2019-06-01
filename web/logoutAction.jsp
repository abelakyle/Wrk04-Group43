<%-- 
    Document   : logoutAction
    Created on : 01/06/2019, 2:46:34 PM
    Author     : william
--%>

<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.dao.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            DBManager manager = (DBManager) session.getAttribute("manager");
            User user = (User) session.getAttribute("userLogin");

            String loginDate = (String) session.getAttribute("loginDate");
            String loginTime = (String) session.getAttribute("loginTime");

            String logoutTime = manager.stampTime();

            manager.createAccessLog(user.getID(), loginDate, loginTime, logoutTime);
            session.invalidate();
            response.sendRedirect("logout.jsp");
        %>
    </body>
</html>
