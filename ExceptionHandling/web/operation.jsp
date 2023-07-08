<%-- 
    Document   : operation
    Created on : 26 Mar, 2023, 7:13:54 PM
    Author     : Rahul Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="exception.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // fetch the no.
            String n1 = request.getParameter("n1");
            String n2 = request.getParameter("n2");
            int a = Integer.parseInt(n1);
            int b = Integer.parseInt(n2);
            int c = a/b;
        %>
        <h1>Result is :<%= c %></h1>
    </body>
</html>
