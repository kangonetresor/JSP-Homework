<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*, com.example.products.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
	<title>Liste des contacts</title>
</head>
<body>
	<h1>Liste des contacts</h1>
	<a href="ajouter.jsp">Ajouter un contact</a>
	<%
 		Connection con = null;
 		Statement stmt = null;
 		ResultSet rs = null;
 		try {
 		con = DBConnection.getConnection();
 		stmt = con.createStatement();
 		rs = stmt.executeQuery("SELECT * FROM contacts");
 	%>
 	<table border="1">
 		<tr>
 			<th>ID</th>
 			<th>Nom</th>
 			<th>Prénom</th>
 			<th>Email</th>
 			<th>Actions</th>
 		</tr>
 		<% while (rs.next()) { %>
 			<tr>
 				<td><%= rs.getInt("id") %></td>
 				<td><%= rs.getString("nom") %></td>
 				<td><%= rs.getString("prenom") %></td>
 				<td><%= rs.getString("email") %></td>
 				<td>
 					<a href="modifier.jsp?id=<%= rs.getInt("id") %>">Modifier</a>
 					<a href="supprimer.jsp?id=<%= rs.getInt("id") %>">Supprimer</a>
 				</td>
 			</tr>
 		<% } %>
 	</table>
 	<%
 		} catch (Exception e) {
 		e.printStackTrace();
 		} finally {
 		if (rs != null) rs.close();
 		if (stmt != null) stmt.close();
 		if (con != null) con.close();
 		}
 	%>
</body>
</html>