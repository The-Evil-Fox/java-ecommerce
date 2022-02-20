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
	<title>Profil</title>
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
	<div id="container-profil">
		<h1>Mon profil <c:choose><c:when test="${user.getPrivileges() == 0 }">client</c:when><c:otherwise>administrateur</c:otherwise></c:choose>:</h1>
		<div id="profil-infos-container">
			<h3>Nom: <c:out value="${user.getNom() }"/></h3>
			<h3>Prenom: <c:out value="${user.getPrenom() }"/></h3>
			<h3>Adresse e-mail: <c:out value="${user.getEmail() }"/></h3>
		</div>
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