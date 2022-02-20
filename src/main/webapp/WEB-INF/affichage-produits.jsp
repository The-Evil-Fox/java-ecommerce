<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="Model.Produit" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/CSS/style.css">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta charset="UTF-8">
	<title>Produits</title>
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
	<div id="produits-liste">
		<c:set var="compteur" value="${1}" scope="page"/>
		<c:forEach items="${ produits }" var="produit" varStatus="status">
			<c:if test="${compteur == 1 }"  var="result" scope="page">
				<div class="ligne-articles">
			</c:if>
			<div class="produit-container">
				<img class="image-produit" src="<c:out value="${ produit.getCheminImage() }" />" alt="produit-image"/>
				<div class="produit-informations">
					<span class="libelle-produit"><c:out value="${ produit.getLibelle() }" /></span>
					<span class="prix-produit"><fmt:formatNumber var="prixarticle" type="number" minFractionDigits="2" value="${produit.getPrix()}"/><c:out value="Prix: ${prixarticle} euros"/></span>
					<c:url value="AjoutPanier" var="lienAjoutPanier">
						<c:param name="id" value="${ produit.getId() }"/>
					</c:url>
					<c:url value="SupprimerProduit" var="lienSuppressionProduit">
						<c:param name="id" value="${ produit.getId() }"/>
					</c:url>
					<a class="button-a" href="${lienAjoutPanier}">Ajouter au panier</a>
					<c:if test="${user.getPrivileges() == 1 }">
						<a class="button-a" href="${lienSuppressionProduit}">Supprimer l'article</a>
					</c:if>
				</div>
			</div>
			<c:set var="compteur" value="${compteur + 1}" scope="page"/>
			<c:if test="${compteur == 4 }"  var="result" scope="page">
				</div>
				<c:set var="compteur" value="${1}" scope="page"/>
			</c:if>
		</c:forEach>
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