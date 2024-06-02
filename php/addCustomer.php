<?php
// Datenbankverbindung aufbauen
$host = "localhost";
$dbName = "Themis";
$username = "root";
$password = "";

$pdo = new PDO("mysql:host=$host;dbname=$dbName", $username, $password);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $titel = $_POST['titel'];
    $nname = $_POST['nname'];
    $vname = $_POST['vname'];
    $geb = $_POST['geb'];
    $sozialvnr = $_POST['sozialvnr'];
    $email = $_POST['email'];
    $plz = $_POST['plz'];
    $ort = $_POST['ort'];
    $str = $_POST['str'];
    
    // Prepared statement for inserting new record
    $statement = $pdo->prepare("INSERT INTO Kunden (titel, nname, vname, geb, sozialvnr, email, plz, ort, str)
    VALUES 
        (?,?,?,?,?,?,?,?,?)");
    $success = $statement->execute([$titel, $nname, $vname, $geb, $sozialvnr, $email, $plz, $ort, $str]);

    if ($success) {
        echo "Neuer Datensatz wurde erfolgreich hinzugefügt.";
    } else {
        echo "Fehler beim Hinzufügen des Datensatzes.";
    }
} else {
    echo "Keine Daten übermittelt.";
}












?>
