<?php

require_once('smarty/Smarty.class.php');
// require_once('./db_manager.php');
// require('./utility.php');

class Front{
    protected $smarty=null;
//CONFから取得したデータを整形した配列一式
    protected $config_data;
    protected $util;
    protected $dbh;
// protected $system_config_data;

    function __construct(){
       
        $this->util = new Utility();
        $this->smarty = $this->util->getSmarty();
        $db = $this->util->getConfigDBData();
        
        $this->dbh = $dbh=DbManager::getInstance($db)->getDBH();    
        $this->config_data = $this->util->getConfigData();
    }
    // function execute(){
    //     $this->util->smarty();
    // }

    // function const_data(){
    //     $conf_data=$this->smarty->getConfigVars();
    
    //     // $system_conf_data=$this->smarty->getConfigVars("system_const");
        
    //     foreach($conf_data as $k =>$v){
    //         if (preg_match("/question/",$k)){
    //             $this->config_data["question"][$k]=$v;
    //         }elseif(preg_match("/category/",$k)){
    //             $this->config_data["category"][$k]=$v;
    //         }elseif(preg_match("/course/",$k)){
    //             $this->config_data["course"][$k]=$v;
    //         }
    //         elseif(preg_match("/db/",$k)){
    //             $this->config_data["db"][$k]=$v;
    //         }
    //         elseif(preg_match("/login/",$k)){
    //             $this->config_data["login"][$k]=$v;
    //         }
        
    //     }
    // }
    

    // function  db_conect(){
    //     //  $result = DbMabager::getInstance()->exec($query);
    //     $this->const_data();
    //     $db_name=$this->config_data["db"]["db_name"];
    //     $db_host=$this->config_data["db"]["db_host"];
    //     $dsn = "mysql:dbname=". $db_name.";host=". $db_host;
    //     $user = $this->config_data["db"]["db_user"];
    //     $password = $this->config_data["db"]["db_pass"];
       
    //     try {
    //         $dbh = new PDO($dsn, $user, $password);
    //         // echo "接続成功\n";
            
    //     } catch (PDOException $e) {
    //         echo "接続失敗: " . $e->getMessage() . "\n";
    //         exit();
    //     }
    //     return $dbh; 
      
    // }

    // function select($contact){

    //     $prepare=$this->db_conect()->prepare($contact);
    //     $prepare->bindValue(':name', $this->name, PDO::PARAM_STR);
    //     $prepare->bindValue(':e_mail', $this->e_mail, PDO::PARAM_STR);
    //     $prepare->bindValue(':category', $this->category, PDO::PARAM_STR);
    //     $prepare->bindValue(':date', $this->date, PDO::PARAM_STR);
    //     $prepare->bindValue(':time_start',$this->time_start, PDO::PARAM_STR);
    //     $prepare->bindValue(':time_end', $this->time_end, PDO::PARAM_STR);
    //     $prepare->bindValue(':course', $this->course, PDO::PARAM_STR);
    //     $prepare->bindValue(':comment', $this->comment, PDO::PARAM_STR);
    //     $prepare->bindValue(':login_id', $this->login_id, PDO::PARAM_STR);
   
        
    // }


    // // 取得
    // public function exec($query){
    //     $this->const_data();
    //     // $this->db_conect();
    //     $stmt = $this->db_conect()->query($query);
    //     $ary_db_data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    //     return  $ary_db_data;
    // }



}
// $front = new Front();
// $front->execute();
// $front->const_data();
// $front->db_conect();
// $front->exec($query);
