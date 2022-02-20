<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inscription</title>
</head>
<body>

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

</body>
</html>