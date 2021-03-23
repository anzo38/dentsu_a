<?php
require_once('smarty/Smarty.class.php');
class Validate_characters{
    public $str="㊤";
    function __construct(){
        
        $this->smarty = new Smarty();
        $this->smarty->template_dir = './templates/';
        $this->smarty->compile_dir  = './templates_c/';
        $this->smarty->setConfigDir('./configs/');
        $this->smarty->configLoad('const.conf');

    }

    function execute($str){
        // 現在の文字コードを取得
        $_encode = mb_detect_encoding($str);

        // SJIS-winに変換
        if( $_encode != "SJIS-win" ){
            mb_convert_encoding($str, "SJIS-win", $_encode);
        }
        $search = array(
            'Ⅰ','Ⅱ','Ⅲ','Ⅳ','Ⅴ','Ⅵ','Ⅶ','Ⅷ','Ⅸ','Ⅹ',
            'ⅰ','ⅱ','ⅲ','ⅳ','ⅴ','ⅵ','ⅶ','ⅷ','ⅸ','ⅹ',
            '①','②','③','④','⑤','⑥','⑦','⑧','⑨','⑩',
            '⑪','⑫','⑬','⑭','⑮','⑯','⑰','⑱','⑲','⑳',
            '№','㈲','㈱','㈹',
            '㊤','㊦','㊥','㊧','㊨',
            '髙','﨑','彅','塚','增','寬','敎','晴','朗','﨔','橫','德','瀨',
            '淸','瀨','凞','猪','益','礼','神','祥','福','靖','精','濵','琦','昻',
            '緖','羽','薰','諸','賴','逸','郞','都','鄕','閒','隆','靑','飯','飼','館',
            '鶴','黑',
            '㍉','㌔','㌢','㍍','㌘','㌧','㌃','㌶','㍑',
            '㍗','㌍','㌦','㌣','㌫','㍊','㌻',
            '㎜','㎝','㎞','㎏','㏄','㎡',
            '㍻','〝','〟','℡','㍾','㍽','㍼','㏍'
          );
        $replace = array(
            'I','II','III','IV','V','VI','VII','VIII','IX','X',
            'i','ii','iii','vi','v','vi','vii','viii','ix','x',
            '(1)','(2)','(3)','(4)','(5)','(6)','(7)','(8)','(9)','(10)',
            '(11)','(12)','(13)','(14)','(15)','(16)','(17)','(18)','(19)','(20)',
            'No.','（有）','（株）','(代)',
            '(上)','(下)','(中)','(左)','(右)',
            '高','崎','なぎ','塚','増','寛','教','晴','朗','欅','横','徳','瀬',
            '清','瀬','煕','猪','益','礼','神','祥','福','靖','精','濱','埼','昂',
            '緒','羽','薫','諸','頼','逸','郎','都','郷','間','隆','青','飯','飼','館',
            '鶴','黒',
            'ミリ','キロ','センチ','メートル','グラム','トン','アール','ヘクタール','リットル',
            'ワット','カロリー','ドル','セント','パーセント','ミリバール','ページ',
            'mm','cm','km','kg','cc','平方メートル',
            '平成','"','"','TEL','明治','大正','昭和','K.K.'
          );
          $result = str_replace($search, $replace, $str);
            // 半角カナを全角カナ 全角英字を半角英字
            $result = mb_convert_kana($result, "KV");

            // 機種依存文字を変換
            // $ret = str_replace($search, $replace, $str);
            // UTF-8に変換
            // $result = mb_convert_encoding($ret, 'UTF-8', "SJIS-win");

              echo $result;
    //   if(in_array($characters,$search)){

    //     $this->smarty->assign('no','不可能な文字が含まれています');
    //   }else{
    //     $this->smarty->assign('yes','不可能な文字が含まれていません');
    //   }

      $this->smarty->display('test.tpl');
    }
  
    

}
$test = new Validate_characters();
$test->execute($characters);