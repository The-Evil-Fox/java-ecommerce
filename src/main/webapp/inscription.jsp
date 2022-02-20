<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="../templates/header.jsp" %>
	<title>Inscription</title>
</head>
<body>
	<%@include file="../templates/navbar.jsp" %>
	<form method="post" action="InscriptionUtilisateur">
		<div style="display:flex; flex-direction: column; margin: 3vh 0;">
			<label for="nom">nom</label>
			<input type="text" name="nom" required style="width: 30%">
		</div>
		<div style="display:flex; flex-direction: column; margin: 3vh 0;">
			<label for="prenom">prenom:</label>
			<input type="text" name="prenom" required style="width: 30%">
		</div>
		<div style="display:flex; flex-direction: column; margin: 3vh 0;">
			<label for="password">password:</label>
			<input type="text" name="password" required style="width: 30%">
		</div>
		<div style="display:flex; flex-direction: column; margin: 3vh 0;">
			<label for="email">email:</label>
			<input type="text" name="email" required style="width: 30%">
		</div>
		<button>M'inscrire</button>
	</form>
	<%@include file="../templates/scripts.jsp" %>
</body>
</html>