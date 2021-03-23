<?php
// require_once('smarty/Smarty.class.php');
// 
// シングルトン
class DbManager {

    private static $singleton;

    private  $dbh;
    private $db_data;


    private function __construct(Array $db_data){
        $this->db_data=$db_data;
        // $this->smarty = new Smarty();
        // $this->smarty->template_dir = './templates/';
        // $this->smarty->compile_dir  = './templates_c/';
     
       
        // $this->smarty->setConfigDir('./configs/');
        // $this->smarty->configLoad('const.conf');
        // var_dump($conf_data);
        $db_name=$this->db_data["db_name"];
        $db_host=$this->db_data["db_host"];

        $dsn = "mysql:dbname=". $db_name.";host=". $db_host;
        $user = $this->db_data["db_user"];
        $password = $this->db_data["db_pass"];
        
        try {
            $this->dbh = new PDO($dsn, $user, $password);
            // echo "接続成功\n";
        } catch (PDOException $e) {
            echo "接続失敗: " . $e->getMessage() . "\n";
            exit();
        }
    }

    /**
     * PDOオブジェクトを返却
     */
    public function getDBH(): PDO {
        
        return $this->dbh;
    }

    public static function getInstance(Array $db_data) {
       
        if (!isset(self::$singleton)) {
            self::$singleton = new DbManager($db_data);    
        }

        return self::$singleton;
    }

    public function insert($query){
    
        return  $query;
    }

    public function exec($query){
        $this->execute();
        $stmt = $this->dbh->query($query);
        $ary_db_data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return  $ary_db_data;
    }
}
   

// function some_function() {
//     $db = Database::getInstance();
//     $db->get()->query('...');
// }

// some_function();
