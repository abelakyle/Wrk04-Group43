<%-- 
    Document   : orderHistoryAction
    Created on : 31/05/2019, 5:17:26 PM
    Author     : rober
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%	DBManager manager = (DBManager) session.getAttribute("manager");

            String id = request.getParameter("id");
            String date = request.getParameter("date");
            boolean hasId = (id != null && !id.isEmpty());
            boolean hasDate = (date != null && !date.isEmpty());

            if (!hasId && !hasDate) {
                Order[] orderHistory = manager.getOrderHistory();
                session.setAttribute("orderHistory", orderHistory);
                response.sendRedirect("listOrders.jsp");
                System.out.println("1");
            } else if (hasId && !hasDate) {
                Order[] orderHistory = manager.findOrdersByID(id);
                session.setAttribute("orderHistory", orderHistory);
                response.sendRedirect("listOrders.jsp");
                System.out.println("2");
            } else if (!hasId && hasDate) {
                Order[] orderHistory = manager.findOrdersByDate(date);
                session.setAttribute("orderHistory", orderHistory);
                response.sendRedirect("listOrders.jsp");
                System.out.println("3");
            } else if (hasId && hasDate) {
                Order[] orderHistory = manager.findOrders(id, date);
                session.setAttribute("orderHistory", orderHistory);
                response.sendRedirect("listOrders.jsp");
                System.out.println("4");
            }
        %>
    </body>
</html>
