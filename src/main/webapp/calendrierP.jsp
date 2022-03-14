<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html lang="en">
<style>
.container {
	width: 50%;
	font-family: "Quicksand", sans-serif;
	color: #eee;
	justify-content: center;
	align-items: center;
	margin: 0;
	padding: 0;

}

.calendar {
	width: 25rem;
	height: 23rem;
	background-color: #222227;
	box-shadow: 0 0.5rem 3rem rgba(0, 0, 0, 0.4);
}

.month a
{
position: relative;
top:20px;
}


.month {
	width: 100%;
	height: 5rem;
	background-color: #167e56;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 2rem;
	text-align: center;
	text-shadow: 0 0.3rem 0.5rem rgba(0, 0, 0, 0.5);
}


.month h1 {
	font-size: 1rem;
	font-weight: 400;
	text-transform: uppercase;
	letter-spacing: 0.2rem;
	margin-bottom: 1rem;
}

.month p {
	font-size: 0.8rem;
}

.weekdays {
	width: 100%;
	height: 2rem;
	padding: 15px;
	display: flex;
	justify-content:space-around;
	align-items: center;
}

.weekdays div {
	font-size: 1rem;
	font-weight: 400;
	letter-spacing: 0.1rem;
	width: calc(20.2rem/ 7);
	text-shadow: 0 0.3rem 0.5rem rgba(0, 0, 0, 0.5);
}

.days {
	width: 100%;
	display: flex;
	flex-wrap: wrap;
	padding: 0.2rem;
}

.days div {
	font-size: 0.8rem;
	margin: 0.3rem;
	width: calc(20.1rem/ 7);
	height: 2rem;
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


.caption
{
	width: 25rem;
	background-color: #222227;
}

.caption table
{
	color: #eee;
	padding:20px;
	
}

.square {
  height: 10px;
  width: 10px;
  background-color: #555;
}

table td
{
padding:10px;
}

#color1
{
 background-color:darksalmon;
}
#color2
{
 background-color: lightgreen;
}
#color3
{
 background-color: lightblue;
}
#color4
{
 background-color: yellow;
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
	<section class="container">
		<aside class="calendar">
			<div class="month">
			<a class="fas fa-angle-left prev"></a>
			<div class="top">
				
					<div class="date">
						<h1></h1>
						<p></p>
					</div>
			
			</div>
				<a class="fas fa-angle-right next"></a>
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
		</aside>
		<aside class="caption">
		<table>
		<tr>
		<td > <div class="square" id="color1"></div></td>
		<td>Matière 1</td>
		</tr>
		<tr>
		<td ><div class="square" id="color2"></div></td>
		<td>M1</td>
		</tr>
		<tr>
		<td > <div class="square" id="color3"></div></td>
		<td>M1</td>
		</tr>
		<tr>
		<td ><div class="square" id="color4"></div></td>
		<td>M1</td>
		</tr>
		</table>
		</aside>
			
		
	</section>
	<footer>

		<p>Lorem ipsum...</p>

	</footer>
	<script src="script.js"></script>
</body>
</html>