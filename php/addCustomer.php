<?php
// Datenbankverbindung aufbauen
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

if ($_SERVER["REQUEST_METHOD"] == "POST") {
   
    $anrede = !empty($_POST['anrede']) ? $_POST['anrede'] : NULL;
    $titel = !empty($_POST['titel']) ? $_POST['titel'] : NULL;
    $vname = !empty($_POST['vname']) ? $_POST['vname'] : NULL;
    $nname = !empty($_POST['nname']) ? $_POST['nname'] : NULL;
    $geb = !empty($_POST['geb']) ? $_POST['geb'] : NULL;
    $plz = !empty($_POST['plz']) ? $_POST['plz'] : NULL;
    $ort = !empty($_POST['ort']) ? $_POST['ort'] : NULL;
    $str = !empty($_POST['str']) ? $_POST['str'] : NULL;
    $hausnr = !empty($_POST['hausnr']) ? $_POST['hausnr'] : NULL;
    $tuernr = !empty($_POST['tuernr']) ? $_POST['tuernr'] : NULL;
    $tel1 = !empty($_POST['tel']) ? $_POST['tel'] : NULL;
    $email = !empty($_POST['email']) ? $_POST['email'] : NULL;

       // Validierung der erforderlichen Felder
       if (empty($nname) || empty($vname) || empty($geb) || empty($plz) || empty($ort) || empty($str)) {
        echo "<script>alert('FEHLER:! Bitte füllen Sie alle erforderlichen Felder aus: Nachname, Vorname, Geburtstag, PLZ, Ort, Straße.'); window.history.back();</script>";
        exit;
    }
   
    $sql = "INSERT INTO kunden (anrede, titel, vname, nname, geb, plz, ort, str, hausnr, tuernr, tel1, email) 
    VALUES (:anrede, :titel, :vname, :nname, :geb, :plz, :ort, :str, :hausnr, :tuernr, :tel1, :email)";
    $stmt = $pdo->prepare($sql);

    $stmt->bindParam(':anrede', $anrede);
    $stmt->bindParam(':titel', $titel);
    $stmt->bindParam(':vname', $vname);
    $stmt->bindParam(':nname', $nname);
    $stmt->bindParam(':geb', $geb);
    $stmt->bindParam(':plz', $plz);
    $stmt->bindParam(':ort', $ort);
    $stmt->bindParam(':str', $str);
    $stmt->bindParam(':hausnr', $hausnr);
    $stmt->bindParam(':tuernr', $tuernr);
    $stmt->bindParam(':tel1', $tel1);
    $stmt->bindParam(':email', $email);
   
    if ($stmt->execute()) {
        echo "<script>alert('Daten erfolgreich gespeichert!'); window.location.href = 'http://localhost/ThemisTheOnlyOneGIT/index.html';</script>";
    
    
    } else {
        echo "Fehler beim Speichern der Daten.";
    }
}
?>
