<?php
$servername = "localhost";
$username = "dba";
$password = "123";
$dbname = "glacier";

// Création de la connexion à la base de données
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérification de la connexion


if ($conn->connect_error) {
    die("La connexion à la base de données a échoué : " . $conn->connect_error);
}

// Récupération des données du formulaire
$email = $_POST['email'];
$passwordUser = $_POST['passwordUser'];
$roleUser = $_POST['roleUser'];

// Insérer les données dans la base de données
$sql = "INSERT INTO utilisateur (email, mdp, role_id) VALUES ('$email', '$passwordUser', '$roleUser')";

if ($conn->query($sql) === TRUE) {
    header('Location: http://127.0.0.1:5500/accueil.html');
  } else {
    echo "Erreur: " . $sql . "
  " . $conn->error;
  }

$conn->close();
?>
