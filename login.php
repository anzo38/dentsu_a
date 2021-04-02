<?php


require_once('admin.php');



/**
 * TODOインデントを気をつけましょう。:済
 * TODOコメントを記載しましょう。
 * TODOSmartyは全ての親クラスに持たせておいて利用できるようにしましょう。:済
 * TODO:session_regenerate_id();を利用すること
 */
class Login extends Admin{
    
    protected $e_mail="";
    protected $password="";
   
    
    function __construct(){
        // samrtyの呼び出し
        parent::__construct();
        
        $this->login_e_mail =  htmlspecialchars($_POST['login_e_mail']);
        $this->login_password =  htmlspecialchars($_POST['login_password']);
        $this->submit_btn = htmlspecialchars($_POST['submit_btn']);
       
        //displayはexitを含むここに書かない
        // $this->smarty->display('login.tpl');
    }
   

    function execute(){
       echo $this->util->getConfigLoginData()."てすと";
       // ログイン認証
      //入力されているものの暗号化
        $input_id = md5(md5($this->login_e_mail). md5($this->login_password) . md5($this->config_data['login']['login_salt'])); 
//         // ログインしたら新しいセッションIDを発行
//         // session_regenerate_id(true);
           
        if($this->submit_btn){
           $this->validation();
            if($input_id == $this->util->getConfigLoginData()){
                 $_SESSION['user']=$input_id;
                header('Location: /member.php');exit;
               
                }else{
                $this->smarty->assign("login_error","ログインに失敗しました。もう1度入力ください");
            }
        
        }
       

        echo $input_id."/";
        echo $this->util->getConfigLoginData();
        $this->smarty->display('login.tpl');
    } 

   
     
      
    function validation(){
        if (empty($this->e_mail)){
            $this->smarty->assign("e_mail_error","ログインE-mailを入力してください");
        
        }
        if (empty($this->password)){
            $this->smarty->assign("pass_error","ログインパスを入力してください");
     
        }
       
    }

    
}

$login = new Login();
$login ->execute();
