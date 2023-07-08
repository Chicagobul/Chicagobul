<%-- 
    Document   : index
    Created on : 30 Mar, 2023, 11:48:27 PM
    Author     : Rahul Singh
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!-- to get/print the value use '$' 
             scope = application means it can be used anywhere in this project, we can also use 
             session, page etc -->
        <c:set var="i" value="123" scope="application"></c:set>
    
        <h1><c:out value="${i}"></c:out></h1>
    
    <c:remove var="i"></c:remove>
    
    <c:if test="${i==123}">
        <h1>condition is true</h1>
    </c:if>
        
    <c:choose>
        <c:when test="${i>0}">
            <h1>this is my first case</h1>
        </c:when>
        <c:when test="${i<0}">
            <h1>this is my second case</h1>
        </c:when>
        <c:otherwise>
            <h1>Default case (else)</h1>
        </c:otherwise>
    </c:choose>
       
            <!-- looping -->
    <c:forEach var="j" begin="1" end="5">
        <h1>value of j is :<c:out value="${j}"></c:out></h1>
    </c:forEach>
        
    <c:url var="mysql" value="https://www.google.com/serach">
        <c:param name="ab" value="how are you"></c:param>
    </c:url>
        <h1><c:out value="${mysql}"></c:out></h1>
        
    <c:redirect url="${mysql}"></c:redirect>
    
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
