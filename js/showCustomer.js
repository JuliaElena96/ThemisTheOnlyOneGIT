function getQueryParams() {
    let params = {};
    let queryString = window.location.search.substring(1);
    let regex = /([^&=]+)=([^&]*)/g;
    let m;
    while (m = regex.exec(queryString)) {
        params[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
    }
    return params;
}

// URL-Parameter abrufen und Namen anzeigen
window.onload = function () {
    let params = getQueryParams();
    let kundenname = document.getElementById('kundenname');
    if (params.nname && params.vname) {
        kundenname.textContent = `${params.vname} ${params.nname}`;
    }
}