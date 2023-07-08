<%-- 
    Document   : firstjsp
    Created on : 25 Mar, 2023, 1:01:58 PM
    Author     : Rahul Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background: #ffccff;">
        <h1>First JSP Page</h1>
        <%!
            int a = 10;
            int b = 30;
            String name = "rahul";

            public int doSum() {
                return a + b;
            }

            public String reverse() {
                StringBuffer sb = new StringBuffer(name);
                return sb.reverse().toString();
            }
        %>

        <%
            out.println(a);
            out.println("<br>");
            out.println(b);
            out.println("<br>");
            out.println("Sum is :" +doSum());
            out.println("<br>");
            out.println("Reverse is :" +reverse());
        %>
        
        <h1 style="color: darkviolet;">Sum is : <%= doSum() %></h1>
        <h1><%= name %></h1>
        <h1><%= a %></h1>

    </body>
</html>
