<%-- 
    Document   : orderMovieAction
    Created on : 31/05/2019, 9:54:07 PM
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
		<% DBManager manager = (DBManager) session.getAttribute("manager");
		int key = (new Random()).nextInt(999999);
		String id = "" + key;
		String quantity = request.getParameter("quantity");
		
		String editedId = request.getParameter("id");
		String created = request.getParameter("date").toString();
		String eta = request.getParameter("eta").toString();
		String price = request.getParameter("price").toString();
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String postcode = request.getParameter("postcode");
		String submitType = request.getParameter("submitType");
		String edited = request.getParameter("edited");
		
		if (submitType.equals("save") && edited.equals("false")) {
			manager.addOrder(id, quantity, created, address, city, state, postcode, eta, price, "saved");
			response.sendRedirect("cart.jsp");
		} else if (submitType.equals("submit") && edited.equals("false")) {
			manager.addOrder(id, quantity, created, address, city, state, postcode, eta, price, "submitted");
			response.sendRedirect("home.jsp");
		} else if (submitType.equals("save") && edited.equals("true")) {
			manager.updateOrder(editedId, quantity, created, address, city, state, postcode, eta, price, "saved");
			response.sendRedirect("cart.jsp");
		} else if (submitType.equals("submit") && edited.equals("true")) {
			manager.updateOrder(editedId, quantity, created, address, city, state, postcode, eta, price, "submitted");
			response.sendRedirect("home.jsp");
		}
		%>
	</body>
</html>
