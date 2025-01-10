<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <header>
        <img src="images/esatic_logo.png" alt="Logo ESATIC" class="logo">
    </header>

    <form action="validate.jsp" method="post">
        <h2>Connexion</h2>
        <label for="login">Login :</label>
        <input type="text" id="login" name="login" required>
        
        <label for="password">Mot de passe :</label>
        <input type="password" id="password" name="password" required>
        
        <label for="name">Nom :</label>
        <input type="text" id="name" name="name">
        
        <button type="submit">Se connecter</button>
    </form>
    
    <%@ include file="includes/footer.jsp" %>
</body>
</html>
