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
<title><fmt:message key="admin" /></title>
</head>
<body>
<%
HttpServletRequest httpRequest = (HttpServletRequest) request;
    String logoutURI = httpRequest.getContextPath() + "/LogOut"; 
    String deleteEquipo = httpRequest.getContextPath() + "/deleteTeam"; 
    String deleteJugador = httpRequest.getContextPath() + "/deletePlayer"; 
    String create = httpRequest.getContextPath() + "/createTeam"; 
    String leeusuario = httpRequest.getContextPath() + "/ReadUser"; 
    String updateTeam = httpRequest.getContextPath() + "/updateEquipo"; 
    %>
    <H1><fmt:message key="admin.welcome" /> </H1>
    <p><fmt:message key="intro" /></p>
    <ul>
    <li><fmt:message key="admin.management" /> <a href="<%= leeusuario %>"> <fmt:message key="go" /> </a></li>
    <li><fmt:message key="admin.add" /><button onclick="document.getElementById('add').style.cssText='visibility:visible'"><fmt:message key="admin.add" /></button></li>

    <div id="add" style="visibility:hidden">
	<form action="<%=create %>" method="post">
	
	<label for="nombre"><fmt:message key="name" /></label>
    <input type="text" name="nombre" id="nombre">
    <label for="ciudad"><fmt:message key="city" /></label>
    <input type="text" name="ciudad" id="ciudad">
    <label for="pais"><fmt:message key="country" /></label>
    <input type="text" name="pais" id="pais">
   

    <input type="submit" value="<fmt:message key="admin.add" />"></form>

    </div>
</ul>
<h1><fmt:message key="teams" /></h1>

<p>
<c:forEach var='i' items='${equipos}' >

<form action="<%=updateTeam%>" method="POST">

	<input type="hidden" name="equipo_id" value="${i.getId()}"><br>
    <label for="equipo_nombre"><fmt:message key="name" />: </label><br>
    <input type="text" value="${i.getNombre()}" name="equipo_nombre"><br>
    <label for="equipo_ciudad"><fmt:message key="city" />: </label><br>
    <input type="text" value="${i.getCiudad()}" name="equipo_ciudad"><br>
    <label for="equipo_pais"><fmt:message key="country" />: </label><br>
    <input type="text" value="${i.getPais()}" name="equipo_pais"><br>
    <input type="submit" value="<fmt:message key="user.update" />">
</form>
<form action="<%=deleteEquipo %>" method="POST">

<input type="hidden" name="equipo_id" value="${i.getId()}">
<input type="submit" value="<fmt:message key="delete" />">
</form>

<p>-----------------------------------------------------</p>
<br>
</p>
</c:forEach>
    <h1><fmt:message key="players" /></h1>

    <p>
    <c:forEach var='i' items='${jugadores}' >
    <p><fmt:message key="name" />: <c:out value="${i.getNombre()}"></c:out></p><br>
    <p><fmt:message key="surname" />: <c:out value="${i.getApellidos()}"></c:out></p><br>
    <p><fmt:message key="dni" />: <c:out value="${i.getDni()}"></c:out></p><br>
    <p><fmt:message key="address" />: <c:out value="${i.getDireccion()}"></c:out></p><br>
    <p><fmt:message key="team" />: <c:out value="${i.getEquipo()}"></c:out></p><br>
    
     <form action="<%=deleteJugador %>" method="POST">

    <input type="hidden" name="jugador_id" value="${i.getId()}">
    <input type="submit" value="<fmt:message key="delete" />">
	</form>
     <p>-----------------------------------------------------</p>
    <br>
    </p>
    </c:forEach>
    <button>
        <a href="<%=logoutURI %>"><fmt:message key="logout" /> </a>
    </button>
</body>
</html>