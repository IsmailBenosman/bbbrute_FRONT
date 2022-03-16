<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}


.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 15%;
 height: 550px;
}


.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}


.tab button:hover {
  background-color: #ddd;
}

.tab button.active {
  background-color: #ccc;
}


.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 85%;
  border-left: none;
  height: 550px;
}

.tab img
{
width:70%;
}
.page
{
height: 550px;
}

#resume
{
display:flex;
flex-direction: column;
justify-content: center;
align-items: center;
}

#info img
{
 width:15%;
}

#info 
{
padding: 30px;
}

.container {
  padding: 16px;
  background-color: white;
}

input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}


hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

.registerbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}


.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}


.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 30%; 
}


.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}


.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

.container h2
{
padding:40px;
}

</style>
</head>
<body>

<div class="page"> 
<div class="tab">
<div id="resume">
	<img alt="photo" src="Images/eleves/Crobin.png">
	<p> PIERSON Robin</p>
	<p> Identifiant élève: 1</p>
</div>
  <button class="tablinks" onclick="openTab(event, 'Profil')" id="defaultOpen">Profil</button>
  <button class="tablinks" onclick="openTab(event, 'Maison')">Maison</button>
  <button class="tablinks" onclick="openTab(event, 'Scolaire')">Scolaire</button>
  <button class="tablinks" onclick="openTab(event, 'Item')">Item</button>
</div>


<div id="Profil" class="tabcontent">
    <div id="info">
	<img alt="photo" src="Images/eleves/robin.jpg">
	<div id="infoPerso">
	<p> PIERSON Robin </p>
	<p> Serpentard </p>
	<p> 18/03/1997 </p>
	<p> Solde: € </p>

	<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Recharger le solde</button>

	<div id="id01" class="modal">
  		<form class="modal-content animate" action="/action_page.php" method="post">
      		<span onclick="document.getElementById('id01').style.display='none'" class="close" title="Annuler l'opération">&times;</span>
   			 <div class="container">
   				 <h2 align="center">Solde actuel:   €</h2><b/>
    			  <label for="somme"><b>Veuiller saisir le montant de la transaction</b></label>
     			 <input type="text" placeholder="Somme de la transaction" name="somme" required>
  			    <button type="submit">Valider</button>
   			 </div>
  		</form>
	</div>

    <div class="modifInfo">
  	<a href="#demo" class="btn btn-primary" data-bs-toggle="collapse">Modifier</a>
		  <div id="demo" class="collapse">
			<form action="/action_page.php">
 			 <div class="container">
  				  <h3>Modification des informations personnelle </h3>
  	 
  						 <hr>

					  	 <label for="login"><b>Login</b></label>
					    <input type="text" placeholder="Entrez votre nouveau login" name="login" id="login" required>
					
					    <label for="mdp"><b>Ancien mot de passe</b></label>
					    <input type="password" placeholder="Entrez votre ancien mot de passe" name="mdp" id="mdp" required>
					
					    <label for="mdp"><b>Nouveau mot de passe</b></label>
					    <input type="password" placeholder="Entrez votre nouveau mot de passe" name="mdp" id="mdp" required>
					
					    <hr>
					  
				</div>
			</form>
		</div>
	</div>
</div>
</div>
</div>
<div id="Maison" class="tabcontent">
  <h3>Maison</h3>
  <p>Maison, patronus,</p> 
</div>

<div id="Scolaire" class="tabcontent">
  <h3>Scolaire</h3>
  <p>notes</p>
</div>

<div id="Item" class="tabcontent">
  <h3>Item</h3>
  <p> baguette, balais, potions gagnés ou truc comme ça</p>
</div>
</div>

<script>
function openTab(evt, optionTab) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(optionTab).style.display = "block";
  evt.currentTarget.className += " active";
}


document.getElementById("defaultOpen").click();


//Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
   
</body>
</html> 
