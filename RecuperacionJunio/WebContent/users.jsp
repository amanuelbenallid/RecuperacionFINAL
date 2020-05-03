<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="javax.servlet.http.HttpServletRequest" %>
    <%@page import="javax.servlet.ServletRequest" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
    <fmt:setBundle basename="interface" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><fmt:message key="users" /></title>
</head>
<body>
<%
HttpServletRequest httpRequest = (HttpServletRequest) request;
    String logoutURI = httpRequest.getContextPath() + "/LogOut"; 
    String deleteUser = httpRequest.getContextPath() + "/deleteUser";
    String updateRole = httpRequest.getContextPath() + "/updateRole";
    String Read = httpRequest.getContextPath() + "/Read";
    %>
 <p>
    <c:forEach var='i' items='${usuarios}' >
    <p><fmt:message key="user" />: <c:out value="${i.getUsername()}"></c:out></p><br>
    <p><fmt:message key="password" />: <c:out value="${i.getPassword()}"></c:out></p><br>
    <p><fmt:message key="fullname" />: <c:out value="${i.getFullname()}"></c:out></p><br>
     <p><fmt:message key="DateBirth" />: <c:out value="${i.getFechanac()}"></c:out></p><br>
     <p><fmt:message key="role" />: <c:out value="${i.getRole()}"></c:out></p><br>
      <form action="<%=deleteUser %>" method="POST">

    <input type="hidden" name="user_id" value="${i.getUser_id()}">
    <input type="submit" value="<fmt:message key="delete" />">
	</form>
	<form action="<%= updateRole%>" method="POST">

    <input type="hidden" name="usuario_id" value="${i.getUser_id()}">
    <input type="hidden" name="roleantiguo" value="${i.getRole()}">

    <input type="submit" value="<fmt:message key="change.role" />">
</form>
    <p>-----------------------------------------------------</p>
    <br>
    </p>
    </c:forEach>
    
    <button><a href="<%=Read%>"><fmt:message key="return" /></a></button>
    <button><a href="<%=logoutURI%>"><fmt:message key="logout" /></a></button>
</body>
</html>