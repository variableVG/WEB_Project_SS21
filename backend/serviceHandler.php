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
isset($_POST["parameter"]) ? $parameter = $_POST["parameter"] : false;

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