<?php
require_once('admin.php');
// require('./utility.php');
require('./database.php');

/**
 * TODOコメントを書きましょう。
 */
class Member_detail extends Admin {
    // protected $util;
    /**
     * TODOコメントを書きましょう
     */
    function __construct(){
        parent::__construct();
        $this->result_id=htmlspecialchars($_POST["result_id"]);
        $this->search_id=htmlspecialchars($_POST["search_id"]);
        $this->search_name=htmlspecialchars($_POST["search_name"]);
        $this->search_e_mail=htmlspecialchars($_POST["search_e_mail"]);
        $this->search_login_id=htmlspecialchars($_POST["search_login_id"]);
        $this->search_date=htmlspecialchars($_POST["search_date"]);
        
    }


    function execute(){
        $this->results_from_db();
        // 継続的認証
        // $this->is_auth();
      
        $this->smarty->assign('id', $this->search_id);
        $this->smarty->assign('name', $this->search_name);
        $this->smarty->assign('e_mail', $this->search_e_mail);
        $this->smarty->assign('date', $this->search_date);
        $this->smarty->assign('login_id', $this->search_login_id);
     
        $this->smarty->display("member.detail.tpl");   
    }
    
    function results_from_db(){
        
        
    //TODO:プレースホルダを利用すること。DBは親クラスのものを利用。
        $query="SELECT * FROM contact as c JOIN questions as q ON c.id = q.contact_id WHERE c.id=" . $this->result_id;
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

       
    }
}

$member_detail = new Member_detail();
    
$member_detail->execute();
?>