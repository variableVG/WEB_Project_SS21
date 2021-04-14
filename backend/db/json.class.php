<?php

class Json {

    private $data;

    function __construct() {
        $this->data = array();
    }


    function add($key, $value) {
        $this->data[$key] = $value;
    }

    function error($code) {
        $this->add('status', 'error');
        $this->add('error', $code);
        $this->print();
        exit();
    }

    function print() {
        echo json_encode($this->data);
    }
}