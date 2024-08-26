<?php
header('Content-Type: text/html; charset=utf-8');
// Datenbankverbindung aufbauen
$host = "localhost";
$dbName = "Themis";
$username = "root";
$password = "";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbName", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Verbindung zur Datenbank fehlgeschlagen: " . $e->getMessage());
}



?>