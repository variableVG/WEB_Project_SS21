
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
                appointment.setAttribute('id', 'appointment_div' + termin[0]);

                let appointment_text = document.createElement('div'); 
                appointment_text.innerText = termin[1]; 
                appointment_text.setAttribute('class', 'appointment_name');

                let appointment_expDate = document.createElement('div'); 
                appointment_expDate.setAttribute('class', 'appointement_expDate');
                appointment_expDate.innerText = "Deadline: " + termin[4]; 
                appointment.append(appointment_text); 
                appointment.append(appointment_expDate);
                
                let appointment_descriptions = document.createElement('div');
                appointment_descriptions.setAttribute('class', 'appointment_descriptions');
                appointment.append(appointment_descriptions);

                let appointment_author = document.createElement('div');
                appointment_author.setAttribute('class', 'appointment_author');
                //TODO
                appointment_author.innerText = "Veranstaltung organisiert von "; //Hier müssen wir noch Author hinzüfugen
                appointment_descriptions.append(appointment_author);

                let appointment_ort = document.createElement('div');
                appointment_ort.setAttribute('class', 'appointment_ort');
                appointment_ort.innerText = "Ort: " + termin[2];
                appointment_descriptions.append(appointment_ort);

                let appointment_duration = document.createElement('div');
                appointment_duration.setAttribute('class', 'appointment_duration');
                appointment_duration.innerText = "Dauer: " + termin[7];
                appointment_descriptions.append(appointment_duration);

                let appointment_description = document.createElement('div');
                appointment_description.setAttribute('class', 'appointment_description');
                appointment_description.innerText = termin[6];
                appointment_descriptions.append(appointment_description); 

                let appointment_options = document.createElement('div');
                appointment_options.setAttribute('class', 'appointment_options');
                appointment_options.setAttribute('id', termin[0]);

                getAppointmentOptions(termin[0]);

                appointment_descriptions.append(appointment_options); 

                
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

function getAppointmentOptions(termin_id) {
    $.ajax({
        type: "POST",
        url: "../backend/serviceHandler.php",
        data: { "action": "getAppointmentOptions", "termin_id" : termin_id},
        dataType: "json"
        }).done (function (response) {
            console.log("response in get AppointmentOptions"); 
            console.log(response); 
            console.log("response length is ")
            console.log(response.length);
            let AppointmentOptions = document.getElementById(termin_id); 
            if(response == "empty"){
                AppointmentOptions.innerText = "There are no options to choose for this Appointment"; 
            }
            else {
                AppointmentOptions.style.display = "grid"; 
                let number_of_rows = 1; //It depends of the users - TODO

                //Columns
                let width_of_columns = 100 / (response.length + 1);
                let number_of_columns = ""; 
                for (let i = 0; i < response.length; i++) {
                    number_of_columns += width_of_columns + "% ";   
                }
                AppointmentOptions.style.gridTemplateColumns = "repeat(" + (response.length + 1) + ", " + width_of_columns +"%)";
                //AppointmentOptions.style.gridTemplateRows = "30px 30px";

                let empty_div = document.createElement('div');
                empty_div.style.width = width_of_columns; 
                empty_div.setAttribute('class', 'option_unit');
                AppointmentOptions.append(empty_div); 

                for(termin of response) {
                    let date_div = document.createElement('div'); 
                    date_div.innerHTML = termin[2] + "\n" + termin[3]; 
                    date_div.setAttribute('class', 'option_unit');
                    AppointmentOptions.append(date_div);
                }

                let div_username = document.createElement('input'); 
                div_username.setAttribute('type', 'text'); 
                div_username.setAttribute('class', 'input_user'); 
                div_username.setAttribute('placeholder', 'enter Name'); 
                AppointmentOptions.append(div_username);

                for(termin of response) {
                    let check_div = document.createElement('input'); 
                    check_div.setAttribute('type', 'checkbox'); 
                    check_div.setAttribute('class', 'checkbox'); 
                    check_div.setAttribute('id', termin[0]);
                    AppointmentOptions.append(check_div);
                }

            }
            

        }).fail(
            function (response, textStatus, errorThrown) {
                console.log("fail in getAppointmentOptions");
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
    label.setAttribute('for', 'termin_option');
    input.setAttribute('type', 'datetime-local');
    input.setAttribute('class', 'termin_option');
    let termin_options = document.getElementById('termin_options');
    termin_options.append(label); 
    termin_options.append(input); 
}
