<?php

require('./admin.php');
require('./database.php');

/**
 * TODO：コメントを記載するようにしましょう。
 */
class Download extends Admin {
//    protected $csv=0;
//    public $id="";

    function __construct(){
        parent::__construct();
       
        $this->csv = htmlspecialchars($_GET['csv']);
        $this->id = htmlspecialchars($_GET['id']);
        $this->name = htmlspecialchars($_GET['name']);
        $this->e_mail = htmlspecialchars($_GET['e_mail']);
        $this->login_id = htmlspecialchars($_GET['login_id']);

        $this->date = htmlspecialchars($_GET['date']);

        //TODO：不要なコメントはできるだけ、削除するようにしましょう。
        // if($this->csv == 1){
        //     //入力画面の遷移先
        //     $this->csv1();
        //   }elseif($this->csv == 2){
        //     //確認画面の遷移先
        //     $this->csv2();
        //   }elseif($this->csv == 3){
        //     //完了画面の遷移先
        //     $this->csv3();
        //   }else{
          
        //   }

        // $this->smarty = new Smarty();
        // $this->smarty->template_dir = './templates/';
        // $this->smarty->compile_dir  = './templates_c/';
     
       
        // $this->smarty->setConfigDir('./configs/');
        // $this->smarty->configLoad('const.conf');
        // $result_id= htmlspecialchars($_POST["result_id"]);
        // $result_name=htmlspecialchars($_POST["result_name"]);
        //     $search_e_mail=htmlspecialchars($_POST["search_e_mail"]);
    }

    function execute(){

        ini_set('display_errors', "On");
        //TODO：不要なコメントはできるだけ、削除するようにしましょう。
        // echo $this->id;
        // echo $this->name;
        // echo $this->e_mail;
        // echo $this->login_id;

        // echo $this->date;
        //TODO:例えば、emailとlogin_idが入っていた場合はemailのみ検索条件が適用されるため、login_idの条件検索は無効となり、不具合である。
        //改修をすること。
        if(!empty($this->id)){
            $query="SELECT * FROM contact  WHERE id="."'$this->id'";
        
        }elseif(!empty($this->name)){
            $query="SELECT * FROM contact  WHERE "."\n name like '" . $this->name . "%". "'";;
            // echo $query;
        }elseif(!empty($this->e_mail)){
            $query="SELECT * FROM contact  WHERE "."\n e_mail like '" . $this->e_mail . "%". "'";
        }elseif(!empty($this->login_id)){
            $query="SELECT * FROM contact  WHERE "."\n login_id like '" . $this->login_id . "%". "'";
        }elseif(!empty($this->date)){
            $query="SELECT * FROM contact  WHERE id="."'$this->date'";
        
          //TODO:構文がおかしい
        }/**elseif(empty($this->id && $this->name && $this->e_mail && $this->login_id && $this->date)){
             $query="SELECT * FROM contact";
            
        }**/
        elseif(empty($this->id) && empty($this->name) && empty($this->e_mail) && empty($this->login_id) && empty($this->date)){
            $query="SELECT * FROM contact";
        }
        
    
        //TODO　DBManagerは親クラスで保持するようにして、子供のクラスで利用するようにしましょう。
        $result = DbManager::getInstance()->exec($query);
        $csv_data="ID,名前,メールアドレス,ログインID,電話可能日"."\r\n";
        $d_q='"'; 
    //    var_dump($result);exit;
        foreach($result as $k => $v){
                    
            foreach($v as $i => $j){
                if($i== "id"){
                    $result_id= $j;                
                }
                if($i== "name"){
                    $result_name = $j;   
                }
                if($i== "e_mail"){
                    $result_e_mail = $j;  
                }
                if($i== "login_id"){
                    $result_login_id = $j;     
                }
                if($i== "date"){
                    $result_date = $j;
                }
              
            }
                 
            $csv_data .=    $d_q . $result_id . $d_q .",";
            $csv_data .=   $d_q . $result_name . $d_q  .",";
            $csv_data .=   $d_q . $result_e_mail . $d_q  .",";
            $csv_data .=   $d_q . $result_login_id . $d_q  .",";
            $csv_data .=   $d_q . $result_date . $d_q  .",". "\r\n" ;
        }



       
        // $csv_id=  $d_q . $result_id . $d_q ;
        // $csv_id=  $d_q . $result_name . $d_q ;
        // $csv_name="aaaaaaa";
        
        // $csv_data .=  $d_q .$csv_e_mail . $d_q .",";
        // $csv_data .=  $d_q . $csv_login_id . $d_q ."," ;
        // $csv_data .=  $d_q .$csv_date ."\r\n" ;
    
        $csv_name = date('Ymd-His') . '.csv';
                    header('Content-Type: text/csv');
                    header('Content-Disposition: attachment; filename=' . $csv_name);
                    mb_convert_encoding($csv_data, 'sjis-win', 'utf-8');
                    echo $csv_data;
        // $this->smarty->assign('csv',$csv_data);
        // $this->smarty->display("test.tpl");   

        
    }
       
}

      
$test= new Download();
$test->execute();
?>