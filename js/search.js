document.addEventListener('DOMContentLoaded', function() {
    $myFetch.debug = false;
    $myFetch.timeout = 5000;

    const formEl = document.getElementById("formSearch");
    const $nnameEl = document.getElementById("nname");
    const $vnameEl = document.getElementById("vname");
    const $plzEl = document.getElementById("plz");
    const $ortEl = document.getElementById("ort");

    if (formEl && $nnameEl && $vnameEl && $plzEl && $ortEl) {
        const $myPostUrl = formEl.getAttribute("action"); // greift auf das Attribut action in index.html zu

        formEl.addEventListener("submit", formSearchSubmit);

        function formSearchSubmit(event) {
            event.preventDefault();

            let sendData = {
                nname: $nnameEl.value,
                vname: $vnameEl.value,
                plz: $plzEl.value,
                ort: $ortEl.value
            };

            // Objekt in einen String im JSON-Format umwandeln
            console.log(`formSearchSubmit ${JSON.stringify(sendData)}`);
            $myPost($myPostUrl, sendData, receiveJsonData, receiveTextData, receiveError); // HTTP-POST-Anforderung senden

            function receiveJsonData(dataObj) {
                console.log(`receiveJsonData : ${JSON.stringify(dataObj)}`);
                console.log(`receiveJsonData Length : ${dataObj.length}`);

                removeTableRows();
                for (let i = 0; i < dataObj.length; i++) {
                    seperateValues(dataObj[i]);
                }
            }

            function receiveTextData(dataText) {
                console.log(`receiveTextData : ${dataText}`);
                dataObj = JSON.parse(dataText);
            }

            function receiveError(error) {
                console.error(`Error: ${error}`);
                removeTableRows();
            }
        }
    } else {
        console.error('One or more form elements not found');
    }
});