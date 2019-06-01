<%-- 
    Document   : accessLog
    Created on : 30/05/2019, 8:21:47 PM
    Author     : Kyle_2
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.dao.*"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="uts.isd.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/stylish.css">
        <title>Access Log</title>
    </head>

    <jsp:include page="header.jsp"/>    
    <% User user = (User) session.getAttribute("userLogin");%>

    <body>
        <h1> <%= user.getName()%>'s Access Log</h1>

        <table class="account" align="Center">
            <thead class="h"><tr ><td class="a">Log ID</td><td class="a">Login Date</td><td class="a">Login Time</td><td class="a">Logout Time</td></tr></thead>
            <tbody>
                <%
                    DBManager manager = (DBManager) session.getAttribute("manager");
                    String search = request.getParameter("search");
                    ArrayList<Log> logList = new ArrayList<Log>();

                    if (search != null && search.equals("requested")) {
                        String date = request.getParameter("searchDate");
                        logList = (ArrayList<Log>) manager.getSearchedLog(user.getID(), date);

                        for (Log log : logList) {
                %>
                <tr class ="h"><td class="a"><%= log.getLogID()%></td><td class="a"><%= log.getLoginDate()%></td><td class="a"><%= log.getLoginTime()%></td>
                    <td class="a"><%= log.getLogoutTime()%></td></tr>                                              
                    <% }
                    } else {
                        logList = (ArrayList<Log>) manager.getAccessLog(user.getID());
                        for (Log log : logList) {
                    %>
                <tr class ="h"><td class="a"><%= log.getLogID()%></td><td class="a"><%= log.getLoginDate()%></td><td class="a"><%= log.getLoginTime()%></td>
                    <td class="a"><%= log.getLogoutTime()%></td></tr>                                                              
                    <%    }
                        }
                    %>

            </tbody>
        </table>            
        <form action ="accessLogSearch.jsp" method ="GET">
            &nbsp;<table align="center">
                <tr><td>Search Access Logs by date: &nbsp; </td><td><input type="text" name="searchDate" value="dd/MM/yyyy" required ></td>
                    <td>&nbsp; <input name="" type="submit" value ="Search"></td></tr>
                <input type="hidden" name="search" value="requested">
            </table>
        </form>

        <form action="accessLogDelete.jsp" method="POST">
            &nbsp;<table align="center">
                <tr><td>Enter Log ID to delete: &nbsp; </td><td><input type="number" name="eraseID" required ></td>
                    <td>&nbsp; <input name="" type="submit" value ="Delete"><span class="error"> 
                            &nbsp;<c:if test="${failErr!=null}"><span class="error"><c:out value="${failErr}"/></span></c:if></span></td></tr>
                </table>                
            ${failErr = null}
        </form>
        <p align="center">&nbsp; <button onclick="window.location.href = 'accessLog.jsp'">Refresh</button></p>
    </body> 
</html>
