document.addEventListener('DOMContentLoaded', function() {
    const showDialogButton = document.getElementById("showDialogAddCustomer");
    const modalAddCustomer = document.getElementById("ModalAddCustomer");
    const closeDialogButton = document.getElementById("close-dialog");

    if (showDialogButton && modalAddCustomer) {
        showDialogButton.addEventListener("click", () => {
            modalAddCustomer.showModal();
        });
    } else {
        console.error('showDialogAddCustomer or ModalAddCustomer not found');
    }

    if (closeDialogButton && modalAddCustomer) {
        closeDialogButton.addEventListener("click", () => {
            modalAddCustomer.close();
        });
    } else {
        console.error('close-dialog or ModalAddCustomer not found');
    }
});