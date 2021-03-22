<?php

require_once('smarty/Smarty.class.php');
// require('./utility.php');

class Front{
    protected $smarty=null;
//CONFから取得したデータを整形した配列一式
    protected $config_data;
    protected $util;
 
    private  $dbh;
// protected $system_config_data;

    function __construct(){
        
        $this->smarty = new Smarty();
        $this->smarty->template_dir = './templates/';
        $this->smarty->compile_dir  = './templates_c/';
        $this->smarty->setConfigDir('./configs/');
        $this->smarty->configLoad('const.conf');

    }
    // function execute(){
    //     $this->util->smarty();
    // }

    function const_data(){
        $conf_data=$this->smarty->getConfigVars();
    
        // $system_conf_data=$this->smarty->getConfigVars("system_const");
        
        foreach($conf_data as $k =>$v){
            if (preg_match("/question/",$k)){
                $this->config_data["question"][$k]=$v;
            }elseif(preg_match("/category/",$k)){
                $this->config_data["category"][$k]=$v;
            }elseif(preg_match("/course/",$k)){
                $this->config_data["course"][$k]=$v;
            }
            elseif(preg_match("/db/",$k)){
                $this->config_data["db"][$k]=$v;
            }
            elseif(preg_match("/login/",$k)){
                $this->config_data["login"][$k]=$v;
            }
        
        }
    }
    

    function  db_conect(){
        //  $result = DbMabager::getInstance()->exec($query);
        $this->const_data();
        $db_name=$this->config_data["db"]["db_name"];
        $db_host=$this->config_data["db"]["db_host"];
        $dsn = "mysql:dbname=". $db_name.";host=". $db_host;
        $user = $this->config_data["db"]["db_user"];
        $password = $this->config_data["db"]["db_pass"];
       
        try {
            $dbh = new PDO($dsn, $user, $password);
            // echo "接続成功\n";
        } catch (PDOException $e) {
            echo "接続失敗: " . $e->getMessage() . "\n";
            exit();
        }
        return $dbh; 
        
    }

    // 取得
    public function exec($query){
        $this->db_conect();
        $stmt = $this->dbh->query($query);
        $ary_db_data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return  $ary_db_data;
    }



}
$front = new Front();
// $front->execute();
$front->const_data();
$front->db_conect();
// $front->exec($query);
