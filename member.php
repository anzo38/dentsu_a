<?php
// require_once('smarty/Smarty.class.php');

require('./check.php');
require('./database.php');


    class Member extends Check {
       
        private $session_data="";
        private  $result_id="";
        private  $search_id="";
       
        function __construct(){
            parent::__construct();
            $this->session_data = new Check();

            
          
      
            $csv_dl=$_POST["csv_dl"];
        }

 

        function execute(){
        //  ini_set('display_errors', "On");
         
         $this->session_data->config_hash();
      
                 
        //  $this->csv_dl();
      
   
        //  $this->smarty->display("search_r/ults_data.tpl");
        
         $this->search();
        //  $this->csv();
    }
        

   


   
    // データベースから情報を取得
       
       function search(){

            //TODO　htmlspecialcharsを利用しましょう。
            $search=$_POST["search"];
            $search_id=htmlspecialchars($_POST["search_id"]);
            $search_name=htmlspecialchars($_POST["search_name"]);
            $search_e_mail=htmlspecialchars($_POST["search_e_mail"]);
            $search_login_id=htmlspecialchars($_POST["search_login_id"]);
            $search_date=htmlspecialchars($_POST["search_date"]);
            //TODO　htmlspecialcharsを利用しましょう。
            $back=$_POST["back"];
           

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

                if(empty($result)){
                    $this->smarty->assign('no_data',"情報がありません");
                }
                /**
                 * TODO:下記は全てtplにもっていくこと。
                 * TODO:member.tplは複数のTPLで構成されているが、一つのTPLでまとめて処理をすること。
                 * 
                 */
         
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
                  
                  
                    $this->smarty->assign('result_id', $result_id);
                    $this->smarty->assign('result_name', $result_name); 
                    $this->smarty->assign('result_e_mail',  $result_e_mail); 
                    $this->smarty->assign('result_login_id',  $result_login_id);  
                    $this->smarty->assign('result_date',  $result_date);
                    $this->smarty->display("search_results_data.tpl");
                   
                  
                }
                $this->smarty->display("search_results_table.tpl");
            }  
         

           
           
            $this->smarty->display('member.tpl');
        }


      
        // function assign_from_input(){
        //     $this->smarty->assign('id', $this->search_id);
        //     $this->smarty->assign('name', $this->search_name);
        //     $this->smarty->assign('e_mail', $this->search_e_mail);
        //     $this->smarty->assign('login_id', $this->search_login_id);
        //     $this->smarty->assign('date', $this->search_date);
           

        // }
        // function assigon_from_db(){

        //     $this->smarty->assign('result_id', $this->result_id);
        //     $this->smarty->assign('result_name', $this->result_name); 
        //     $this->smarty->assign('result_e_mail',  $this->result_e_mail); 
        //     $this->smarty->assign('result_login_id',  $this->result_login_id);  
        //     $this->smarty->assign('result_date',  $this->result_date);
        // }
    }


    $member = new Member();
    
    $member->execute();
?>