<?php

require_once("./parent_sample.class.php");

class ChildSample extends ParentSample{

    public function __construct()
    {
        parent::__construct();
        echo "子供のコンストラクタ<br />";
    }

    public function execute(){
        parent::execute();
        echo "子供の実行<br />";
        echo $this->sample_data;
        // echo $this->util->getA();
    }

    public function getSampleData(){
        return $this->sample_data;
    }
}