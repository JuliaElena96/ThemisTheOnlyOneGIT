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
document.addEventListener('DOMContentLoaded', (event) => {
    const modal = document.getElementById("ModalAddCustomer");
    const resizer = document.querySelector('.resizer');
    const modalContent = modal;

    resizer.addEventListener('mousedown', initResize, false);

    function initResize(e) {
        window.addEventListener('mousemove', Resize, false);
        window.addEventListener('mouseup', stopResize, false);
    }

    function Resize(e) {
        modalContent.style.width = (e.clientX - modalContent.offsetLeft) + 'px';
        modalContent.style.height = (e.clientY - modalContent.offsetTop) + 'px';
    }

    function stopResize(e) {
        window.removeEventListener('mousemove', Resize, false);
        window.removeEventListener('mouseup', stopResize, false);
    }
});