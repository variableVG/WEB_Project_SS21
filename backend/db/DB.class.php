<?php


require_once("models/appointment.php");

class Database {
    function __construct(){ 
        //The data necessary to connect to the database is stored in settings.php 
        require 'config_datei.php';
        //Here is were we connect to the database. 
        $this->db = new mysqli($DBhost, $DBuser, $DBpasswort, $DBname);
        if ($this->db->connect_errno) 
        {
            echo "Failed to connect to MySQL: (" . $this->db->connect_errno . ") " . $this->db->connect_error;
            exit();
        }
    }


    public function createAppointment($appointment) {

        $sql = "INSERT INTO termine (id, name, ort,	termin_creation_date, ablauf_termin, author)
        VALUES (NULL, ?, ?, ?, ?, ?);";

        $stmt = $this->db->prepare($sql);
        if ($stmt === false){
           $this->errormsg = "SQL statement prepare failed.";
           return false;
        }
        $name = $appointment->getName();
        $ort = $appointment->getOrt();
        $termin_datum = $appointment-> getTerminDatum();
        $ablauf_termin = $appointment-> getAblaufDatum();
        $author = $appointment->getAuthor();

        if ($stmt->bind_param("sssss",
        $name,
        $ort,
        $termin_datum,
        $ablauf_termin, 
        $author) == false){
           $this->errormsg = "SQL statement binding failed.";
           return false;
        }

       if ($stmt->execute() == false){
          $this->errormsg = "Appointment could not be created. Maybe it already exists.";
          return false;
       }
       $stmt->close();
       return true;
    }


    public function getAppointments($termin_id) {

        $sql = 'SELECT * FROM termine WHERE id = ?';

        $stmt = $this->db->prepare($sql);
        if ($stmt == false) { 
            echo("db error 1");
            return false; 
        }
        if($stmt->bind_param("i", $termin_id) == false) {
            echo("db error 2");
            return false; 
         }
         if($stmt->execute() == false) {
            echo("db error 3");
            return false; 
         }
         //Gets a result set from a prepared statement.
         $result = $stmt->get_result();
         if($result->num_rows == 0) {
            echo("db error 4");
            return false; 
         }      
         $termin = $result->fetch_assoc();
         $stmt->close();

         return $termin;
         //return new Appointment($termin['id'], $termin['name'], $termin['ort'], $termin['termin_datum'], 
         //   $termin['termin_zeit'], $termin['ablauf_termin']);

    }
}


?>