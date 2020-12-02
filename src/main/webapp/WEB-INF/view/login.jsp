<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: natton
  Date: 01-Dec-20
  Time: 10:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
    <h1>Login Page</h1>
    <c:if test="${param.error != null}">
        <p>Wrong username or password</p>
    </c:if>
    <c:if test="${param.logout != null}">
        <p>You have been logout</p>
    </c:if>
    <form:form action="${pageContext.request.contextPath}/authenticate" method="POST">
        Username <input type="text" name="username"/>
        Password <input type="password" name="password"/>
        <input type="submit" value="Login"/>

    </form:form>
</body>
</html>
