<%-- 
    Document   : error_page
    Created on : 26 Mar, 2023, 1:39:44 PM
    Author     : Rahul Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SORRY !!! Something went worng....</title>
        <style>
            * {
                padding: 0px;
                margin: 0px;
            }
        </style>
    </head>
    <body>
        <div style="padding: 20px; color: blue; background: #ffccff;">
            <h1>SORRY !!! Something went worng....</h1>
            <br>
            <br>
            <br>
            <p><%= exception %></p>
        </div>
    </body>
</html>
