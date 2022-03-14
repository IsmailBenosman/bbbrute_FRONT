<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html lang="en">
<style>
.container {
	width: 50%;
	height: 100vh;
	font-size: 62.5%;
	font-family: "Quicksand", sans-serif;
	color: #eee;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.calendar {
	width: 45rem;
	height: 52rem;
	background-color: #222227;
	box-shadow: 0 0.5rem 3rem rgba(0, 0, 0, 0.4);
}

.month {
	width: 100%;
	height: 12rem;
	background-color: #167e56;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 2rem;
	text-align: center;
	text-shadow: 0 0.3rem 0.5rem rgba(0, 0, 0, 0.5);
}

.month i {
	font-size: 2.5em;
	cursor: pointer;
}

.month h1 {
	font-size: 3rem;
	font-weight: 400;
	text-transform: uppercase;
	letter-spacing: 0.2rem;
	margin-bottom: 1rem;
}

.month p {
	font-size: 1.6rem;
}

.weekdays {
	width: 100%;
	height: 5rem;
	padding: 0 0.4rem;
	display: flex;
	align-items: center;
}

.weekdays div {
	font-size: 1.5rem;
	font-weight: 400;
	letter-spacing: 0.1rem;
	width: calc(44.2rem/ 7);
	display: flex;
	justify-content: center;
	align-items: center;
	text-shadow: 0 0.3rem 0.5rem rgba(0, 0, 0, 0.5);
}

.days {
	width: 100%;
	display: flex;
	flex-wrap: wrap;
	padding: 0.2rem;
}

.days div {
	font-size: 1.4rem;
	margin: 0.3rem;
	width: calc(40.2rem/ 7);
	height: 5rem;
	display: flex;
	justify-content: center;
	align-items: center;
	text-shadow: 0 0.3rem 0.5rem rgba(0, 0, 0, 0.5);
	transition: background-color 0.2s;
}

.days div:hover:not(.today) {
	background-color: #262626;
	border: 0.2rem solid #777;
	cursor: pointer;
}

.prev-date, .next-date {
	opacity: 0.5;
}

.today {
	background-color: #167e56;
}
</style>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Calendar</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Accueil ${connected.maison}</title>
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
						<!--18/03/97 à ajouter dans page compte-->
						<p id="solde">SOLDE :${connected.solde }€</p>
					</div>
					<img id="photo" src="Images/profs/${connected.img }" alt="">

				</div>

				<div id="btn">
					<button id="btnModif" type="submit" class="btn">Modifier</button>
					<a href="disconnect"><button class="btnDecon"
							class="open-button">Deconnexion</button></a>
				</div>

			</div>
		</div>

		<nav class="topnav">
			<a href="home" class="navig">Evenement </a> <a href="calendrierP.jsp">Calendrier</a>
			<a href="listEleve.jsp">Cours</a> <a href="boutique.jsp">Boutique</a>
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
</head>
<body>
	<div class="container">
		<div class="calendar">
			<div class="month">
				<i class="fas fa-angle-left prev"></i>
					<div class="date">
						<h1></h1>
						<p></p>
					</div>
				<i class="fas fa-angle-right next"></i>
			</div>
			<div class="weekdays">
				<div>Dim</div>
				<div>Lun</div>
				<div>Mar</div>
				<div>Mer</div>
				<div>Jeu</div>
				<div>Ven</div>
				<div>Sam</div>
			</div>
			<div class="days"></div>
		</div>
	</div>
	<footer>

		<p>Lorem ipsum...</p>

	</footer>
	<script src="script.js"></script>
</body>
</html>