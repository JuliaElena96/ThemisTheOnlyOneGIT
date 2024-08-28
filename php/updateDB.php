<?php
include 'dbManager.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $kundenID = !empty($_POST['kundenID']) ? $_POST['kundenID'] : NULL;

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
    $land = !empty($_POST['land']) ? $_POST['land'] : NULL;
    $staatsbuergerschaft = !empty($_POST['staatsbuergerschaft']) ? $_POST['staatsbuergerschaft'] : NULL;
    $sozialvnr = !empty($_POST['sozialvnr']) ? $_POST['sozialvnr'] : NULL;
    $tel1 = !empty($_POST['tel1']) ? $_POST['tel1'] : NULL;
    $tel2 = !empty($_POST['tel2']) ? $_POST['tel2'] : NULL;
    $email = !empty($_POST['email']) ? $_POST['email'] : NULL;
    $beruf = !empty($_POST['beruf']) ? $_POST['beruf'] : NULL;
    $bank = !empty($_POST['bank']) ? $_POST['bank'] : NULL;
    $iban = !empty($_POST['iban']) ? $_POST['iban'] : NULL;
    $bic = !empty($_POST['bic']) ? $_POST['bic'] : NULL;

    $sql = "UPDATE kunden SET 
                anrede = :anrede, 
                titel = :titel, 
                vname = :vname, 
                nname = :nname, 
                geb = :geb, 
                plz = :plz, 
                ort = :ort, 
                str = :str, 
                hausnr = :hausnr, 
                tuernr = :tuernr, 
                land = :land, 
                staatsbuergerschaft = :staatsbuergerschaft, 
                sozialvnr = :sozialvnr, 
                tel1 = :tel1, 
                tel2 = :tel2, 
                email = :email, 
                beruf = :beruf, 
                bank = :bank, 
                iban = :iban, 
                bic = :bic 
            WHERE kundenID = :kundenID";
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
    $stmt->bindParam(':land', $land);
    $stmt->bindParam(':staatsbuergerschaft', $staatsbuergerschaft);
    $stmt->bindParam(':sozialvnr', $sozialvnr);
    $stmt->bindParam(':tel1', $tel1);
    $stmt->bindParam(':tel2', $tel2);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':beruf', $beruf);
    $stmt->bindParam(':bank', $bank);
    $stmt->bindParam(':iban', $iban);
    $stmt->bindParam(':bic', $bic);
    $stmt->bindParam(':kundenID', $kundenID);

    if ($stmt->execute()) {
        echo "Daten erfolgreich gespeichert!";
    } else {
        echo "Fehler beim Speichern der Daten.";
    }
}
