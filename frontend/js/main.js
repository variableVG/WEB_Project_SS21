
// npm install --save @types/jquery - evtl das benutzen.

window.onload = function () { 
    $("#create_termin").hide();
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

function showTermin() {
    console.log("Hi!");
    $("#create_termin").show();
    $("#button_show_termine_form").hide(); 
    $("#appointment_container").hide();
}



function createTermin() {

    console.log("you are in create Termin");
    let parameter = new Array(); 
    //parameter = document.getElementById("create_termin").value; 
    //console.log(parameter); 
    parameter["name"] = document.getElementById("name").value; 
    parameter["ort"] = document.getElementById("ort").value; 
    parameter["termin_option"] = document.getElementById("termin_option").value;
    parameter["ablauf_termin"] = document.getElementById("ablauf_termin").value;

    console.log(parameter);

    $.ajax({
        type: "POST",
        url: "../backend/serviceHandler.php",
        data: { "action": "createAppointment", "name": parameter["name"],"ort": parameter["ort"], "termin_option": parameter["termin_option"], "ablauf_termin" : parameter["ablauf_termin"]},
        dataType: "json"
        }).done(function (response) { 
            console.log("response in create Termin")
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

function AddTerminOption() {
    let label = document.createElement('label'); 
    let input = document.createElement('input'); 
    let button = document.createElement('button'); 
    button.setAttribute('type', 'button');
    button.setAttribute('class', 'btn btn-primary');
    button.setAttribute('onclick', 'AddTerminOption()');
    button.innerText = "Add Termin"; 
    label.setAttribute('for', 'termin_option');
    input.setAttribute('type', 'datetime-local');
    let termin_options = document.getElementById('termin_options');
    termin_options.append(label); 
    termin_options.append(input); 
    termin_options.append(button); 
}
