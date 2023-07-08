<%-- 
    Document   : error_exception
    Created on : 26 Mar, 2023, 7:31:08 PM
    Author     : Rahul Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry !!! Something went wrong</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
              crossorigin="anonymous">
    </head>
    <body>
        <div class="container p-3 text-center">
            <!-- p-3 is used to give padding and class="img-fluid to make the page responsive -->
            <img src="image/000-http-error-codes.png" class="img-fluid"/>  
            <h1 class="display-3">Sorry !!! Something went wrong</h1>
            <p><%= exception %></p>
            <a class="btn btn-outline-primary mt-3" href="index.html">Home Page</a>
        </div>
    </body>
</html>
