function einblenden() {
    document.getElementById("suchcontainer").style.visibility = "visible";
    $("#suchcontainer").show();
    document.getElementById("addCustomer").style.visibility = "visible";
    $(".addCustomer").show();

}
function ausblenden() {
    $(".welcome").hide();

}
function einblendenKundentabelle() {
    document.getElementById("kundentabelle").style.visibility = "visible";
    $("#kundentabelle").show();
}

function ausblendenFuerGesellschaft() {
    $("#suchcontainer").hide();
    $(".addCustomer").hide();
    $("#kundentabelle").hide();
}

function einblendenGesellschaft(){
    document.getElementById("gesellschaft").style.visibility = "visible";
    $("#gesellschaft").show();
}
