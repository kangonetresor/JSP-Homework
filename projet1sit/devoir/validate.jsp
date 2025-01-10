<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Validation</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<%@ include file="includes/header.jsp" %>
    <%
        // Récupération des informations saisies
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        
        // Validation des identifiants
        String expectedLogin = "Lakop21";
        String expectedPassword = "SITW";
        
     	// Initialisation d'un nombre aléatoire entre 1 et 100
        int randomNumber = (int) (Math.random() * 100) + 1;
        session.setAttribute("randomNumber", randomNumber);
        session.setAttribute("name", name);
        
        if (login.equals(expectedLogin) && password.equals(expectedPassword)) {
    %>
            <h2>Bienvenue, <%= name %>!</h2>
            
            <p style="text-align: center; margin-top: 20px; font-size: 18px; font-weight: bold;">
    			Connexion réussie.
			</p>
            
            
            <!-- Début du jeu -->
            <form action="game.jsp" method="post">
                <div style="text-align: center; margin-top: 30px;">
    <input 
        type="submit" 
        value="Commencer le jeu" 
        style="
            background-color: #4CAF50; 
            color: white; 
            border: none; 
            padding: 12px 25px; 
            font-size: 18px; 
            font-weight: bold; 
            border-radius: 8px; 
            cursor: pointer; 
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2); 
            transition: transform 0.2s ease, background-color 0.3s ease;"
        onmouseover="this.style.backgroundColor='#45a049'; this.style.transform='scale(1.05)';"
        onmouseout="this.style.backgroundColor='#4CAF50'; this.style.transform='scale(1)';"
    >
</div>

            </form>
    <%  
        } else {
    %>
            <h2>Erreur de connexion</h2>
            <p>Le login ou le mot de passe est incorrect.</p>
            <a href="index.jsp">Retour à la page de connexion</a>
    <%  
        }
    %>
    
    <%@ include file="includes/footer.jsp" %>
</body>
</html>
