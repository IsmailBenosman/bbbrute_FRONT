<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
    
<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">
<link rel="stylesheet" href="indexTest.css">
<link href="http://fonts.cdnfonts.com/css/harry-potter" rel="stylesheet">
<title>Poudlard</title>
</head>
<body>



<video autoplay muted loop id id="video">
  <source loop src="Images\vid.mp4" type="video/mp4">
</video>

<div class="container">

<h2> Bienvenue a Poudlard</h2>
<img src="Images/HogwartsLogo2.png" alt="logo">
<h3 > Connexion </h3>
  <form>
    <table>
    <tr>
      <td>Email :</td>
      <td> <input required placeholder="Email" type="email"></td>
    </tr>

    <tr>
      <td>Password : </td>
      <td><input required placeholder="Password" pattern ="[A-z]{4,8}" type="password"></td>
    </tr>
    </table>
      </form>

    <div id="errorConnect">Saisir des identifiants valides</div>
<br/>
    <input id="connexion" value="Se connecter" type="submit">

  <!-- <br/>
  <a id="inscription" href="inscription.html"> Inscription </a> -->

</div>

<footer></footer>
</body>
</html>
    