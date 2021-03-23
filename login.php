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
        $this->e_mail =  htmlspecialchars($_POST['login_e_mail']);
        $this->password =  htmlspecialchars($_POST['login_password']);
        $this->submit_btn = htmlspecialchars($_POST['submit_btn']);
        
        //displayはexitを含むここに書かない
    }
   

    function execute(){
      // ログイン認証
        session_start();
      
       
        $config_id= $this->smarty->getConfigVars()['login_id'];
        $config_pass= $this->smarty->getConfigVars()['login_pass'];
        $salt= $this->smarty->getConfigVars()['salt'];
        print_r($salt);
        //conf側で管理されているものの暗号化
        $user_id = md5(md5($config_id) . md5($config_pass) . md5($salt));

        //入力されているものの暗号化
        $input_id = md5(md5($this->e_mail). md5($this->password) . md5($salt)); 

        if($this->submit_btn){
            $this->validation();
            if($input_id == $user_id){
                $_SESSION['user']=$input_id;
                // ログインしたら新しいセッションIDを発行
                // session_regenerate_id(true);
                header('Location: /member.php');
                    }elseif($input_id !== $user_id){
                        $this->smarty->assign("login_error","ログインに失敗しました。もう1度入力ください");
            }
        }
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
