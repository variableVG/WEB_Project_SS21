<?php 

class Appointment {
    private $id;
    private $name;
    private $ort;
    private $termin_datum;
    private $termin_zeit;
    private $ablauf_termin;
    private $author ;

    

    function __construct($id, $name, $ort, $termin_datum, $termin_zeit, $ablauf_termin,$author ){
        $this->id = $id; 
        $this->name = $name; 
        $this->ort = $ort; 
        $this->termin_datum = $termin_datum;
        $this->termin_zeit = $termin_zeit; 
        $this->ablauf_termin = $ablauf_termin; 
        $this->author= $author;
    }

    function setId($id){
        $this->id = $id; 
    }

    function getId(){
        return $this->id; 
    }

    function setName($name){
        $this->name = $name; 
    }

    function getName(){
        return $this->name; 
    }

    
    function setOrt($ort){
        $this->ort = $ort; 
    }

    function getOrt(){
        return $this->ort; 
    }
    function setTerminDatum($termin_datum){
        $this-> termin_datum= $termin_datum; 
    }

    function getTerminDatum(){
        return $this->termin_datum; 
    }

    function setTerminZeit($termin_zeit){
        $this-> termin_zeit= $termin_zeit; 
    }

    function getTerminZeit(){
        return $this->termin_zeit; 
    }
    function setAblaufDatum($ablauf_termin){
        $this-> ablauf_termin= $ablauf_termin; 
    }

    function getAblaufDatum(){
        return $this->ablauf_termin; 
    }
    function setAuthor($author){
        $this-> author= $author; 
    }

    function getAuthor(){
        return $this->author; 
    }
}
?>