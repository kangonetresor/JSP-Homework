// Validation côté client pour le formulaire de connexion
document.addEventListener("DOMContentLoaded", function () {
    const loginForm = document.querySelector("form");

    if (loginForm) {
        loginForm.addEventListener("submit", function (event) {
            const loginInput = document.querySelector("#login");
            const passwordInput = document.querySelector("#password");

            if (!loginInput.value || !passwordInput.value) {
                alert("Veuillez remplir tous les champs.");
                event.preventDefault(); // Empêche la soumission du formulaire
            } else {
                console.log("Formulaire soumis avec succès !");
            }
        });
    }
});

// Animation d'apparition pour les messages
function showMessage(message) {
    const messageElement = document.querySelector(".message");
    if (messageElement) {
        messageElement.textContent = message;
        messageElement.style.opacity = 0;
        messageElement.style.transition = "opacity 1s";
        setTimeout(() => {
            messageElement.style.opacity = 1;
        }, 100);
    }
}

// Exemple d'utilisation de showMessage
// showMessage("Bienvenue sur le site !");
