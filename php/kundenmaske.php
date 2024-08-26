<?php
include 'showCustomer.php';
?>

<!DOCTYPE html>
<html lang="de">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <link href="../css/modalAddCustomer.css" type="text/css" rel="stylesheet">
    <link href="../css/kundenmaske.css" type="text/css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap"
        rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/05dca2dd9b.js" crossorigin="anonymous"></script>




    <title>Themis</title>
    <link rel="icon" type="image/x-icon" href="../pic/LogoCutted.png">
</head>

<body>


    <div class="n_top">
        <div class="navContainer">
            <img id="logo" src="../pic/LogoCutted.png" alt="Themis Logo" onclick="window.location.href='../index.html';">
            <ul id="navlist">
                <li><a href="#" class="tab-button active" data-tab="stammdaten">Stammdaten</a></li>
                <li><a href="#" class="tab-button" data-tab="vertraegeKunde">Verträge</a></li>
                <li><a href="#" class="tab-button" data-tab="dokumente">Dokumente</a></li>
                <li><a href="#" class="tab-button" data-tab="beziehungen">Beziehungen</a></li>
            </ul>
        </div>
    </div>


    <!--Stammdaten Tab-->
    <div class="tab active" id="stammdaten">
        <div class="stammdatenContainer">
            <div class="tables">
                <table class="tableLeft">
                    <!--First Row-->
                    <tr>
                        <td><label for="anrede">Anrede</label> /
                            <label for="titel">Titel</label>
                        </td>
                        <td>
                            <table>
                                <td>
                                    <select type="text" id="anrede" name="anrede">
                                        <option value="" disabled hidden>Bitte auswählen</option>
                                        <option value="herr" <?php echo ($anrede == 'herr') ? 'selected' : ''; ?>>Herr</option>
                                        <option value="frau" <?php echo ($anrede == 'frau') ? 'selected' : ''; ?>>Frau</option>
                                        <option value="divers" <?php echo ($anrede == 'divers') ? 'selected' : ''; ?>>Divers</option>
                                    </select>
                                </td>
                                <td> <input type="text" id="titel" name="titel" value="<?php echo htmlspecialchars($titel); ?>"></td>
                            </table>
                        </td>
                    </tr>
                    <!--Second Row-->
                    <tr>
                        <td><label for="vname">Vorname</label></td>
                        <td><input type="text" id="vname" name="vname" value="<?php echo htmlspecialchars($vname); ?>"></td>
                    </tr>
                    <tr>
                        <td><label for="nname">Nachname</label></td>
                        <td><input type="text" id="nname" name="nname" value="<?php echo htmlspecialchars($nname); ?>"></td>
                    </tr>
                    <!--Third Row-->
                    <tr>

                        <td><label for="str">Straße</label></td>

                        <td>
                            <table>
                                <td><input type="text" id="str" name="str" value="<?php echo htmlspecialchars($str); ?>"></td>
                                <td><input type="text" id="hausnr" name="hausnr" value="<?php echo htmlspecialchars($hausnr); ?>"></td>
                                <td><input type="text" id="tuernr" name="tuernr" value="<?php echo htmlspecialchars($hausnr); ?>"></td>
                            </table>
                        </td>

                    </tr>
                    <tr>
                        <td><label for="plz">PLZ</label> /
                            <label for="ort">Ort</label>
                        </td>
                        <td>
                            <table>
                                <td><input type="text" id="plz" name="plz" value="<?php echo htmlspecialchars($plz); ?>"></td>
                                <td><input type="text" id="ort" name="ort" value="<?php echo htmlspecialchars($ort); ?>"></td>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="land">Land</label> /
                            <label for="staatsbuergerschaft">Staatsbürgerschaft</label>
                        </td>
                        <td>
                            <table>
                                <td><input type="text" id="land" name="land" value="<?php echo htmlspecialchars($land); ?>"></td>
                                <td><input type="text" id="staatsbuergerschaft" name="staatsbuergerschaft" value="<?php echo htmlspecialchars($staatsbuergerschaft); ?>"></td>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="geb">Geburtsdatum</label> /
                            <label for="sozialvnr">SVNR</label>
                        </td>
                        <td>
                            <table>
                                <td><input type="date" id="geb" name="geb" value="<?php echo htmlspecialchars($geb); ?>"></td>
                                <td><input type="text" id="sozialvnr" name="sozialvnr" value="<?php echo htmlspecialchars($sozialvnr); ?>"></td>
                            </table>
                        </td>
                    </tr>
                </table>

                <table class="tableRight">
                    <tr>
                        <td><label for="tel1">Telefon Mobil</label></td>
                        <td><input type="text" id="tel1" name="tel1" value="<?php echo htmlspecialchars($tel1); ?>"></td>
                    </tr>
                    <tr>
                        <td><label for="tel2">Telefon Privat</label></td>
                        <td><input type="text" id="tel2" name="tel2" value="<?php echo htmlspecialchars($tel2); ?>"></td>
                    </tr>
                    <tr>
                        <td><label for="email">E-Mail</label></td>
                        <td><input type="text" id="email" name="email" value="<?php echo htmlspecialchars($email); ?>"></td>
                    </tr>
                    <tr>
                        <td><label for="beruf">Beruf</label></td>
                        <td><input type="text" id="beruf" name="beruf" value="<?php echo htmlspecialchars($beruf); ?>"></td>
                    </tr>
                    <tr>
                        <td><label for="bank">Bank-Insitut</label></td>
                        <td><input type="text" id="bank" name="bank" value="<?php echo htmlspecialchars($bank); ?>"></td>
                    </tr>
                    <tr>
                        <td><label for="iban">IBAN</label></td>
                        <td><input type="text" id="iban" name="iban" value="<?php echo htmlspecialchars($iban); ?>"></td>
                    </tr>
                    <tr>
                        <td><label for="bic">BIC</label></td>
                        <td><input type="text" id="bic" name="bic" value="<?php echo htmlspecialchars($bic); ?>"></td>
                    </tr>
                </table>


            </div>
        </div>
        <div id="containerForBtn">
            <button>Schließen</button>
            <button>Speichern</button>
        </div>
    </div>
    <!--Stammdaten Tab Ende-->

    <!--Verträge Tab-->
    <div class="tab" id="vertraegeKunde">
        <h1>Verträge</h1>
    </div>
    <!--Verträge Ende-->

    <!--Wiedervolgage Tab-->
    <div class="tab" id="dokumente">
        <h1>Wiedervolgage</h1>
    </div>

    <!--Gesellschaft Tab-->
    <div class="tab" id="beziehungen">
        <h1>Gesellschaft</h1>
    </div>



</body>

<script src="../js/myFetch.js"></script>
<script src="../js/navbar.js"></script>
<script src="../js/table.js"></script>
<script src="../js/search.js"></script>
<script src="../js/addCustomer.js"></script>
<script src="../js/showCustomer.js"></script>

</html>