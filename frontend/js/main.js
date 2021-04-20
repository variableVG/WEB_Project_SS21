
// npm install --save @types/jquery - evtl das benutzen.

window.onload = function () { 
    $("#create_termin").hide();
    getAppointments(); 


}


function getAppointments() {

    $.ajax({
        type: "POST",
        url: "../backend/serviceHandler.php",
        data: { "action": "getAppointments"},
        dataType: "json"
        }).done(function (response) { 
            console.log("response in get Appointments")
            console.log(response)
            for(termin of response) {
                let appointment = document.createElement('div'); 
                appointment.setAttribute('class', 'appointment_div');
                let appointment_text = document.createElement('div'); 
                appointment_text.innerText = termin[1]; 
                appointment_text.setAttribute('class', 'appointment_name');
                let appointment_expDate = document.createElement('div'); 
                appointment_expDate.setAttribute('class', 'appointement_expDate');
                appointment_expDate.innerText = "Deadline: " + termin[4]; 
                appointment.append(appointment_text); 
                appointment.append(appointment_expDate);
                document.getElementById('appointment_container').append(appointment); 
            }
            
        }).fail(
            function (response, textStatus, errorThrown) {
                console.log("fail");
                console.log('STATUS: ' + textStatus + '\nERROR THROWN: ' + errorThrown);
                console.log(response);
            }
        );
}

function showTermin() {
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
    parameter["author_name"] = document.getElementById("author_name").value; 
    parameter["dauer"] = document.getElementById("dauer").value; 
    parameter["beschreibung"] = document.getElementById("beschreibung").value;
    parameter["ablauf_termin"] = document.getElementById("ablauf_termin").value;
    

    console.log(parameter);

    $.ajax({
        type: "POST",
        url: "../backend/serviceHandler.php",
        data: { "action": "createAppointment", "name": parameter["name"],"ort": parameter["ort"], "author_name": parameter["author_name"], "dauer": parameter["dauer"], "beschreibung":  parameter["beschreibung"], "ablauf_termin" : parameter["ablauf_termin"]},
        dataType: "json"
        }).done(function (response) { 
            console.log("response in create Termin")
            console.log(response)
            //response is the termin_id
            //If the appointment is created without problems, then we add the options to choose.
            AddTerminOptionToDB(response); 


        }).fail(
            function (response, textStatus, errorThrown) {
                console.log("fail");
                console.log('STATUS: ' + textStatus + '\nERROR THROWN: ' + errorThrown);
                console.log(response);
            }
        );

   
}

function AddTerminOptionToDB(termin_id) {
console.log("You are in AddTerminOptions");
//Add functionen - 
let termin_optionen = new Array;
for(let i = 0; i < document.getElementsByClassName("termin_option").length ; i++) {
    termin_optionen[i] = document.getElementsByClassName("termin_option")[i].value; 
}
console.log(termin_optionen); 

    $.ajax({
        type: "POST",
        url: "../backend/serviceHandler.php",
        data: { "action": "addTerminOptionToDB", "termin_optionen": termin_optionen, "termin_id": termin_id},
        dataType: "json"
        }).done(function(response) {
            console.log("response in AddTerminOptionToDB")
            console.log(response)
            $("#create_termin").hide();
            $("#button_show_termine_form").show(); 
            $("#appointment_container").show();
            location.reload();
        }).fail (
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
    input.setAttribute('class', 'termin_option');
    let termin_options = document.getElementById('termin_options');
    termin_options.append(label); 
    termin_options.append(input); 
    termin_options.append(button); 
}
