<?php


include 'dbManager.php';
if (isset($_GET['kundenID'])) {
    $kundenID = $_GET['kundenID'];
} else {
    echo "Keine Kunden-ID übergeben.";
    exit; // Skript beenden, wenn keine ID übergeben wurde
}

$sql = "SELECT anrede, titel, vname, nname, str, hausnr, tuernr, plz, ort, 
land, staatsbuergerschaft, geb, sozialvnr, tel1,tel2, email, beruf, bank, iban, bic
 FROM kunden WHERE kundenID = ?"; 
$stmt = $pdo->prepare($sql);
$stmt->execute([$kundenID]);
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
