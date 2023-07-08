<%-- 
    Document   : customtag
    Created on : 27 Mar, 2023, 12:05:28 AM
    Author     : Rahul Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/mylib" prefix="t" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <t:mytag></t:mytag>
        <hr>
        <t:printTable number="14" color="red"></t:printTable>
        <t:printTable number="10" color="blue"></t:printTable>
    </body>
</html>
