<?php
 require_once('smarty/Smarty.class.php');

/**
 * TODOコメントを書きましょう。
 * TODOCheckという命名がよくないです。
 * 例）Authクラスのような命名にしましょう。
 * TODO　このクラスは基本親として扱わず、Utility扱いで対応しましょう。
 * 例）Front系のクラスは親：Frontクラス　子：Contactクラス
 * 例）Admin系のクラスは親：Adminクラス　子：Loginクラス
 * 例）Admin系とFront系のクラスの共通の親クラスを持たせておき、Pageクラスのような命名で全てのクラスの一番上の
 * クラスをもたせておくとコードがスッキリして良い感じになります。この一番うえの親クラスに
 * SmartyObjectや、↓の処理のObejctクラスを持たせておき、そのObjectを子で利用できるようにしましょう。
 * TODO　全体的に不要なecho文（コメント）が多いので削除しましょう。
 * 
 * 
 */
class Check {
  protected $smarty=null;
  protected $email="";
  protected $loginpass="";
  protected $public="";

  /**
   * TODOコメントを書きましょう。
   */
  function __construct(){
   
    session_start();
    
      // $this->submit_btn = ($_POST['submit_btn']);
      // $this->email =  htmlspecialchars($_POST['email']);
      // $this->loginpass =  htmlspecialchars($_POST['loginpass']);

       $this->smarty = new Smarty();
       $this->smarty->template_dir = './templates/';
       $this->smarty->compile_dir  = './templates_c/';
    
      
       $this->smarty->setConfigDir('./configs/');
       $this->smarty->configLoad('const.conf');
      
    }
    
    /**
     * TODO:コメントを記載しましょう。
     * 例）継続的認証ロジック
     * TODO：継続的認証という関数がわかるような命名にすること
     * 例）is_auth,isAuthなどの文字が好ましい
     */
    function config_hash(){
      // session_start();
   
      
       $config_id= $this->smarty->getConfigVars()['login_id'];
       $config_pass= $this->smarty->getConfigVars()['login_pass'];
       $salt= $this->smarty->getConfigVars()['salt'];
       //conf側で管理されているものの暗号化
       $user_id = md5(md5($config_id) . md5($config_pass) . md5($salt) );
      //  ※login.phpでSESSIONに値入れている
      //  ここ↓で入れ直すと無条件でcong管理の値を格納している
      //  $_SESSION['user'] = $user_id;
       $user = $_SESSION['user'];
          // print_r($_SESSION['user']);echo "\n";
          // print_r($user);echo "\n";
          // print_r($_SESSION['user']);echo "\n";


          if($user != $user_id){

            header('Location: /login.php');
            exit;
          
          }  // }else{

          //   $this->smarty->display('member.tpl');
          // }
       

      
     
      // $this->smarty->display('member.tpl');
    }

  

   
  
  }
  // $c = new Check();
  // $c->config_hash();