<%@page import="uts.isd.model.User"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" type="text/css" href="style/stylish.css">
                <title>Welcome</title>
        </head>
        
        <% User user = (User)session.getAttribute("userLogin"); %>                          
        
        <jsp:include page="header.jsp"/>
        
        <body>     
            <p>Welcome: <%= user.getName() %>! </p>
            <p>Your ID is <%= user.getID() %>. </p>
            <p>Your email is <%= user.getEmail() %>. </p>
            <p>Your password is <%= user.getPassword() %>. </p>
            <p>Your phone number is <%= user.getPhone() %>. </p>
            <p><button class="button" type="button" onclick="location.href = 'home.jsp'" > Home Page </button></p>

        </body>
</html>