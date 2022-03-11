<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<meta charset="utf-8">
<c:choose>
	<c:when test="${connected.maison=='Serpentard'}">
		<link rel="stylesheet" href="css/AccueilSpt.css">
	</c:when>
	<c:when test="${connected.maison=='Poufsouffle'}">
		<link rel="stylesheet" href="css/AccueilPs.css">
	</c:when>
</c:choose>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Liste des Eleves</title>
</head>
<body>
	<header>
		<div id="banniere">

			<a href="home"><img id="logo" src="Images/HogwartsLogo.png"
				alt="logo"> </a>

			<div id="compte">

				<div id="infoglobal">

					<div id="infosleft">

						<span id="Nom"> ${connected.nom } ${connected.prenom} </span>

						<p id="solde">SOLDE :${connected.solde }€</p>
					</div>
					<img id="photo" src="Images/profs/${connected.img }" alt="">
					<!--               <img id="photo" src="Images/ProfP.png" alt=""> -->
				</div>

				<div id="btn">
					<button id="btnModif" type="submit" class="btn">Modifier</button>
					<a href="disconnect"><button id="btnDecon" class="open-button">Deconnexion</button></a>
				</div>

			</div>
		</div>

		<nav class="topnav">
			<a href="#home">Home </a> 
			<a href="#home" class="navig">Eleves </a> 
			<a href="#contact">Option 3</a>
			<a href="#contact">Option 4</a>
			<form action="/action_page.php">
				<div class="search-container">
					<form action="/action_page.php">
						<input type="text" placeholder="Search.." name="search">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</form>
		</nav>
	</header>


	<section class="page" id="listEleve">
		<h2>Liste des Eleves de la maison ${connected.maison}</h2>
		<table >
			<thead>
				<tr align="center">
					<th>Numero Etudiant</th>
					<th>Nom</th>
					<th>Prenom</th>
					
				</tr>
			</thead>
			<tbody>
				<%-- <c:forEach items="${connected.maison}" var="m"> --%>
					<tr align="center">
					
					<td> Venez </td>
						<td> On est</td>
						<td> bien</td>
						
				<%-- 		<td>${m.id}</td>
						<td>${m.nom}</td>
						<td>${m.prenom}</td> --%>
					</tr>
				<%-- </c:forEach> --%>
			</tbody> 
		</table>
		<footer>

			<p>Lorem ipsum...</p>

		</footer>
	</section> 
</body>
</html>
