<?php
header('Content-Type: text/html; charset=utf-8');

$host = "localhost";
$dbName = "themis";
$username = "root";
$password = "";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbName;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("SET NAMES 'utf8'");
} catch (PDOException $e) {
    die("Verbindung zur Datenbank fehlgeschlagen: " . $e->getMessage());
}


$sql = "SELECT anrede, titel, vname, nname, str, hausnr, tuernr, plz, ort, 
land, staatsbuergerschaft, geb, sozialvnr, tel1,tel2, email, beruf, bank, iban, bic
 FROM kunden WHERE kundenID = 1"; // Passen Sie die Abfrage nach Bedarf an
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
    $hausnr = $row["hausnr"];
    $tuernr = $row["tuernr"];
    $plz = $row["plz"];
    $ort = $row["ort"];
    $land = $row["land"];
    $staatsbuergerschaft = $row["staatsbuergerschaft"];
    $geb = $row["geb"];
    $sozialvnr = $row["sozialvnr"];
    $tel1 = $row["tel1"];
    $tel2 = $row["tel2"];
    $email = $row["email"];
    $beruf = $row["beruf"];
    $bank = $row["bank"];
    $iban = $row["iban"];
    $bic = $row["bic"];
} else {
    echo "Keine Daten gefunden";
}
?>
