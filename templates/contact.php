<?php

require_once('smarty/Smarty.class.php');
// require('validate.php');

/**
 * TODO全体的にソースコードのインデントがおかしい気がします。プログラムの世界では、
 * ソースコードの書き出しの最初に4文字の空白を入れることが習わしとなっていてUNSも
 * それに従っていることが多いです。
 * TODOSmartyは親クラスで保持させること
 */
class Contact {

  //TODOグローバル変数は必ずなんのために利用している変数かコメントを記載しましょう。
  //flagを立てて
  private $gui=0;
  private $smarty=null;

  public $name="";
  public  $e_mail="";
  public  $question=[];
  public  $category="";
  public  $date="";
  public  $time_start="";
  public  $time_end="";
  public  $course="";
  public  $pass="";

  //CONFから取得したデータを整形した配列一式
  public $config_data;

 

  function __construct(){
    $this->gui = htmlspecialchars($_GET['gui']);

    $this->name = htmlspecialchars($_POST['name']);
    $this->e_mail = htmlspecialchars($_POST['e_mail']);
    $this->question = $_POST['question'];
  
    $this->category = htmlspecialchars($_POST['category']);
    $this->date = htmlspecialchars($_POST['date']);
    $this->time_start = $_POST['time_start'];
    $this->time_end = htmlspecialchars($_POST['time_end']);
    $this->course = htmlspecialchars($_POST['course']);
    $this->comment = htmlspecialchars($_POST['comment']);
    $this->login_id = htmlspecialchars($_POST['login_id']);
    $this->pass = htmlspecialchars($_POST['pass']);
    $this->pass2 = htmlspecialchars($_POST['pass2']);
    $this->to_signup =($_POST['to_signup']);
    $this->to_signup =($_POST['to_confirm']);
    $this->to_complete =($_POST['to_complete']);
    if (!is_array($this->question)){
      $this->question = [];
    }
    

    $this->smarty = new Smarty();
    $this->smarty->template_dir = './templates/';
    $this->smarty->compile_dir  = './templates_c/';
    $this->smarty->setConfigDir('./configs/');
    $this->smarty->configLoad('const.conf');
  }

  function execute(){
       //TODO：$this->guiに何も入力されていなかったら、1にいくようにしましょう。
    if($this->gui == 1){
      //入力画面の遷移先
      $this->gui1();
    }elseif($this->gui== 2){
      //確認画面の遷移先
      $this->gui2();
    }elseif($this->gui == 3){
      //完了画面の遷移先
      $this->gui3();
    }elseif($this->gui == 4){
      //完了画面の遷移先
      $this->gui4();
    }else{
    }


  }
 
   

  /**
   * TODO下記のような重要な関数はコメントを記載するようにしましょう。
   */
  function gui1(){
    $this->assign_value();
    $this->load_config_data();
    $this->smarty->display('input.tpl');
 
  }

  /**
   * TODO下記のような重要な関数はコメントを記載するようにしましょう。
   */
  function gui2(){
   
    $this->load_config_data();
    if(isset($this->to_signup)){
    
      $this->assign_value();
     
      $this->smarty->display('signup.tpl');
    }
 
    elseif($this->validate()){
      $this->load_config_data();
      $this->assign_value();
     
     
     
      $this->smarty->display('input.tpl');
     
     
    }else{
   
      $this->assign_value();
     
      $this->smarty->display('signup.tpl');
   
    }
 }
  /**
   * TODO下記のような重要な関数はコメントを記載するようにしましょう。
   */
 function gui3(){
 
  $this->load_config_data();
    if($this->login_validate()){
    $this->assign_value();
    $this->smarty->display('signup.tpl');
 
    }else{
     $this->assign_value();
     $this->smarty->display('confirm.tpl');
 
    }

}

  /**
   * TODO下記のような重要な関数はコメントを記載するようにしましょう。
   */
 function gui4(){
  // ini_set('display_errors', "On");
  $this->db_conect();
  $this->load_config_data();
  
 


  $this->assign_value();
  //  問い合わた側
  /**
   * TODO下記のハードコーディングしているデータは全てconfファイルにもっていくようにしましょう。
   * 例）const.confに
   * ADMIN_MAIL_TO=yamazaki@uns-j.co.jp
   * ADMIN_MAIL_TITLE=test
   * 
   * >お問合わせありがとうございました。メールが送信されていますのでご確認お願いします。
   * のような文字はsystem_constというconfファイルを作り、そこにシステムの定義ファイルを参照し、下記にassignするようにしましょう。
   * 理由は文字のようなデータは別ファイルにすることで、あとで流用しやすくなるからです。
   * 
   * 
   */
  $mailto = "yamazaki@uns-j.co.jp";
  $header = "From: $mailto\nReply-To: $mailto\n";
  $title = "test";
  $message = $this->smarty->fetch("mail.tpl");
  mb_language("Japanese");
  mb_internal_encoding("UTF-8");


  if(mb_send_mail($this->e_mail,$title,$message,$header,'-f' . 'yamazaki@uns-j.co.jp')){
    $this->smarty->assign('successful', 'お問合わせありがとうございました。メールが送信されていますので
    ご確認お願いします。');
  }else{
    $this->smarty->assign('decline', '送信できませんでした、再度お試しください');
  }
  // 管理者側
  $mailto_admin = "yamazaki@uns-j.co.jp";
  $header_admin = "From: $mailto_admin\nReply-To: $mailto_admin\n";
  $title_admin = "問い合わせがありました";
  $message_admin = $this->smarty->fetch("mail_admin.tpl");
    
  if(mb_send_mail('yamazaki@uns-j.co.jp',$title_admin,$message_admin,$header_admin,'-f' . 'yamazaki@uns-j.co.jp')) {
    $this->smarty->assign('successful_admin', 'お問合わせがありました。
  各担当者は確認後、対応をお願いします');
  }
    


  $this->smarty->display('complete.tpl');  
 }


 /**
  * TODO：下記のようなDB接続関数は一番上の親クラスがObjectとしてもっておくようにしましょう。
  */
 function  db_conect(){
  // $conf_data="";
  $conf_data=$this->smarty->getConfigVars();

      
      foreach($conf_data as $k =>$v){
        if(preg_match("/db/",$k)){
          $this->config_data["db"][$k]=$v;
      }
    }
   $db_name=$this->config_data["db"]["db_name"];
   $db_host=$this->config_data["db"]["db_host"];

   $dsn = "mysql:dbname=". $db_name.";host=". $db_host;
   $user = $this->config_data["db"]["db_user"];
   $password = $this->config_data["db"]["db_pass"];
   
  try {
      $dbh = new PDO($dsn, $user, $password);
      // echo "接続成功\n";
  } catch (PDOException $e) {
      echo "接続失敗: " . $e->getMessage() . "\n";
      exit();
  }
 

 
  $contact = 'INSERT INTO contact (name, e_mail, category, date, time_start, time_end, course, comment, login_id)  VALUE (:name, :e_mail, :category, :date, :time_start, :time_end, :course, :comment, :login_id)';
  $prepare = $dbh->prepare($contact);
  // date_default_timezone_set('Asia/Tokyo');

      $prepare->bindValue(':name', $this->name, PDO::PARAM_STR);
      $prepare->bindValue(':e_mail', $this->e_mail, PDO::PARAM_STR);
      $prepare->bindValue(':category', $this->category, PDO::PARAM_STR);
      $prepare->bindValue(':date', $this->date, PDO::PARAM_STR);
      $prepare->bindValue(':time_start',$this->time_start, PDO::PARAM_STR);
      $prepare->bindValue(':time_end', $this->time_end, PDO::PARAM_STR);
      $prepare->bindValue(':course', $this->course, PDO::PARAM_STR);
      $prepare->bindValue(':comment', $this->comment, PDO::PARAM_STR);
      $prepare->bindValue(':login_id', $this->login_id, PDO::PARAM_STR);
      $prepare ->execute();
  
   

      $last_id= $dbh->lastInsertId();
      $questions = 'INSERT INTO questions (contact_id, question)  VALUE (:contact_id, :question)';
      $prepare= $dbh->prepare($questions);

      $prepare->bindValue(':contact_id', $last_id, PDO::PARAM_STR);
     
      foreach($this->question as $k => $v){
       $prepare->bindValue(':question', $v, PDO::PARAM_STR);
       $prepare ->execute();
      }
     

}

 


 function login_validate(){
  $error=false;

  if(empty($this->login_id)){
    $error = true;
    $this->smarty->assign("login_id_error","ID入力してください");
  }
 if (!preg_match("/^[a-zA-Z0-9]+$/", $this->login_id)) {
    $error = true;
    $this->smarty->assign("login_id_word_error","半角英数字で入力してください");
 
  }


  if(empty($this->pass)){
   
    $error = true;
    $this->smarty->assign("pass_error","パスワードを入力してください");
  }
if ($this->pass !== $this->pass2){
    $error = true;
    $this->smarty->assign("pass_match_error","パスワードが一致しません");
  }


  if(empty($this->pass2)){
    $error = true;
    $this->smarty->assign("pass2_error","パスワード再入力してください");
  }
 
   return $error;
   
 

 }

 function assign_value(){
    $this->smarty->assign('name', $this->name);
    $this->smarty->assign('e_mail', $this->e_mail);
    $this->smarty->assign('question', $this->question);

    $this->smarty->assign('category', $this->category);
   
  
    $this->smarty->assign('date', $this->date);
    $this->smarty->assign('time_start', $this->time_start);
    $this->smarty->assign('time_end', $this->time_end);
    $this->smarty->assign('course', $this->course);
    $this->smarty->assign('comment', $this->comment);
    $this->smarty->assign('login_id', $this->login_id);
    $this->smarty->assign('pass', $this->pass);
    
    date_default_timezone_set('Asia/Tokyo');
    $this->smarty->assign('auto_time',"お問い合わせ日時：" . date("Y-m-d H:i"));
 }

 function validate() {
 $error=false;/*エラーの初期値を設定*/
 
 if (empty($this->name)){
   $error = true;
   $this->smarty->assign("name_error","名前を入力してください");
 }

 if (empty($this->e_mail)){
  $error = true;
  $this->smarty->assign("e_mail_error","メーアドレスを入力してください");
}
if (!is_array($this->question)){
  $error = true;
  $this->smarty->assign("question_error","1つ以上選択してください");
}
if (empty($this->category)){
  $error = true;
  $this->smarty->assign("category_error","選択してください");
}


if (empty($this->date)){
  $error = true;
  $this->smarty->assign("date_error","選択してください");
}

if (empty($this->time_start && $this->time_end)){
  $error = true;
  $this->smarty->assign("time_error","時間を指定してください");
}elseif($this->time_start >= $this->time_end){
  $error = true;
  $this->smarty->assign("differ_time_error","正しい時間を指定してください");
}



if (empty($this->course)){
  $error = true;
  $this->smarty->assign("course_error","コースを選択してください");
}

if (empty($this->comment)){
  $error = true;
  $this->smarty->assign("comment_error","入力してください");
}
 return $error;
}



// confファイルのデータによって項目が増える
  function  load_config_data(){
    // $conf_data="";
    //TODO：CONF情報は親クラスで保持させるようにしましょう。---START---
    $conf_data=$this->smarty->getConfigVars();

    
    foreach($conf_data as $k =>$v){
      if (preg_match("/question/",$k)){
        $this->config_data["question"][$k]=$v;
      }elseif(preg_match("/category/",$k)){
        $this->config_data["category"][$k]=$v;
      }elseif(preg_match("/course/",$k)){
        $this->config_data["course"][$k]=$v;
      }elseif(preg_match("/db/",$k)){
        $this->config_data["db"][$k]=$v;
      }
    }
    //TODO ---END---

    $this->smarty->assign("question_config_data",$this->config_data["question"]);
    $this->smarty->assign("category_config_data",$this->config_data["category"]);
    $this->smarty->assign("course_config_data",$this->config_data["course"]);


    
    // echo$this->config_data["db"]["db_name"];
  }

}

$contact = new Contact();

$contact->execute();
// $validate = new Validate();
// $validate->validate();

?>