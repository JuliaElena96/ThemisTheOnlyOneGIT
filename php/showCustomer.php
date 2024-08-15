<?php
$host = "localhost";
$dbName = "themis";
$username = "root";
$password = "";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbName", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Verbindung zur Datenbank fehlgeschlagen: " . $e->getMessage());
}


$sql = "SELECT anrede, titel, vname, nname, str, plz, ort, geb, sozialvnr FROM kunden WHERE kundenID = 1"; // Passen Sie die Abfrage nach Bedarf an
$stmt = $pdo->prepare($sql);
$stmt->execute();
$row = $stmt->fetch(PDO::FETCH_ASSOC);

$anrede = $titel = $vname = $nname = $str = "";
if ($row) {
    $anrede = $row["anrede"];
    $titel = $row["titel"];
    $vname = $row["vname"];
    $nname = $row["nname"];
    $str = $row["str"];
    $plz = $row["plz"];
    $ort = $row["ort"];
    $geb = $row["geb"];
    $sozialvnr = $row["sozialvnr"];
} else {
    echo "Keine Daten gefunden";
}
?>
