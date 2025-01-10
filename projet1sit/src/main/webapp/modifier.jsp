<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.example.products.DBConnection" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier un Contact</title>
</head>
<body>
    <h1>Modifier un Contact</h1>

    <%
        // Récupération de l'identifiant du contact
        String idParam = request.getParameter("id");
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int id = 0;
        String nom = "", prenom = "", email = "";

        try {
            id = Integer.parseInt(idParam); // Convertir l'id en entier
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM contacts WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                nom = rs.getString("nom");
                prenom = rs.getString("prenom");
                email = rs.getString("email");
            } else {
                out.println("<p>Aucun contact trouvé avec cet ID.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        }
    %>

    <!-- Formulaire de modification -->
    <form action="modifier.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" value="<%= nom %>" required><br>

        <label for="prenom">Prénom :</label>
        <input type="text" id="prenom" name="prenom" value="<%= prenom %>" required><br>

        <label for="email">Email :</label>
        <input type="email" id="email" name="email" value="<%= email %>" required><br>

        <input type="submit" value="Modifier">
    </form>

    <%
        // Si une requête POST est reçue, mettre à jour le contact
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String newNom = request.getParameter("nom");
            String newPrenom = request.getParameter("prenom");
            String newEmail = request.getParameter("email");

            try {
                con = DBConnection.getConnection();
                String updateSql = "UPDATE contacts SET nom = ?, prenom = ?, email = ? WHERE id = ?";
                pstmt = con.prepareStatement(updateSql);
                pstmt.setString(1, newNom);
                pstmt.setString(2, newPrenom);
                pstmt.setString(3, newEmail);
                pstmt.setInt(4, id);

                int rowsUpdated = pstmt.executeUpdate();

                if (rowsUpdated > 0) {
                    out.println("<p>Contact mis à jour avec succès.</p>");
                } else {
                    out.println("<p>Erreur : Impossible de mettre à jour le contact.</p>");
                }
            } catch (Exception e) {
                out.println("<p>Erreur SQL : " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            }
        }
    %>

    <a href="index.jsp">Retour à la liste des contacts</a>
</body>
</html>
