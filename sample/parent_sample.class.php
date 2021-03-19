<?php

require_once("./utility.class.php");

class ParentSample {
    
    //サンプルデータで、子が使い回す
    protected $sample_data;

    protected $util;

    protected function __construct()
    {
        $this->util = new Utility();
        $this->sample_data = "サンプルデータ";
        echo "親のコンストラクタ<br />";
    }

    protected function execute(){
        echo "親の実行<br />";
        // utility.phpの関数が使える
        echo $this->util->getA();
    
    }
    
}