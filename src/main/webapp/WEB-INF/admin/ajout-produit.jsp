<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/CSS/style.css">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta charset="ISO-8859-1">
	<title>Ajouter un produit</title>
</head>
<body>
	<div class="topnav" id="myTopnav">
	   <a id="home-link" href="AfficherListe"><img id="logo-magasin" alt="logo-magasin" src="https://upload.wikimedia.org/wikipedia/fr/7/7a/Alien_Swarm_Logo.png"></a>
	   <div class="dropdown">
	     <button class="dropbtn">Compte
	     </button>
	     <div class="dropdown-content">
	       <a href="AfficherProfil">Mon profil</a>
	     </div>
	   </div>
	   <c:if test="${user.getPrivileges() == 1 }">
		   <div class="dropdown">
		     <button class="dropbtn">Administration
		     </button>
		     <div class="dropdown-content">
		       <a href="AjouterProduit">Ajout produit</a>
		     </div>
		   </div>
	   </c:if>
	   <a href="DeconnectUser">Déconnexion</a>
	    <a href="AffichePanier" id="panier-navbar">
	    	<img id="panier-logo" alt="panier-logo" title="afficher mon panier" src="https://www.innis-coiffure.com/images/pannier-grand.png">
		   	<c:choose>
				<c:when test="${listepanier.getQuantiteTotale() == 0 }"></c:when>
				<c:when test="${listepanier.getQuantiteTotale() == 1 }">
					<c:out value="(${listepanier.getQuantiteTotale() } article)" />
				</c:when>
				<c:when test="${listepanier.getQuantiteTotale() > 1 }">
					<c:out value="(${listepanier.getQuantiteTotale() } articles)" />
				</c:when>
			</c:choose>
		</a>
	   <a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
	</div>
	<div id="container-ajout-produit">
		<h1>Ajouter un nouveau produit</h1>
		<form method="post" action="AjoutProduit">
			<div style="display:flex; flex-direction: column; margin: 3vh 0;">
				<label for="id">ID du produit:</label>
				<input type="text" name="id" required style="width: 30%">
			</div>
			<div style="display:flex; flex-direction: column; margin: 3vh 0;">
				<label for="libelle">Libelle du produit:</label>
				<input type="text" name="libelle" required style="width: 30%">
			</div>
			<div style="display:flex; flex-direction: column; margin: 3vh 0;">
				<label for="cheminimage">Chemin de l'image:</label>
				<input type="text" name="cheminimage" required style="width: 30%">
			</div>
			<div style="display:flex; flex-direction: column; margin: 3vh 0;">
				<label for="cheminimage">Prix de vente:</label>
				<input type="text" name="prix" required  style="width: 30%">
			</div>
			<input class="button-a" type="submit" value="Valider"/>
		</form>
	</div>
	<script type="text/javascript">
		// Responsive navbar function
		function myFunction() {
			  var x = document.getElementById("myTopnav");
			  if (x.className === "topnav") {
			    x.className += " responsive";
			  } else {
			    x.className = "topnav";
			  }
			}
	</script>
</body>
</html>