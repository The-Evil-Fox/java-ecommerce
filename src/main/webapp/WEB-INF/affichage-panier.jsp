<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="Model.Produit" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/CSS/style.css">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
	<meta charset="UTF-8">
	<title>Mon panier</title>
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
	<c:choose>
		<c:when test="${listepanier.getQuantiteTotale() == 0 }">
			<div id="error-message-container">
				<h1>Votre panier est vide !</h1>
				<a class="button-a" href="AfficherListe">Retourner sur le catalogue</a>
			</div>
		</c:when>
		<c:otherwise>
			<div id="panier-container">
				<div id="panier-liste">
					<c:forEach items="${ listepanier.getListe() }" var="panier">
						<div class="panier-produit-container">
							<img class="image-produit" src="<c:out value="${ panier.getProduit().getCheminImage() }" />" alt="produit-image"/>
							<div class="produit-informations">
								<span class="libelle-produit"><c:out value="${ panier.getProduit().getLibelle() }"/></span>
								<span class="prix-produit">Prix: <fmt:formatNumber var="prixproduit" type="number" minFractionDigits="2" value="${panier.getProduit().getPrix()}"/><c:out value="${prixproduit} euros"/></span>
								<c:url value="ModifierQuantitePanier" var="incrementpanier">
									<c:param name="id" value="${ panier.getProduit().getId() }"/>
									<c:param name="operation" value="increment"/>
								</c:url>
								<c:url value="ModifierQuantitePanier" var="decrementpanier">
									<c:param name="id" value="${ panier.getProduit().getId() }"/>
									<c:param name="operation" value="decrement"/>
								</c:url>
								<span>Quantite: <a class="button-quantity" href="${decrementpanier}">-</a><c:out value="${ panier.getQuantite() }"/><a class="button-quantity" href="${incrementpanier}">+</a></span>
								<c:url value="SupprimerPanierFromPanierListe" var="supprimerdupanier">
									<c:param name="id" value="${ panier.getProduit().getId() }"/>
								</c:url>
								<a class="button-a" href="${supprimerdupanier}">Supprimer du panier</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id="total-panier">
					<div class="panier-details">
						<span>Total d'articles dans le panier: <c:out value="${ listepanier.getQuantiteTotale()}"/></span>
						<span>Total à payer: <fmt:formatNumber var="total" type="number" minFractionDigits="2" value="${listepanier.getMontantTotal()}"/><c:out value="${total} euros"/></span>
					</div>
					<div id="buttons-container">
						<a class="button-a" href="">Finaliser la commande</a>
						<a class="button-a" href="ViderPanier">Vider le panier</a>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
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