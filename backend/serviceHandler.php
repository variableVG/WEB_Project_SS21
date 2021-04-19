<?php
require_once("logic/logic.php");
require_once("db/DB.class.php");
require_once("db/json.class.php");

$method = $_SERVER['REQUEST_METHOD'];
$message = ""; 

if($method != 'POST') { 
    http_response_code(405); 
    header('Allow: POST'); 
    echo "Method not allowed."; 
    //exit; 
}
isset($_POST["action"]) ? $action = $_POST["action"] : false;
isset($_POST["name"]) ? $parameter["name"] = $_POST["name"] : false;
isset($_POST["ort"]) ? $parameter["ort"] = $_POST["ort"] : false;
isset($_POST["author_name"]) ? $action = $_POST["author_name"] : false;
isset($_POST["beschreibung"]) ? $parameter["beschreibung"] = $_POST["beschreibung"] : false;
isset($_POST["ort"]) ? $parameter["ort"] = $_POST["ort"] : false;

isset($_POST["ablauf_termin"]) ? $parameter["ablauf_termin"] = $_POST["ablauf_termin"] : false;


echo "action is: ";
echo $action; 
echo "Parameter is: "; 
print_r($parameter); 

$logic = new Logic();
$result = $logic->handleRequest($action, $parameter);

if ($result == null) {
    response("POST", 400, null);
} else {
    response("POST", 200, $result);
}


function response($method, $httpStatus, $data)
{
    header('Content-Type: application/json');
    switch ($method) {
        case "POST":
            http_response_code($httpStatus);
            echo (json_encode($data));
            break;
        default:
            http_response_code(405);
            echo ("Method not supported yet!");
    }
}

?>