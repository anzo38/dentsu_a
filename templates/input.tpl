<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="keywords" content="電通,Dentsu,でんつう,広告会社,広告代理店,GoodInnovation,新規お取引のご相談,投資家情報に関するお問い合わせ,株式に関するお問い合わせ,採用に関するお問い合わせ,クリエイティブに関するお問い合わせ,個人情報に関するお問い合わせ,その他のお問い合わせ" />
<meta name="description" content="電通へのお問い合わせに関しての情報をご覧頂けます。" />
<title>クリエイティブに関するお問い合わせ - 電通</title>
<link rel="stylesheet" type="text/css" href="mycss.css">
<link rel="stylesheet" type="text/css" href="index.css">

<link rel="stylesheet" type="text/css" href="https://contact.dentsu.jp/img?id=8&t=9lwd&v=4fa273ee">
<link rel="stylesheet" type="text/css" href="https://contact.dentsu.jp/img?id=9&t=9lwd&v=9deac94d">
<link rel="stylesheet" type="text/css" href="https://contact.dentsu.jp/img?id=10&t=9lwd&v=11ca2aa3">
<link rel="stylesheet" type="text/css" href="https://contact.dentsu.jp/img?id=11&t=9lwd&v=f2198aa5">
<script type="text/javascript" src="https://contact.dentsu.jp/img?id=12&t=9lwd&v=4be94c2c"></script>
<script type="text/javascript" src="https://contact.dentsu.jp/img?id=13&t=9lwd&v=d43c19a6"></script>
<script type="text/javascript" src="https://contact.dentsu.jp/img?id=14&t=9lwd&v=88eb5d97"></script>

<style>
.error{
    color:red;
}
</style>
</head>
<body class="other">
    <div id="contentAll">
    <div id="headLogo">
        <p><a href="https://www.dentsu.co.jp/"><img src="https://contact.dentsu.jp/img?id=290&t=9lwd&v=2ccd6373" width="150" height="32" alt="dentsu" /></a></p>
    <!--/headLogo--></div>
    <div id="contentHeadWrapper">
        <div id="contentHead">
            
            <ul id="globalMenu"><!--
                --><li id="globalMenu01"><a href="https://www.dentsu.co.jp/vision/">企業情報</a></li><!--
                --><li id="globalMenu02"><a href="https://www.dentsu.co.jp/business/">事業紹介</a></li><!--
                --><li id="globalMenu03"><a href="https://www.dentsu.co.jp/global/">グローバルネットワーク</a></li><!--
                --><li id="globalMenu04"><a href="https://www.dentsu.co.jp/news/">ニュース</a></li><!--
                --><li id="globalMenu05"><a href="https://www.dentsu.co.jp/ir/">IR情報</a></li><!--
                --><li id="globalMenu06"><a href="https://www.dentsu.co.jp/csr/">CSR</a></li><!--
                --><li id="globalMenu07"><a href="https://www.dentsu.co.jp/recruit/">採用情報</a></li><!--
            --></ul>
        <!--/contentHead--></div>
    <!--/contentHeadWrapper--></div>
        
        <div id="breadCrumb">
            <ul><!--
                --><li><a href="https://www.dentsu.co.jp/">HOME</a></li><!--
                --><li><a href="https://www.dentsu.co.jp/mail/">お問い合わせ</a></li><!--
                --><li>クリエイティブに関するお問い合わせ</li>
        <!--
                  
        --></ul>
        <!--/breadCrumb--></div>
        
        <div id="contentBodyWrapper">
            <div id="contentBody">
            
                <h1>Contact</h1>
             
                <div id="contentBodyMain" class="wideContent">
                <h2>クリエイティブに関するお問い合わせ</h2>
                <p class="BodyText margB10">お問い合わせをいただきまして、ありがとうございます。<br />
                ご返答させていただくにあたり、できる限り早くご返答をさせていただくつもりですが、特定の広告主や広告作品に関するお問い合わせは、お答えできない場合があることをご了承ください。<br />
                また、ご相談内容や諸条件によりましてはお返事に日数がかかる場合もございます。あわせてご了承ください。</p>
                <ul class="List">
                    <li>内容は可能な限り具体的にご記入をお願いいたします。</li>
                    <li><span class="required">＊</span>印の項目は必ずご記入をお願いいたします。</li>
                </ul>
                <form action="contact.php?gui=2" method="post">
                 <table class="formTable">
                    <tr>
                     <th>名前<span class="required">＊</span>
                     <span class="error">{$name_error}</span></th>
                     <td><input type="text" name="name" id="e_163" value="{$name}" size="30" maxlength="50" /></td>
                    </tr>
                    <tr>
                     <th>メールアドレス<span class="required">＊</span>
                      <span class="error">{$e_mail_error}</span></th>
                     <td><input type="email" name="e_mail" id="e_164" value="{$e_mail}" size="30" maxlength="50" /></td>
                    </tr>
    
                    <tr>
                     <th>お聞きしたい内容<span class="required">＊</span>
                     <span class="error">{$question_error}</span></th>
                             
        
                     {foreach $question_config_data as $key => $question_v}
                        {if in_array($key,$question)}
                        <td><label><input type="checkbox" name="question[]" value="{$key}" checked="checked">{$question_v}<label></td>
                       
                        
                        {else}
                        <td><label><input type="checkbox" name="question[]" value="{$key}">{$question_v}<label></td>
                   
                        {/if}
                        
                     {/foreach}
                    </tr>
                    
                   <tr>
                     <th>カテゴリ<span class="required">＊</span>
                     <span class="error">{$category_error}</span></th>
                     
                     {foreach $category_config_data as $key  => $category_v}
                      {if $key == $category}
                      <th><label><input type="radio" name="category" value="{$key}" checked="checked">{$category_v}</label></th>
                      {else}
											<th><label><input type="radio" name="category" value="{$key}">{$category_v}</label></th>
											 {/if}
                     {/foreach}
                    
                    </tr>
                    <tr>
                        <th>電話可能日<span class="required">＊</span>
                        <span class="error">{$date_error}</span></th>
                        <td><input type="date" name="date" value="{$date}"></td>
                    </tr>
                    <tr>
                     <th>電話可能時間帯<span class="required">＊</span>
                     <span class="error">{$time_error}</span>
                     <span class="error">{$differ_time_error}</span></th>
                     <td>
                     <input type="time" name="time_start"  min="10:00" max="19:00" value={$time_start} >
                     <span>〜</span>
                     <input type="time" name="time_end" min="10:00" max="19:00" value={$time_end}>
                     </td> 
                    </tr>
                    <tr>
                     <th>コース<span class="required">＊</span>
                     <span class="error">{$course_error}</span></th>
                     <td>
                     <select name="course" id="e_195">
                       <option  selected="selected">---お選び下さい---</option>
                      {foreach $course_config_data as $key  => $course_v}
                      {if $course_v == $course}
                     <option selected>{$course_v}</option>
                     {else}
                   
                      <option >{$course_v}</option>
                      {/if}
                     {/foreach}
                     </select>
                     </td>
                    </tr>
                    
                   <tr>
                     <th class="vAlignM">お問い合わせ内容<span class="required">＊</span>
                     <span class="error">{$comment_error}</span></th>
                     <td>
                     <textarea name="comment" rows="10" cols="50" id="e_193" >{$comment}</textarea>
                     </td>
                    </tr>
                    
    
                    <tr>
                        <th></th>
                        <td>
                                <ul class="Button_event margB00"><!--
                                    --><li><input type="submit" name="__send" id="__send" value="確認" /></li><!--
                                    --><li><input type="reset" value="リセット" /></li><!--
                                --></ul>
                        </td>
                    </tr>
                    </table>

                    <input type="hidden" name="__search_e_165" id="__search_e_165" value="" /><input type="hidden" name="__name" value="" /><input type="hidden" name="f" id="f" value="13" />
					<input type="hidden"name="login_id"   value="{$login_id}">
</form>
                <!--/contentBodyMain--></div>
                
            <!--/contentBody--></div>
        <!--/contentBodyWrapper--></div>
        <div id="contentFootWrapper">
    <div id="contentFoot"><!--
        --><!--
        --><ul class="utilityLink"><!--
                    --><li><a href="https://www.dentsu.co.jp/terms/privacy_policy.html">個人情報の取扱いについて</a></li><!--
                    --><li><a href="https://www.dentsu.co.jp/terms/">このサイトのご利用にあたって</a></li><!--
                    --><li><a href="https://www.dentsu.co.jp/terms/rss.html">RSSについて</a></li><!--
                    --><li><a href="https://www.dentsu.co.jp/lookup/sitemap.html">サイトマップ</a></li><!--
                    --><li><a href="https://www.dentsu.co.jp/mail/">お問い合わせ</a></li><!--
        --></ul><!--
    --></div>
    <p id="footLogo"><a href="https://www.dentsu.co.jp/"><img src="https://contact.dentsu.jp/img?id=292&t=9lwd&v=98138e88" width="96" height="21" alt="dentsu" /></a></p>
    <p id="copyRight">&copy; DENTSU INC. ALL RIGHTS RESERVED.</p>
    <!--/contentFootWrapper--></div>
    <div id="fixPageTop">
        <p><a href="#"><img src="https://contact.dentsu.jp/img?id=293&t=9lwd&v=aaad2206" alt="ページTOPへ" /></a></p>
    <!--/fixPageTop--></div>
<!-- SiteCatalyst code version: H.21.
Copyright 1996-2010 Adobe, Inc. All Rights Reserved
More info available at http://www.omniture.com -->
<script type="text/javascript" src="https://contact.dentsu.jp/img?id=116&t=9lwd&v=0e6b34bc"></script>
<!--/DO NOT REMOVE/-->
<!-- End SiteCatalyst code version: H.21. -->
<!--/contentAll--></div>
    
{* <style>
.gdpr #contentFootWrapper{
    padding-bottom: 200px;
}
[data-gdpr="wrap"]{
    background-color: #000 !important;
    padding: 40px 5% 30px !important;
}
[data-gdpr="wrap"] div p{
    top: -25px !important;
    font-size: 14px !important;
    line-height: 1.5 !important;
}
[data-gdpr="wrap"] div img{
    width: 20px !important;
    height: 20px !important;
}
</style> *}
{* <div data-gdpr="wrap" style="background: #000; bottom:0; left:0; position: fixed; z-index: 500; padding: 60px 5%; box-sizing: border-box; width: 100%;" >
  <div style="position: relative">
    <p style="text-align: right; font-size:0; line-height:0; margin-bottom: 10px; position: absolute; right:-2%; top:-38px;"><a href="javascript:void(0)" data-gdpr="button" style="display: inline-block;"><img src="https://contact.dentsu.jp/img?id=342&t=9lwd&v=d85857f4" alt="閉じる" style="width: 24px; height:24px;"></a></p>
    <p style="color:#fff; font-size:16px; line-height:1.8;">このウェブサイトではサイトの利便性の向上を目的にクッキーを使用します。ブラウザの設定によりクッキーの機能を変更することもできます。詳細は<a href="https://www.dentsu.co.jp/terms/cookie_policy.html" style="color:#fff; text-decoration:underline;">クッキーポリシーについて</a>をご覧ください。サイトを閲覧いただく際には、クッキーの使用に同意いただく必要があります。</p>
  </div>
</div>
<script>
  (function () {
    /**
    * クッキー操作
    */
    var COOKIECTRL = {
      get: function(name) {
        var cookies = document.cookie.split(';');
        for (var index = 0, length = cookies.length; index < length; index += 1) {
          var temp = cookies[index].replace(/\s/g, '').split('=');
          if(temp[0] === name){
            return decodeURIComponent(temp[1]);
          }
        }
        return null;
      },
      set: function(name, value, expires, path, domain, secure){
        var d = document;
        var today = new Date();
        if (expires){
          expires = expires * 1000 * 60 * 60 * 24;
        }
        var expires_date = new Date( today.getTime() + (expires));
        d.cookie = name+'='+encodeURIComponent(value) +
          ((expires)? ';expires='+expires_date.toUTCString() : '') +
          ((path)? ';path=' + path : '')+
          ((domain)? ';domain=' + domain : '')+
          ((secure)? ';secure' : '' );
      },
      del: function(name, path, domain){
        var d = document;
        if (this.get(name)){
          d.cookie = name + '=' +
            ((path)? ';path=' + path : '') +
            ((domain)? ';domain=' + domain : '') +
            ';expires=Thu, 01-Jan-1970 00:00:01 GMT';
        }
      }
    };
    var body = document.querySelector('body');
    var wrap = document.querySelector('div[data-gdpr="wrap"]');
    var button = document.querySelector('a[data-gdpr="button"]');
    var COOKIE_NAME = 'dinc_cookieAccepted';
    var GDPR = 'gdpr';
    var getClassList = function () {
      return Array.prototype.slice.call(body.classList);
    };
    if (COOKIECTRL.get(COOKIE_NAME)) {
      // GDPR表示なし
      // GDPRを非表示にする
      wrap.style.display = 'none';
    }
    else {
      // GDPR表示あり
      // body要素のclass属性値に「gdpr」を付加する
      var classes = getClassList();
      classes.push(GDPR);
      body.className = classes.join(' ');
      // ボタンをクリックされた際の動作
      button.addEventListener('click', function () {
        // body要素のclass属性値から「gdpr」を削除する
        var classes = getClassList();
        body.className = classes.filter(function (className) {
          return className !== GDPR;
        }).join(' ');
        // クッキーにフラグをGDPR非表示フラグを立てる
        COOKIECTRL.set(COOKIE_NAME, 'true', 365, '/');
        // GDPRを非表示にする
        wrap.style.display = 'none';
      });
    }
  })();
</script> *}
</body>
</html>
