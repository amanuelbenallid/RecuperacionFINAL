<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@page import="javax.servlet.http.HttpServletRequest" %>
	<%@page import="javax.servlet.ServletRequest" %>
	<fmt:setBundle basename="interface" />
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><fmt:message key="register" /></title>
</head>
<body>
<%
HttpServletRequest httpRequest = (HttpServletRequest) request;
    String logoutURI = httpRequest.getContextPath() + "/LogOut"; 
    String register = httpRequest.getContextPath() + "/Register"; 

    %>
<h1><fmt:message key="register" /></h1>

<form action="<%=register%>" method="POST">

    <label for="username"><fmt:message key="user" />:</label><br>
    <input type="text" name="username" id="username"><br>
    <label for="password"><fmt:message key="password" />:</label><br>
    <input type="password" name="password" id="password"><br>
    <label for="fullname"><fmt:message key="fullname" />:</label><br>
    <input type="text" name="fullname" id="fullname"><br>
    <label for="fechanac"><fmt:message key="DateBirth" />:</label><br>
    <input type="date" name="fechanac" id="fechanac"><br>
    <input type="submit" value="<fmt:message key="register" />">
</form>
</body>
</html>