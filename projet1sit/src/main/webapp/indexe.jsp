<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table de multiplication par 5</title>
</head>
<body>
	<h1>Table de multiplication par 5</h1>
	<table border="1">
		<tr>
			<th>Multiplicateur</th>
			<th>Résultat</th>
		</tr>
		<%
			int nombre = 5;
			int i = 1;
			while (i <= 10) {
				int resultat = nombre * i;
		%>
		<tr>
			<td><%= nombre %> x <%= i %></td>
			<td><%= resultat %></td>
		</tr>
		<%
				i++;
			}
		%>
	</table>
</body>
</html>
