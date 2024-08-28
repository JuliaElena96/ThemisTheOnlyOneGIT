$(document).ready(function() {
    $('#stammdatenForm').on('submit', function(event) {
        event.preventDefault(); // Verhindert das Standardverhalten des Formulars

        $.ajax({
            url: 'updateDB.php',
            type: 'POST',
            data: $(this).serialize() + '&kundenID=' + new URLSearchParams(window.location.search).get('kundenID'), // ID aus der URL
            success: function(response) {
                alert(response);
            },
            error: function() {
                alert('Fehler beim Speichern der Daten.');
            }
        });
    });
});