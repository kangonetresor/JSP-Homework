<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Notes</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Style pour centrer et rendre le résultat visible */
        .result {
            text-align: center;
            color: red;
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%@ include file="includes/header.jsp" %>

    <h2 style="text-align: center;">Gestion des Notes</h2>

    <%
        String step = request.getParameter("step");
        int numberOfNotes = 0;
        String resultMessage = "";

        if ("define".equals(step)) {
            // Récupération du nombre de notes à entrer
            numberOfNotes = Integer.parseInt(request.getParameter("numberOfNotes"));
            session.setAttribute("numberOfNotes", numberOfNotes);
        } else if ("calculate".equals(step)) {
            // Récupération des notes et calcul de la moyenne
            numberOfNotes = (int) session.getAttribute("numberOfNotes");
            double total = 0;

            for (int i = 1; i <= numberOfNotes; i++) {
                double note = Double.parseDouble(request.getParameter("note" + i));
                total += note;
            }

            double average = total / numberOfNotes;
            resultMessage = "La moyenne des notes est : " + average;
        }
    %>

    <!-- Étape 1 : Définir le nombre de notes -->
    <% if (step == null || "define".equals(step)) { %>
        <form action="gestionNotes.jsp" method="post">
            <input type="hidden" name="step" value="define">
            <label for="numberOfNotes">Nombre de notes :</label>
            <input type="number" id="numberOfNotes" name="numberOfNotes" min="1" required>
            <button type="submit">Valider</button>
        </form>
    <% } %>

    <!-- Étape 2 : Entrer les notes -->
    <% if ("define".equals(step)) { %>
        <form action="gestionNotes.jsp" method="post">
            <input type="hidden" name="step" value="calculate">
            <h3>Entrez les <%= numberOfNotes %> notes :</h3>
            <% for (int i = 1; i <= numberOfNotes; i++) { %>
                <label for="note<%= i %>">Note <%= i %> :</label>
                <input type="number" id="note<%= i %>" name="note<%= i %>" min="0" max="20" step="0.01" required><br>
            <% } %>
            <button type="submit">Calculer la moyenne</button>
        </form>
    <% } %>

    <!-- Affichage du résultat -->
    <% if ("calculate".equals(step)) { %>
        <div class="result"><%= resultMessage %></div>
    <% } %>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
