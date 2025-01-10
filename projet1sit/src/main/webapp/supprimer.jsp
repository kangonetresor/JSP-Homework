<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.example.products.DBConnection" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Supprimer un Contact</title>
</head>
<body>
    <h1>Supprimer un Contact</h1>

    <%
        // Récupération de l'identifiant du contact à supprimer
        String idParam = request.getParameter("id");
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean contactSupprime = false;

        try {
            if (idParam != null) {
                int id = Integer.parseInt(idParam); // Convertir l'ID en entier
                con = DBConnection.getConnection();
                String sql = "DELETE FROM contacts WHERE id = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, id);

                int rowsDeleted = pstmt.executeUpdate();
                if (rowsDeleted > 0) {
                    contactSupprime = true;
                }
            }
        } catch (Exception e) {
            out.println("<p>Erreur lors de la suppression : " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        }
    %>

    <%
        if (contactSupprime) {
    %>
        <p>Contact supprimé avec succès.</p>
    <%
        } else {
    %>
        <p>Impossible de supprimer le contact. Veuillez vérifier l'ID ou réessayer plus tard.</p>
    <%
        }
    %>

    <a href="index.jsp">Retour à la liste des contacts</a>
</body>
</html>
