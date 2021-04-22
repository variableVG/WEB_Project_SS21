<?php

class Logic
{
    protected $db;
    protected $json; 
    function __construct()
    {
        $this->db = new Database();
        $this->json = new Json();
        //https://stackoverflow.com/questions/6395720/get-data-from-php-array-ajax-jquery
    }

    function handleRequest($action, $parameter)
    {//hallo voll cool 

        $result = 0;
        switch ($action) {
            case "createAppointment": 
                $result = $this->db->createAppointment($parameter);
                break;
            case "getAppointments":
                $result = $this->db->getAppointments();
                break;
            case "addTerminOptionToDB": 
                $result = $this->db->AddTerminOptionToDB($parameter); 
                break;
            case "getAppointmentOptions": 
                $result = $this->db->getAppointmentOptions($parameter); 
                break; 
            case "setVote": 
                $result = $this->db->setVote($parameter);
                break; 
            case "sendComment": 
                $result = $this->db->sendComment($parameter);
                break; 
            case "getUsersVotes":
                $result = $this->db->getUsersVotes($parameter);
                break;
            case "getComments": 
                $result = $this->db->getComments($parameter); 
                break; 
            default:
                $result = null;
                break;
        }
       
        return $result;
    }
    
}


?>