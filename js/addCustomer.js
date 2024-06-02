$myFetch.debug = false;
$myFetch.timeout = 5000;

const formAddEl = document.getElementById("formAddCustomer");

//const $anrede = document.getElementById("anrede");
const $titel = document.getElementById("titel");
const $nnameEl = document.getElementById("nname");
const $vnameEl = document.getElementById("vname");
const $gebEl = document.getElementById("geb");
const $sozialvnrEl = document.getElementById("sozialvnr");
const $emailEl = document.getElementById("email");
const $plzEl = document.getElementById("plz");
const $ortEl = document.getElementById("ort");
const $strEl = document.getElementById("str");

const $myPostUrl = formAddEl.getAttribute("action");

f1El.addEventListener("submit", formAddSubmit);
var recObj = {};

function formAddSubmit(ev) {
    ev.preventDefault();

    sendData = {
        $titel: $titel.value,
        $nname: $nnameEl.value,
        $vname: $vnameEl.value,
        $geb: $gebEl.value,
        $sozialvnr: $sozialvnrEl.value,
        $email: $emailEl.value,
        $plz: $plzEl.value,
        $ort: $ortEl.value,
        $str: $strEl.value

    };

    console.log(`formAddSubmit ${JSON.stringify(sendData)}`);
    $myPost($myPostUrl, sendData, receiveJsonData, receiveTextData, receiveError);
}

function receiveJsonData(dataObj) {
    console.log(`receiveJson : ${JSON.stringify(dataObj)}`);

}

function receiveTextData(text) {
    console.log(`receiveTextData: ${text}`);
}

function receiveError(err) {
    // Handle errors, if needed
}