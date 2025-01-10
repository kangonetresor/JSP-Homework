<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.example.products.DBConnection" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter un contact</title>
</head>
<body>
    <h1>Ajouter un contact</h1>
    
    <!-- Formulaire pour ajouter un contact -->
    <form action="ajouter.jsp" method="post">
        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" required><br>

        <label for="prenom">Prénom :</label>
        <input type="text" id="prenom" name="prenom" required><br>

        <label for="email">Email :</label>
        <input type="email" id="email" name="email" required><br>

        <input type="submit" value="Ajouter">
    </form>

    <%
        // Traitement du formulaire si la méthode HTTP est POST
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String email = request.getParameter("email");

            // Validation des champs côté serveur
            if (nom != null && prenom != null && email != null && !nom.isEmpty() && !prenom.isEmpty() && !email.isEmpty()) {
                Connection con = null;
                PreparedStatement pstmt = null;

                try {
                    // Connexion à la base de données
                    con = DBConnection.getConnection();

                    // Requête SQL pour insérer un nouveau contact
                    String sql = "INSERT INTO contacts (nom, prenom, email) VALUES (?, ?, ?)";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, nom);
                    pstmt.setString(2, prenom);
                    pstmt.setString(3, email);

                    int rowsInserted = pstmt.executeUpdate();

                    if (rowsInserted > 0) {
                        out.println("<p>Contact ajouté avec succès.</p>");
                    } else {
                        out.println("<p>Une erreur s'est produite lors de l'ajout du contact.</p>");
                    }
                } catch (Exception e) {
                    // Afficher une erreur lisible à l'utilisateur
                    out.println("<p>Erreur : Impossible d'ajouter le contact. Veuillez réessayer plus tard.</p>");
                    e.printStackTrace();
                } finally {
                    // Fermer les ressources
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                    if (con != null) try { con.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                }
            } else {
                out.println("<p>Veuillez remplir tous les champs du formulaire.</p>");
            }
        }
    %>

    <a href="index.jsp">Retour à la liste des contacts</a>
</body>
</html>
