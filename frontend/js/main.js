
// npm install --save @types/jquery - evtl das benutzen.

window.onload = function () { 
    getAppointments(1); 


}


function getAppointments(parameter) {

    $.ajax({
        type: "POST",
        url: "../backend/serviceHandler.php",
        data: { "action": "getAppointments", "parameter" : parameter},
        dataType: "json"
        }).done(function (response) { 
            console.log("response in get Appointments")
            console.log(response)
            //To fill after response.  -- > Hier sollte die switch game gehen.
            let appointment_container = document.createElement('div'); 
            document.body.append(appointment_container);
        }).fail(
            function (response, textStatus, errorThrown) {
                console.log("fail");
                console.log('STATUS: ' + textStatus + '\nERROR THROWN: ' + errorThrown);
                console.log(response);
            }
        );
}

function createAppointment() {
   
   
}

function showDiv(div) {
    $(div).show();   
    showDiv("");
}