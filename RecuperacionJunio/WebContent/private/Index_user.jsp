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
<title><fmt:message key="user.user" /></title>

</head>
<body>
<%
HttpServletRequest httpRequest = (HttpServletRequest) request;
    String logoutURI = httpRequest.getContextPath() + "/LogOut"; 
    String update = httpRequest.getContextPath() + "/UpdateEquipoJugador";
    String create = httpRequest.getContextPath() + "/CreateJugador";
    %>
    <h1> <fmt:message key="user.welcome" /> </h1>
    <p><fmt:message key="intro" /></p>

<ul>
    <li><fmt:message key="user.add" /> <button onclick="document.getElementById('add').style.cssText='visibility:visible'"><fmt:message key="user.add" /></button></li>

    <div id="add" style="visibility:hidden">
	<form action="<%=create %>" method="post">
	
	<label for="nombre"><fmt:message key="name" /></label>
    <input type="text" name="nombre" id="nombre">
    <label for="apellido"><fmt:message key="surname" /></label>
    <input type="text" name="apellido" id="apellido">
    <label for="dni"><fmt:message key="dni" /></label>
    <input type="text" name="dni" id="dni">
    <label for="Direccion"><fmt:message key="address" /></label>
    <input type="text" name="Direccion" id="Direccion">
<select id="equipo" name="equipo">
	<c:forEach var='z' items='${equipos}' >
    <option value="${z.getId()}"><c:out value="${z.getNombre()}"></c:out></option>
   
    <br>
    </p>
    </c:forEach>
	</select>
    <input type="submit" value="<fmt:message key="user.add" />"></form>

    </div>
</ul>
<h1><fmt:message key="players" /></h1>

    <p>
    <c:forEach var='i' items='${jugadores}' >
    <p><fmt:message key="name" />: <c:out value="${i.getNombre()}"></c:out></p><br>
    <p><fmt:message key="surname" />: <c:out value="${i.getApellidos()}"></c:out></p><br>
    <p><fmt:message key="dni" />: <c:out value="${i.getDni()}"></c:out></p><br>
    <p><fmt:message key="address" />: <c:out value="${i.getDireccion()}"></c:out></p><br>
    <p><fmt:message key="team" />: <c:out value="${i.getEquipo()}"></c:out></p><br>
    
	<form action="<%=update %>" method="post">
	<label><fmt:message key="user.update" /> :</label>
					<input type="hidden" name="jugador_id" value="${i.getId()}">
						<select id="team" name="team">
	<c:forEach var='z' items='${equipos}' >
    <option value="${z.getId()}"><c:out value="${z.getNombre()}"></c:out></option>
   
    <br>
    </p>
    </c:forEach>
						</select>
					<button type="submit"><fmt:message key="user.update" /></button>
	</form>
    <p>-----------------------------------------------------</p>
    <br>
    </p>
    </c:forEach>
    <p>*****************************************************</p>
    <h1><fmt:message key="teams" /></h1>
    

	
    <p>
    <c:forEach var='i' items='${equipos}' >
    <p><fmt:message key="name" />: <c:out value="${i.getNombre()}"></c:out></p><br>
    <p><fmt:message key="city" />: <c:out value="${i.getCiudad()}"></c:out></p><br>
    <p><fmt:message key="country" />: <c:out value="${i.getPais()}"></c:out></p><br>
    <p>-----------------------------------------------------</p>
    <br>
    </p>
    </c:forEach>
    <button>
        <a href="<%=logoutURI %>"><fmt:message key="logout" /></a>
    </button>
</body>
</html>