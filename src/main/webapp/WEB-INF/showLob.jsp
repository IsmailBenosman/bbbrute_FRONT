<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
aaaaa
Admin a = new Admin("Abid", "Jordan", "jordan", "jordan", LocalDate.parse("1993-02-23"), 900000000,"Griffondor");

<h1>Nom - prenom - Photo</h1>

<table>

	<tr><td>${profil.nom}</td><td>${profil.prenom}</td></tr>


</table>

<img src="data:image/jpg;base64,${profil.photoEncoded64}" width="240" height="300"/>

</body>
</html>