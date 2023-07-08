<%-- 
    Document   : functiontags
    Created on : 1 Apr, 2023, 5:24:15 PM
    Author     : Rahul Singh
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="name" value="RAHUL" scope="application"></c:set>
        <h1><c:out value="${name}"></c:out></h1>
        <h1>Length of name is :<c:out value="${fn:length(name)}"></c:out></h1>
        <h1><c:out value="${fn:toLowerCase(name)}"></c:out></h1>
        <h1><c:out value="${fn:contains(name,'RAH')}"></c:out></h1>
    </body>
</html>
