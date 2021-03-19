<?php

class Utility{

    private $a = "";
    private $i = "";
    private $u = "";

    public function __construct()
    {
        echo "ユーティリティ<br />";
        $this->a = "あ";
        $this->i = "い";
        $this->u = "う";
    }

    public function getA(){
        return $this->a;
    }

    public function getI(){
        return $this->i;
    }

    public function getU(){
        return $this->u;
    }


}