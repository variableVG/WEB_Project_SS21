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



    public function createUser($username) {
        $sql = "INSERT INTO user (username) VALUES (?);"; 

        $stmt = $this->db->prepare($sql);
        if ($stmt === false){
            echo "create user error1";
           $this->errormsg = "SQL statement prepare failed.";
           return false;
        }

        if ($stmt->bind_param("s", $username) == false){
           $this->errormsg = "SQL statement binding failed.";
           echo "create user error2"; 
           return false;
        }

       if ($stmt->execute() == false){
          $this->errormsg = "User could not be created. Maybe it already exists.";
          echo "create user error3"; 
          return false;
       }

       $last_id = mysqli_insert_id($this->db);
       $stmt->close();

       return $last_id;

    }

    public function createAppointment($parameter) {

        $author_id = $this->createUser($parameter["author_name"]);

        $sql = "INSERT INTO termine (name, ort, ablauf_termin, author_id, beschreibung, dauer)
        VALUES (?, ?, ?, ?, ?, ?);";

        $stmt = $this->db->prepare($sql);
        if ($stmt === false){
            echo "error1";
           $this->errormsg = "SQL statement prepare failed.";
           return false;
        }
        $name = $parameter["name"]; 
        $ort = $parameter["ort"];
        $ablauf_termin = $parameter["ablauf_termin"];
        $beschreibung = $parameter["beschreibung"];
        $dauer = $parameter["dauer"];

        if ($stmt->bind_param("sssiss",
        $name,
        $ort,
        $ablauf_termin, 
        $author_id,
        $beschreibung, 
        $dauer) == false){
           $this->errormsg = "SQL statement binding failed.";
           echo "error2"; 
           return false;
        }

       if ($stmt->execute() == false){
          $this->errormsg = "Appointment could not be created. Maybe it already exists.";
          echo "error3"; 
          return false;
       }

       $last_id = mysqli_insert_id($this->db);
       $stmt->close();
       return $last_id;

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

    public function addTerminOptionToDB($termin_id) {
        
    }
}


?>