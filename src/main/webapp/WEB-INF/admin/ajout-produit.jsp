<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="../../templates/header.jsp" %>
	<title>Ajouter un produit</title>
</head>
<body>
	<%@include file="../../templates/navbarAuthentified.jsp" %>
	<div id="container-ajout-produit">
		<h1>Ajouter un nouveau produit</h1>
		<form method="post" action="AjoutProduit" id="ajoutproduit">
			<div class="input-group">
				<label for="id">ID du produit:</label>
				<input type="text" name="id" id="id" required>
			</div>
			<div class="input-group">
				<label for="libelle">Libelle du produit:</label>
				<input type="text" name="libelle" id="libelle" required>
			</div>
			<div class="input-group">
				<label for="cheminimage">Chemin de l'image:</label>
				<input type="text" name="cheminimage" id="cheminimage">
			</div>
			<div class="input-group">
				<label for="cheminimage">Prix de vente:</label>
				<input type="text" name="prix" id="prix" required>
			</div>
			<input class="button-a validationformulaire" type="submit" value="Valider"/>
		</form>
	</div>
	<%@include file="../../templates/scripts.jsp" %>
</body>
</html>