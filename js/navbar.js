
function einblendenKundentabelle() {
    document.getElementById("kundentabelle").style.visibility = "visible";
    $("#kundentabelle").show();
}

$(document).ready(function() {
    $('.tab-button').click(function() {
        var tabId = $(this).data('tab');
        $('.tab-button').removeClass('active');
        $(this).addClass('active');
        $('.tab').removeClass('active');
        $('#' + tabId).addClass('active');
    });
});