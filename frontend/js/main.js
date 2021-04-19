
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

//Add functionen - 
let parameter = new Array;
for(let i = 0; i < document.getElementsByClassName("termin_option").length ; i++) {
    parameter[i] = document.getElementsByClassName("termin_option")[i].value; 
}
console.log(parameter); 

    $.ajax({
        type: "POST",
        url: "../backend/serviceHandler.php",
        data: { "action": "addTerminOptionToDB", "parameter": parameter, "termin_id": termin_id},
        dataType: "json"
        }).done(function(response) {
            console.log("response in AddTerminOptionToDB")
            console.log(response)
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
