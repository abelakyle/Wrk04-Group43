<%-- 
    Document   : header
    Created on : 30/05/2019, 5:55:03 PM
    Author     : william
--%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <header>
        <h1>Online Movie Store</h1>                    
    </header>

    <% User user = (User) session.getAttribute("userLogin"); %>                                 
    <div class ="navbar">
        <span class="leftalign">
            <% if (user != null) { %>
            <a href="home.jsp"> Home</a>
            <% } else { %> 
            <a href="index.jsp">Home</a>   
            <% } %>
        </span>
        <span class="rightalign">
            <% if (user != null) {%>
            <a href="myAccount.jsp"> <%=user%>'s Profile</a>
                <% if (user.isAdmin()) { %>
                <a href="adminManagement.jsp">Admininstration</a>
                <% } %>
            <a href="cart.jsp">Cart</a>
            <a href="logoutAction.jsp">Logout</a>
            <% } else { %>                      
            <a href="login.jsp">Log In</a>
            <a href="register.jsp">Register</a>
            <a href="cart.jsp">Cart</a>
            <% }%>                    
        </span> 
    </div>
</html>
