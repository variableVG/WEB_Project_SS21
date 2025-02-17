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

    public function getAppointments() {

        $sql = 'SELECT * FROM termine';

        $stmt = $this->db->prepare($sql);
        if ($stmt == false) { 
            echo("db error 1");
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

         $termine = [];
         $i = 0; 
         while($termin = $result->fetch_row()) {
               $termine[$i] = $termin;
               $i = $i + 1; 
         }
         
         $stmt->close(); 
         return $termine;
         //return new Appointment($termin['id'], $termin['name'], $termin['ort'], $termin['termin_datum'], 
         //   $termin['termin_zeit'], $termin['ablauf_termin']);

    }

    public function setVote($parameter) {

      $username = $parameter["username"]; 
      $choice = $parameter["choice"]; 

      $sql = "INSERT INTO user (username, ausgewaehlte_termine_id)
      VALUES (?, ?);";

      $stmt = $this->db->prepare($sql);
      if ($stmt === false){
          echo "setVote error1";
         $this->errormsg = "SQL statement prepare failed.";
         return false;
      }

      if ($stmt->bind_param("si", $username, $choice) == false){
         $this->errormsg = "SQL statement binding failed.";
         echo "setVote error2"; 
         return false;
      }

     if ($stmt->execute() == false){
        $this->errormsg = "Appointment could not be created. Maybe it already exists.";
        echo "setVote error3"; 
        return false;
     }

     $stmt->close();
     return true;
    }

    public function addTerminOptionToDB($parameter) {



      // $parameter["terminoptiondate"]
      // $parameter["terminoptiontime"]
        $termin_id = $parameter["termin_id"]; 
        $termin_op_date= $parameter["termin_optionendate"];
        $termin_op_time= $parameter["termin_optionentime"];

        //echo "Parameter in addTerminOPtiontoDB";
        //print_r($parameter);
        
        
         $length = count($parameter["termin_optionendate"]);
        for($i = 0; $i < $length; $i++) {
           //evtl entfernen wenn wir verschiedene Inputs (Zeit und Date) haben
           //TODO
            // $newarray = explode("T", $parameter["termin_optionen"][$i]);
            $sql = "INSERT INTO ausgewaehlte_termine (termin_id, termin_datum, termin_zeit) VALUES (?, ?, ?);";
            
            $stmt = $this->db->prepare($sql);
            if ($stmt === false){
                  echo "error1 addTerminOptionToDB";
               $this->errormsg = "SQL statement prepare failed.";
               return false;
            }

           $termin_datum =  $termin_op_date[$i]; 
           $termin_zeit =   $termin_op_time[$i]; 

            if ($stmt->bind_param("iss",
            $termin_id,
            $termin_datum,
            $termin_zeit) == false) {
               $this->errormsg = "SQL statement binding failed.";
               echo "error2 addTerminOptionToDB"; 
               return false;
            }

            if ($stmt->execute() == false){
               $this->errormsg = "Appointment could not be created. Maybe it already exists.";
               echo "error3 addTerminOptionToDB"; 
               return false;
            }

            $stmt->close();
            

        }
        return true;
    }

    public function getAppointmentOptions($parameter) {
      $sql = 'SELECT * FROM ausgewaehlte_termine WHERE termin_id = ?;';

        $stmt = $this->db->prepare($sql);
        if ($stmt == false) { 
            echo("getAppointmentOptions error 1");
            return false; 
        }
        $termin_id = $parameter["termin_id"];

        if ($stmt->bind_param("i", $termin_id) == false){
           $this->errormsg = "SQL statement binding failed.";
           echo "error2"; 
           return false;
        }
        
         if($stmt->execute() == false) {
            echo("getAppointmentOptions error 3");
            return false; 
         }
         //Gets a result set from a prepared statement.
         $result = $stmt->get_result();
         
         if($result->num_rows == 0) {
            return "empty"; 
         }      
         
         $termine = [];
         $i = 0; 
         while($termin = $result->fetch_row()) {
               $termine[$i] = $termin;
               $i = $i + 1; 
         }
         
         $stmt->close(); 
         return $termine;
    }


    public function sendComment($parameter) {
      $username = $parameter["username"]; 
      $termin_id = $parameter["termin_id"];
      $comment_text = $parameter["comment_text"];
     
      $sql = "INSERT INTO kommentare (termin_id, username, inhalte)
      VALUES (?, ?, ?);";

      $stmt = $this->db->prepare($sql);
      if ($stmt === false){
          echo "sendComment error1";
         $this->errormsg = "SQL statement prepare failed.";
         return false;
      }

      if ($stmt->bind_param("iss", $termin_id, $username, $comment_text) == false){
         $this->errormsg = "SQL statement binding failed.";
         echo "sendComment error2"; 
         return false;
      }

     if ($stmt->execute() == false){
        $this->errormsg = "Appointment could not be created. Maybe it already exists.";
        echo "sendCommenterror3"; 
        return false;
     }

     $stmt->close();
     return true;

    }

    public function getComments($parameter) {
      $termin_id = $parameter["termin_id"];
      $sql = 'SELECT * FROM kommentare WHERE termin_id = ?;';

      $stmt = $this->db->prepare($sql);
      if ($stmt == false) { 
          echo("getAppointmentOptions error 1");
          return false; 
      }
      
      if ($stmt->bind_param("i", $termin_id) == false){
         $this->errormsg = "SQL statement binding failed.";
         echo "error2"; 
         return false;
      }
      
       if($stmt->execute() == false) {
          echo("getAppointmentOptions error 3");
          return false; 
       }
       //Gets a result set from a prepared statement.
       $result = $stmt->get_result();
       
       if($result->num_rows == 0) {
          return "empty"; 
       }      
       
       $comments = [];
       $i = 0; 
       while($comment = $result->fetch_row()) {
             $comments[$i] = $comment;
             $i = $i + 1; 
       }
       
       $stmt->close(); 
       return $comments;
    }

    public function getUsersVotes($parameter) {
      //$ausgewahlte_termin_id = $parameter["termin_id"];

      $sql = 'SELECT * FROM user;';

      $stmt = $this->db->prepare($sql);
      if ($stmt == false) { 
          echo("getUsersVotes error 1");
          return false; 
      }
      
       if($stmt->execute() == false) {
          echo("getUsersVotes error 3");
          return false; 
       }
       //Gets a result set from a prepared statement.
       $result = $stmt->get_result();
       
       if($result->num_rows == 0) {
          return "empty"; 
       }      
       
       $users = [];
       $i = 0; 
       while($user = $result->fetch_row()) {
             $users[$i] = $user;
             $i = $i + 1; 
       }
       
       $stmt->close(); 
       return $users;
    }

}


?>