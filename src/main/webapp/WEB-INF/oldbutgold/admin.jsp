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
		<c:when test="${connected.maison=='Griffondor'}">
		<link rel="stylesheet" href="css/AccueilSpt.css">
	</c:when>
	<c:when test="${connected.maison=='Serdaigle'}">
		<link rel="stylesheet" href="css/AccueilPs.css">
	</c:when>
</c:choose>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Accueil ${connected.maison}</title>
</head>
<body>
	<header>
		<div id="banniere">

			<a href="home"><img id="logo" src="Images/HogwartsLogo.png"
				alt="logo"> </a>

			<!-- Banniere: info perso --------------------->
			<div id="compte">

				<div id="infoglobal">

					<div id="infosleft">

						<span id="Nom"> ${connected.nom } ${connected.prenom} </span>
						<!--18/03/97 à ajouter dans page compte-->
						<p id="solde">SOLDE :${connected.solde }€</p>
					</div>
					<img id="photo" src="css/Images/Images/admin/${connected.img }" alt="">

				</div>

				<div id="btn">
					<button id="btnModif" type="submit" class="btn">Modifier</button>
					<a href="disconnect"><button class="btnDecon"
							class="open-button">Deconnexion</button></a>
				</div>

			</div>
		</div>

		<nav class="topnav">
			<a href="home" class="navig">Evenement </a> <a
				href="calendrierP.jsp">Calendrier</a> <a href="eleves">Cours</a>
			<a href="boutique.jsp">Boutique</a>
			<a href="listeEleves.jsp">Liste de tous les élèves</a>
			<a href="listeProfs.jsp">Liste de tous les profs</a>
			<form action="/action_page.php">
				<div class="search-container">
					<form action="/action_page.php">
						<input type="text" placeholder="Search.." name="search">
						<button type="submit">
							<i class="fa fa-search"></i>
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
					</form>
				</div>
			</form>
		</nav>
	</header>


	<section class="page">

		<div class="container">
			<div class="slideshow-container">
				<h1>Evenements à venir</h1>
				<div class="mySlides1 fade">
					<img src="css/Images/Images/Gallerie/Tournois.png" style="width: 100%">
					<div class="content">
						<h1>Tournois des 4 maisons</h1>
						<a class="lirePlus" href="">Lire plus...</a>
					</div>
				</div>

				<div class="mySlides1 fade">
					<img src="css/Images/Images/Gallerie/Bal.jpg" style="width: 100%">
					<div class="content">
						<h1>Bal de Noel</h1>
						<a class="lirePlus" href="">Lire plus...</a>
					</div>
				</div>

				<div class="mySlides1 fade">
					<img src="css/Images/Images/Gallerie/banquet.jpeg" style="width: 100%">
					<div class="content">
						<h1>Banquet de fin d'année</h1>
						<a class="lirePlus" href="">Lire plus...</a>
					</div>
				</div>

				<a class="prev" onclick="plusSlides(-1, 0)">&#10094;</a> <a
					class="next" onclick="plusSlides(1, 0)">&#10095;</a>


			</div>
			<br />
			<br />
			<div style="text-align: center">
				<span class="dot" onclick="currentSlide(1)"></span> <span
					class="dot" onclick="currentSlide(2)"></span> <span class="dot"
					onclick="currentSlide(3)"></span>
			</div>
		</div>
		<br />
		<br />
		<br />



		<section id="texte">
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum
				dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
				incididunt ut labore et dolore magna aliqua. Ut enim ad minim
				veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
				ea commodo consequat. Duis aute irure dolor in reprehenderit in
				voluptate velit esse cillum dolore eu fugiat nulla pariatur.
				Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
				officia deserunt mollit anim id est laborum. >Lorem ipsum dolor sit
				amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
				ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
				nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
				consequat. Duis aute irure dolor in reprehenderit in voluptate velit
				esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
				cupidatat non proident, sunt in culpa qui officia deserunt mollit
				anim id est laborum.</p>
			
		</section>


		<footer>

			<p>Lorem ipsum...</p>

		</footer>
	</section>
</body>

<script>
	var slideIndex = 1;
	showSlides(slideIndex);

	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides1");
		var dots = document.getElementsByClassName("dot");
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
	}
	function Skill() {

		var x = document.getElementById("myForm");
		if (x.style.display === "block") {
			closeForm()
		} else {
			;
			openForm();
		}
	}

	function openForm() {
		document.getElementById("myForm").style.display = "block";
	}

	function closeForm() {
		document.getElementById("myForm").style.display = "none";
	}
</script>
</html>
