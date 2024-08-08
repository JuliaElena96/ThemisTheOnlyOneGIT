document.addEventListener('DOMContentLoaded', function() {
    document.getElementById("showDialogAddCustomer").addEventListener("click", () => {
        document.getElementById("ModalAddCustomer").showModal();
    });

    document.getElementById("close-dialog").addEventListener("click", () => {
        document.getElementById("ModalAddCustomer").close();
    });
});