<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Jeu</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <%@ include file="includes/header.jsp" %>
    <%
        // Récupération du nombre aléatoire et du nom depuis la session
        int randomNumber = (Integer) session.getAttribute("randomNumber");
        String name = (String) session.getAttribute("name");
        
        // Récupération de l'entrée utilisateur (si disponible)
        String userInput = request.getParameter("number");
        String message = "";
        boolean correctGuess = false;

        if (userInput != null) {
            int userNumber = Integer.parseInt(userInput);
            if (userNumber == randomNumber) {
                message = "Bravo M./Mlle " + name + ", vous avez trouvé le bon nombre !";
                correctGuess = true;
            } else if (userNumber > randomNumber) {
                message = "M./Mlle " + name + ", le nombre entré est supérieur au bon nombre.";
            } else {
                message = "M./Mlle " + name + ", le nombre entré est inférieur au bon nombre.";
            }
        }
    %>
    <h2>Jeu : Devinez le bon nombre</h2>
    <p style="text-align: center; margin-top: 20px; font-size: 18px; font-weight: bold;"><%= message %></p>

    <%
        if (!correctGuess) {
    %>
        <form action="game.jsp" method="post">
            <label for="number">Entrez un nombre :</label>
            <input type="number" id="number" name="number" required>
            <button type="submit">Vérifier</button>
        </form>
    <%  
        } else {
    %>
        <form action="gestionNotes.jsp" method="post">
            <button type="submit">Suivant</button>
        </form>
    <%  
        }
    %>
    <%@ include file="includes/footer.jsp" %>
</body>
</html>
