<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
    
        
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
   <c:if test="${connected.getClass().getSimpleName()=='Eleve'}">
	<c:redirect url = "eleve"/>
</c:if>
<c:if test="${connected.getClass().getSimpleName()=='Prof'}">
	<c:redirect url = "prof"/>
</c:if>
   

<html>


<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/indexTest.css">
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
  <form action="home" method="post">
    <table>
    <tr>
      <td class="whiteText" >Login :</td>
      <td> <input required name="login" placeholder="login" type="login"></td>
    </tr>

    <tr>
      <td  class="whiteText" >Password :</td>
      <td><input required name="password" placeholder="Password"  type="password"></td>
    </tr>
    </table>
     <div id="errorConnect">${error}</div>

    
<br/>
    <input id="connexion" value="Se connecter" type="submit">
    
 </form>

</div>

<footer></footer>
</body>
</html>
