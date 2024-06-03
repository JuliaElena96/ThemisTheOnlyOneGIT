function einblenden(){
    document.getElementById("suchcontainer").style.visibility = "visible";
    $("#suchcontainer").show();
    document.getElementById("addCustomer").style.visibility = "visible";
    $(".addCustomer").show();
   
}
function ausblenden(){
    $(".welcome").hide();
    
}
function einblendenKundentabelle(){
    document.getElementById("kundentabelle").style.visibility = "visible";
    $("#kundentabelle").show();
}

function ausblendenFürAddCustomer(){
    document.getElementById("addCustomer").style.visibility = "hidden";
    $(".addCustomer").hide();
    document.getElementById("suchcontainer").style.visibility = "hidden";
    $(".suchcontainer").hide();
   
}

function einblendenAddCustomerContainer(){
    document.getElementById("addCustomerContainer").style.visibility = "visible";
    $(".addCustomerContainer").show();
    document.getElementById("titelAddCustomer").style.visibility = "visible";
    $(".titelAddCustomer").show();
}

