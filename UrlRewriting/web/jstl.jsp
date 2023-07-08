<%-- 
    Document   : jstljsp
    Created on : 26 Mar, 2023, 12:46:14 PM
    Author     : Rahul Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- with this prefix we can use all the jstl with the help of 'c' variable 
     in uri we have to give the jstl tag that, which tag we have to use there are 5 diff tags available 
     core, sql, fmt, xml and functions--%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Taglib Directives Tutorial</h1>
        <hr>
        <c:set var="name" value="rahul"></c:set>
        <c:out value="${name}"></c:out>
        <c:if test="${3<2}">
            <h2>This is true block 3>2</h2>
            <%-- we have to use '$' for jstl to recognise it and have to give condition using test
                 attribute --%>
        </c:if>
    </body>
</html>
