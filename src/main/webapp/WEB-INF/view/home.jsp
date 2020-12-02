<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: natton
  Date: 01-Dec-20
  Time: 9:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
    <h1>Home Page</h1>
    User: <security:authentication property="principal.username"/>
    Role: <security:authentication property="principal.authorities"/>


    <form:form action="${pageContext.request.contextPath}/logout"
    method="POST">
        <input type="submit" value="Logout"/>
    </form:form>
    <security:authorize access="hasRole('ADMIN')">
        <a href="${pageContext.request.contextPath}/admin">Admin Page (For admin only)</a>
    </security:authorize>
</body>
</html>
