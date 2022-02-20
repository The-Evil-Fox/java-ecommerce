<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Connexion</title>
</head>
<body>
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
</body>
</html>