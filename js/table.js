function removeTableRows() {
    // Löscht die vorherige Tabelle
    let previousRows = document.getElementsByClassName('tableRow');
    for (let i = previousRows.length - 1; i >= 0; i--) {
        previousRows[i].remove();
    }
}

function seperateValues(dataObj) {
    let nname = "";
    let vname = "";
    let geb = "";
    let plz = "";
    let ort = "";
    let str = "";
    let kundenID = "";

    console.log("start seperateValues");

    // Objekt in einen String umwandeln
    let myJSON = JSON.stringify(dataObj);

    // String an Kommas aufteilen
    let array = myJSON.split(",");

    // Über das resultierende Array iterieren
    for (let i = 0; i < array.length; i++) {
        // Jedes Element an den Doppelpunkten aufteilen
        let keyValueSeparator = array[i].split(":");

        // Über das resultierende Array iterieren
        for (let j = 0; j < keyValueSeparator.length; j++) {
            if (i === 0) {
                nname = keyValueSeparator[1].replace(/[\[\]{}""]/g, '');
            }
            if (i === 1) {
                vname = keyValueSeparator[1].replace(/[\[\]{}""]/g, '');
            }
            if (i === 2) {
                geb = keyValueSeparator[1].replace(/[\[\]{}""]/g, '');
            }
            if (i === 3) {
                plz = keyValueSeparator[1].replace(/[\[\]{}""]/g, '');
            }
            if (i === 4) {
                ort = keyValueSeparator[1].replace(/[\[\]{}""]/g, '');
            }
            if (i === 5) {
                str = keyValueSeparator[1].replace(/[\[\]{}""]/g, '');
            }
            if (i === 6) {
                kundenID = keyValueSeparator[1].replace(/[\[\]{}""]/g, '');
            }
        }
    }

    AddRow(nname, vname, geb, plz, ort, str, kundenID);
}

let table = document.getElementById('kundentabelle');
if (table) {
    let thead = document.createElement('thead');
    let tbody = document.createElement('tbody');

    table.appendChild(thead);
    table.appendChild(tbody);

    let container = document.getElementById('tabellenContainer');
    if (container) {
        container.appendChild(table);
    } else {
        console.error('Container element not found');
    }
} else {
    console.error('Table element not found');
}


// Tabelle erstellen
function AddRow(nname, vname, geb, plz, ort, str, kundenID) {
    console.log("start AddRow");

    let newRow = document.createElement("tr");
    newRow.setAttribute("class", "tableRow");

    let link = document.createElement('a');
    link.href = `php/kundenmaske.php?kundenID=${kundenID}`;
    link.style.display = "contents"; // Damit das <a>-Tag die gesamte Zeile umschließt

    let nachname = document.createElement('td');
    nachname.innerHTML = nname;

    let vorname = document.createElement('td');
    vorname.innerHTML = vname;

    let geburtsdatum = document.createElement('td');
    geburtsdatum.innerHTML = geb;

    let postleitzahl = document.createElement('td');
    postleitzahl.innerHTML = plz;

    let htmlOrt = document.createElement('td');
    htmlOrt.innerHTML = ort;

    let straße = document.createElement('td');
    straße.innerHTML = str;

    link.appendChild(nachname);
    link.appendChild(vorname);
    link.appendChild(geburtsdatum);
    link.appendChild(postleitzahl);
    link.appendChild(htmlOrt);
    link.appendChild(straße);

    newRow.appendChild(link);

    let tbody = document.querySelector('#kundentabelle tbody');
    if (tbody) {
        tbody.appendChild(newRow);
    } else {
        console.error('Tbody element not found');
    }
}