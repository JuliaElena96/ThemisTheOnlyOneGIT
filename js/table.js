
function seperateValues(dataObj) {

    let nname = "";
    let vname = "";
    let geb = "";
    let plz = "";
    let ort = "";
    let str = "";

    console.log("start seperateValues");

    //Objekt in einen Sting umwandeln
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
                nname = keyValueSeparator[1];
            }
            if (i === 1) {
                vname = keyValueSeparator[1];
            }
            if (i === 2) {
                geb = keyValueSeparator[1];
            }
            if (i === 3) {
                plz = keyValueSeparator[1];
            }
            if (i === 4) {
                ort = keyValueSeparator[1];
            }
            if (i === 5) {
                str = keyValueSeparator[1];
            }
            
           
        }
    }
    console.log("Nachname: ", nname);
    console.log("Vorname: ", vname);
    console.log("Geburtstag: ", geb);
    console.log("PLZ: ", plz);
    console.log("Ort: ", ort);
    console.log("Str: ", str);
    
    AddRow(nname, vname, geb, plz, ort, str);

}



//Tabelle erstellen
function AddRow(nname, vname,geb, plz, ort, str) {

    console.log("start AddRow");

    let table = document.getElementById('kundentabelle');
    let thead = document.createElement('thead');
    let tbody = document.createElement('tbody');

    table.appendChild(thead);
    table.appendChild(tbody);

    document.getElementById('tabellenContainer').appendChild(table);

    let newRow = document.createElement("tr");
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

    console.log("mitte AddRow");

    newRow.appendChild(nachname);
    newRow.appendChild(vorname);
    newRow.appendChild(geburtsdatum);
    newRow.appendChild(postleitzahl);
    newRow.appendChild(htmlOrt);
    newRow.appendChild(straße);

    tbody.appendChild(newRow);

    console.log("end AddRow");
}







/*

{"Nachname: ": 'Schmidt', "Vorname: ": 'Julia', "Geburtstag: ": '1978-09-15', "PLZ: ": 5020, "Ort: ": 'Salzburg', …}
"Geburtstag: "
: 
"1978-09-15"

"Nachname: "
: 
"Schmidt"
"Ort: "
: 
"Salzburg"
"PLZ: "
: 
5020
"Str: "
: 
"Mozartgasse 5"
"Vorname: "
: 
"Julia"
[[Prototype]]
: 
Object*/