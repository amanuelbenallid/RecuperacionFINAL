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
<meta charset="UTF-8">
<title><fmt:message key="login.title" /></title>
</head>
<body>
	<div>
		<h1><fmt:message key="login.welcome" /></h1>

		<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String loginURI = httpRequest.getContextPath() + "/Login"; 
		

			%>
		<form action="<%=loginURI %>"  method="post">
			<fieldset>
				<legend><fmt:message key="login.title" /></legend>
				<label><fmt:message key="user" />:</label><br> 
				<input type="text" name="username"
				placeholder="<fmt:message key="user" />" required autofocus> <br> 
				<label><fmt:message key="password" />:</label><br> 
				<input type="password" name="password"
				placeholder="<fmt:message key="password" />" required><br>
				<input type="submit" value="<fmt:message key="login.title" />">
			</fieldset>
			
		</form>
	<button><a href="./Register.jsp"><fmt:message key="register" /></a></button>
	</div>

</body>
</html>
