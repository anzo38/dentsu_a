<?php


/**
 * TODOコメントを書きましょう。
 * TODOCheckという命名がよくないです。：済
 * 例）Authクラスのような命名にしましょう。：済
 * TODO　このクラスは基本親として扱わず、Utility扱いで対応しましょう。：済
 * 例）Front系のクラスは親：Frontクラス　子：Contactクラス
 * 例）Admin系のクラスは親：Adminクラス　子：Loginクラス
 * 例）Admin系とFront系のクラスの共通の親クラスを持たせておき、Pageクラスのような命名で全てのクラスの一番上の
 * クラスをもたせておくとコードがスッキリして良い感じになります。この一番うえの親クラスに
 * SmartyObjectや、↓の処理のObejctクラスを持たせておき、そのObjectを子で利用できるようにしましょう。
 * TODO　全体的に不要なecho文（コメント）が多いので削除しましょう。：済
 */

class Utility{
    
    //Smartyオブジェクト
    private $smarty;

    //Smartyによって取得されたコンフィグデータ（設定値）
    private $config_data;
   

    /**
     * TODOコメントを書きましょう。
     * smartyが使えるようにる(Smarty $smarty)
     */
    public function __construct(){

        
        $this->smarty = $this->initializeSmarty();
        $this->config_data = $this->initializeConfigData();
    }

    /**
     * Smartyオブジェクトを返却
     */
    public function getSmarty() : Smarty{
        return $this->smarty;
    }

    /**
     * ConfigDataArrayの返却
     */
    public function getConfigDBData() : Array{
        return $this->config_data["db"];
    }

    public function getConfigData() : Array {
        return $this->config_data;
    }

    /**
     * Smartyオブジェクトの生成
     */
    private function initializeSmarty() : Smarty{
        //Smarty初期化                                                                                                              化
        $smarty = new Smarty();

        $smarty->template_dir = './templates/';
        $smarty->compile_dir  = './templates_c/';
        $smarty->setConfigDir('./configs/');
        $smarty->configLoad('const.conf');                                
        
        return $smarty;
    }

    /**
     * Smartyによって設定値の取得
     */
    private function initializeConfigData() : Array{
        $conf_data=$this->smarty->getConfigVars();
        foreach($conf_data as $k =>$v){
            if (preg_match("/question/",$k)){
                $config_data["question"][$k]=$v;
            }elseif(preg_match("/category/",$k)){
                $config_data["category"][$k]=$v;
            }elseif(preg_match("/course/",$k)){
                $config_data["course"][$k]=$v;
            }
            elseif(preg_match("/db/",$k)){
                $config_data["db"][$k]=$v;
            }
            elseif(preg_match("/login/",$k)){
                $config_data["login"][$k]=$v;
            }
        }
        return $config_data;
    }
  
    public function getConfigLoginData(){
        $config_id= $this->config_data['login']['login_id'];
      
        $config_pass= $this->config_data['login']['login_pass'];
        $salt= $this->config_data['login']['login_salt'];
        //conf側で管理されているものの暗号化
        $user_id = md5(md5($config_id) . md5($config_pass) . md5($salt) );
        return $user_id;
    }
   
    // 継続的認証
    public function is_auth() : bool {
        
    /**
     * TODO:コメントを記載しましょう。：済
     * 例）継続的認証ロジック
     * TODO：継続的認証という関数がわかるような命名にすること：済
     * 例）is_auth,isAuthなどの文字が好ましい
     */
    // $config_id= $this->config_data['login']['login_id'];
      
    // $config_pass= $this->config_data['login']['login_pass'];
    // $salt= $this->config_data['login']['login_salt'];
    // //conf側で管理されているものの暗号化
    // $user_id = md5(md5($config_id) . md5($config_pass) . md5($salt) );

      //  ※login.phpでSESSIONに値入れている
      //  ここ↓で入れ直すと無条件でcong管理の値を格納している
    //    $_SESSION['user'] = $user_id;
       $user = $_SESSION['user'];

            if($user != $this->getConfigLoginData()){
                //認証失敗時
                return false;
            }
        return true;
    }
 

}
