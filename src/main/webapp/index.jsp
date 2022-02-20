<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="../templates/header.jsp" %>
	<title>Connexion</title>
</head>
<body>
	<%@include file="../templates/navbar.jsp" %>
	<c:set value="${erreur}" var="erreur" />
	<form method="post" action="ConnexionUtilisateur">
		<div style="display:flex; flex-direction: column; margin: 3vh 0;">
			<label for="email">email:</label>
			<input type="text" name="email" required style="width: 30%">
		</div>
		<div style="display:flex; flex-direction: column; margin: 3vh 0;">
			<label for="password">password:</label>
			<input type="text" name="password" required style="width: 30%">
		</div>
			<c:if test="${erreur != null}">
				<h2><c:out value="${erreur}"/></h2>
			</c:if>
		<button>Connexion</button>
	</form>
	<%@include file="../templates/scripts.jsp" %>
</body>
</html>