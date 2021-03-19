<?php
require_once('smarty/Smarty.class.php');
// シングルトン
class DbMabager {

    private static $singleton;
    private $db; //※
    private  $dbh;


    private function __construct(){

        $this->smarty = new Smarty();
        $this->smarty->template_dir = './templates/';
        $this->smarty->compile_dir  = './templates_c/';
     
       
        $this->smarty->setConfigDir('./configs/');
        $this->smarty->configLoad('const.conf');

    }

   private function execute(){
        if(!isset($this->db))
        $conf_data=$this->smarty->getConfigVars();

        // var_dump($conf_data);
        foreach($conf_data as $k =>$v){
            if(preg_match("/db/",$k)){
            $this->config_data["db"][$k]=$v;
        }
        }
        $db_name=$this->config_data["db"]["db_name"];
        $db_host=$this->config_data["db"]["db_host"];

        $dsn = "mysql:dbname=". $db_name.";host=". $db_host;
        $user = $this->config_data["db"]["db_user"];
        $password = $this->config_data["db"]["db_pass"];
        
        try {
            $this->dbh = new PDO($dsn, $user, $password);
            // echo "接続成功\n";
        } catch (PDOException $e) {
            echo "接続失敗: " . $e->getMessage() . "\n";
            exit();
        }
    
    }


    public function exec($query){
        $this->execute();
        $stmt = $this->dbh->query($query);
        $ary_db_data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return  $ary_db_data;
    }
    
    public static function getInstance() {
       
            if (!isset(self::$singleton)) {
                self::$singleton = new DbMabager();    
            }
    
            return self::$singleton;
        }

    }

// function some_function() {
//     $db = Database::getInstance();
//     $db->get()->query('...');
// }

// some_function();