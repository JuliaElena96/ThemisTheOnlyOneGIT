<?php

include 'dbManager.php';

// Prüfung des Suchbegriffs
$nname = isset($_POST["nname"]) ? $_POST["nname"] : '';
$vname = isset($_POST["vname"]) ? $_POST["vname"] : '';
$plz = isset($_POST["plz"]) ? $_POST["plz"] : '';
$ort = isset($_POST["ort"]) ? $_POST["ort"] : '';

if (!empty($nname) || !empty($vname) || !empty($plz) || !empty($ort)) {
    // Suche nach Nachnamen, Vornamen, PLZ und Ort
    $suche_nach = $pdo->prepare("SELECT * FROM kunden WHERE nname LIKE ? AND vname LIKE ? AND plz LIKE ? AND ort LIKE ?");
    $suche_nach->execute(array("%$nname%", "%$vname%", "%$plz%", "%$ort%"));


    //Ergebnis der DBAnfrage in ein Objekt speichern
    $anz = $suche_nach->rowCount();
    if ($anz == 0) {
        echo "Kein Eintrag für: $suchbegriff vorhanden";
    } else {
        $cnt = 0;
        $obj = array();
        while ($row = $suche_nach->fetch()) {
            $obj[$cnt] = [
                //die Bezeichnung der Datenabnkfelder sind Schlüssel des Arrays, nicht löschen
                
                'Nachname' => $row['nname'],
                'Vorname' => $row['vname'],
                'Geburtstag' => $row['geb'],
                'PLZ' =>  $row['plz'],
                'Ort' => $row['ort'],
                'Str' => $row['str'],
                'KundenID' => $row['kundenID']
            ];
            $cnt++;
        }

        //Json Formatierung
        /* foreach($obj as $item){
            echo "Nachname: " . $item['Nachname'] . "<br>";
            echo "Vorname: " . $item['Vorname'] . "<br>";
            echo "Geburtsdatum: " . $item['Geburtsdatum'] . "<br>";
            echo "PLZ: " . $item['PLZ'] . "<br>";
            echo "Ort: " . $item['Ort'] . "<br>";
            echo "Straße: " . $item['Straße'] . "<br>";
            echo "<br>";
        }
*/
    }

    header('Content-Type: application/json');
    echo json_encode($obj);
}
