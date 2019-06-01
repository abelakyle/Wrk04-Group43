<%-- 
    Document   : accessLogAction
    Created on : 31/05/2019, 1:37:39 AM
    Author     : Kyle_2
--%>

<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            User user = (User) session.getAttribute("userLogin");

            String eraseID = request.getParameter("eraseID");
            //check ID == User_ID of record

            if (manager.logOwned(eraseID, user.getID())) {    //check ID
                //delete
                manager.deleteLog(eraseID);
                response.sendRedirect("accessLog.jsp");
            } else {
                session.setAttribute("failErr", "Failed to delete log '" + eraseID + "'.");
                response.sendRedirect("accessLog.jsp");
            }
        %>
    </body>

</html>
