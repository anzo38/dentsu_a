<?php
// require_once('smarty/Smarty.class.php');

require('./check.php');
require('./database.php');

/**
 * TODOコメントを書きましょう。
 */
class Member_detail extends Check {

    /**
     * TODOコメントを書きましょう
     */
    function __construct(){
        parent::__construct();
        //TODO ↓不要では？
        $this->session_data = new Check();

        
    
        $this->search_id=htmlspecialchars($_POST["search_id"]);
        $this->search_name=htmlspecialchars($_POST["search_name"]);
        $this->search_e_mail=htmlspecialchars($_POST["search_e_mail"]);
        $this->search_login_id=htmlspecialchars($_POST["search_login_id"]);
        $this->search_date=htmlspecialchars($_POST["search_date"]);
        
    }


    function execute(){
        $this->results_from_db();
       
        
    }
    
    function results_from_db(){
        // ini_set( 'display_errors', 1 );
        //TODO　htmlspecialcharactersを入れましょう。
        $result_id=$_POST["result_id"];
    //  var_dump($search_id);
    //TODO:プレースホルダを利用すること。DBは親クラスのものを利用。
        $query="SELECT * FROM contact as c JOIN questions as q ON c.id = q.contact_id WHERE c.id=" . $result_id;
        // print_r($query);exit;
        $result = DbMabager::getInstance()->exec($query);
        // $csv_data="氏名, 趣味, 好きな食べ物, お住まいの地域, パスワード\r\n";
        if(empty($result)){
            $this->smarty->assign('no_data',"情報がありません");
        }
        // print_r($result);exit;
        $data="";

        $data=$result[0];
       
        $data["question"]=[];
        foreach($result as $k => $v){
            array_push($data["question"],$v["question"]);
        }
        $this->smarty->assign("data",$data);

        $this->smarty->display("member.detail.tpl");   
    }
}

$member_detail = new Member_detail();
    
$member_detail->execute();
?>