<?php

/**
 * クラスのコメントを書きます。
 */
class Sample{

    //Utilityを格納する場所
    private $util;

    /**
     * コンストラクタ
     */
    public function __construct()
    {
        if($this->util == ""){
            $this->util="util";
        }    
    }
}
