
// Initialisierungsobjekt
// Änderung durch setzen der Attribute
// ************************************
const $myFetch={
    timeout: 2000,
    method: 'POST',
    headers: {"Content-type": "application/x-www-form-urlencoded;charset=utf-8"},
    debug: true
}


const $myPost=function( url, sndDataObj={}, rcvJson=null, rcvText=null, ferr=null){
    if ($myFetch.debug) {console.log("$myPost senden:"); console.log(sndDataObj); }
    let fetchData={
            method: $myFetch.method,
            body: new URLSearchParams(sndDataObj),
            headers: $myFetch.headers
    }

    return new Promise( (resolve, reject) => {
        // init Timer
        let timer = setTimeout( () => reject({"msg":"Timeout " + $myFetch.timeout + "ms ", "status":1001} ),$myFetch.timeout);
        fetch( url, fetchData )
        .then(
            response => resolve( response ),
            err => reject( err )
        )
        .finally( () => clearTimeout(timer) );
    })
    .then((resp)=>{
        if (resp.ok) return resp.text()
        else if (resp.status === 404) return Promise.reject({"msg":"url:"+url+" not found", "status": resp.status});
        else return Promise.reject({"msg":"Error", "status":resp.status});
    })
    .then(function(data){ 
       try { 
         let dataObj=JSON.parse(data);
         if ($myFetch.debug) {console.log("$myPost JsonData received:");console.log(dataObj)}
         rcvJson(dataObj); // Callback   
        } 
        catch(err){
            if ($myFetch.debug) {console.log("$myPost Text received:");console.log(data)}
            if (rcvText!==null) rcvText(data); // Callback 
        }
    })
    .catch((err)=>{
        if ($myFetch.debug) {console.log("$myPost Error:"); console.log("err.msg: \"" + err.msg + "\" err.status: " + err.status);}
        if (ferr!==null) ferr(err); // Callback 
    })
}

