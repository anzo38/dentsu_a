<?php
require_once('./admin.php');
require('./database.php');



    class Member extends Admin {
       
        protected $session_data="";
        protected $result_id="";
        protected $search_id="";
        protected $util;

        private $member=0;

        function __construct(){
            parent::__construct();
            $this->member = htmlspecialchars($_GET['member']);
            $this->search = htmlspecialchars($_POST['search']);

            // $this->gui = htmlspecialchars($_GET['member']);
            $csv_dl=$_POST["csv_dl"];
        }

 

        function execute(){
            // 継続的認証
            $this->util->is_auth();

            if($this->member == 1){
                //検索結果の表示の遷移先
                $this->member1();
            
            }else{
                $this->member1();
            }
           
        }

        function member1(){
            // if($this->){

            // }
            $this->search();
           
            $this->smarty->display('member.tpl');

        }
        // function member2(){
        //     $this->search();

        //     $this->smarty->display('member.detail.tpl');

        // }
  
    // データベースから情報を取得
       
       function search(){

            //TODO htmlspecialcharsを利用しましょう。:済
            $search=htmlspecialchars($_POST["search"]);
            $search_id=htmlspecialchars($_POST["search_id"]);
            $search_name=htmlspecialchars($_POST["search_name"]);
            $search_e_mail=htmlspecialchars($_POST["search_e_mail"]);
            $search_login_id=htmlspecialchars($_POST["search_login_id"]);
            $search_date=htmlspecialchars($_POST["search_date"]);
            //TODO htmlspecialcharsを利用しましょう。:済
            $back=htmlspecialchars($_POST["back"]);
           

            //echo (Dbmanager->exec("select * from inquiry;"));
            // sql文
            $q_id="\n  id = '" . $search_id . "'";
            $q_name="\n name like '" . $search_name . "%". "'";
            $q_e_mail="\n e_mail like '" . "%" . $search_e_mail . "%". "'";
            $q_login_id="\n login_id like '" . $search_login_id . "%". "'";
            $q_date="\n  date = '" . $search_date . "'";

            $d_q='"';
        
            $query="SELECT * FROM contact WHERE 1=1";
          // ※1-1で全てANDで繋げれる
            if($search || $back){
                
                
                if(!empty($search_id)) {
                    $query .= "\n" . "AND" .$q_id;
                    $this->smarty->assign('id', $search_id);
                    
                }
                if(!empty($search_name)) {
                
                    $query .="\n" ."AND" .$q_name;
                    $this->smarty->assign('name', $search_name);
                 }
                if(!empty($search_e_mail)) {
                  
                    $query .="\n" ."AND" .$q_e_mail;
                    $this->smarty->assign('e_mail', $search_e_mail);
                }
                if(!empty($search_login_id)) {
                    $query .="\n" ."AND" .$q_login_id;
                    $this->smarty->assign('login_id', $search_login_id);
                }
                if(!empty($search_date)) {
                    $query .="\n" ."AND" .$q_date;
                    $this->smarty->assign('date', $search_date);
                }
          
              
             //結果を表示    
               $result = DbMabager::getInstance()->exec($query);
               $this->smarty->assign('result', $result);
                if(empty($result)){
                    $this->smarty->assign('no_data',"情報がありません");
                }
                /**
                 * TODO:下記は全てtplにもっていくこと。：済
                 * TODO:member.tplは複数のTPLで構成されているが、一つのTPLでまとめて処理をすること。
                 * ：済（member.tpl）へ 下記消去済み
                 */
            }
                
        }


      
        
    }


    $member = new Member();
    
    $member->execute();
?>