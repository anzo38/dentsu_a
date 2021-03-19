<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 3 | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="./css/admin_lte/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="./css/admin_lte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./css/admin_lte/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <title>ログインフォーム</title>

<style>
 .required{
   color:red;
   font-size: 14px;
   }
   .error{
   color:red;
   font-size: 14px;
   }
</style>



  
</head>
<body class="hold-transition login-page">
  <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">お問合わせフォーム</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form method="post" action="" class="needs-validation" novalidate>
                <div class="card-body">
                  <div class="form-group">
                    <label>名前<span class="required">＊</span></label>
                     <span class="error">{$name_error}</span>
                    <input type="text" name="name"  class="form-control" value="{$name}" size="30" maxlength="50">
                  </div>

                  <div class="form-group">
                    <label>メールアドレス<span class="required">＊</span></label>
                     <span class="error">{$e_mail_error}</span>
                    <input type="email" name="e_mail"  class="form-control" value="{$e_mail}" size="30" maxlength="50">
                  </div>
                  
                  <div class="form-group">
                   <label>お聞きしたい内容<span class="required">＊</span></label>
                    <span class="error">{$question_error}</span>
                        {foreach $question_config_data as $key => $question_v}
                          <div class="form-check">
                            {if in_array($key,$question)}
                            <label class="form-check-label"><input type="checkbox" name="question[]" value="{$key}" checked="checked">{$question_v}<label>
                            {else}
                            <label class="form-check-label"><input type="checkbox" name="question[]" value="{$key}">{$question_v}<label>
                            {/if}
                          </div>
                        {/foreach}
                  </div>
                      
                  <div class="form-group">
                    <label>カテゴリ<span class="required">＊</span></label>
                     <span class="error">{$category_error}</span></th>
                     {foreach $category_config_data as $key  => $category_v}
                      <div class="form-check">
                        {if $key == $category}
                        <label class="form-check-label"><input type="radio" name="category" value="{$key}" checked="checked">{$category_v}</label>
                        {else}
                         <label class="form-check-label"><input type="radio" name="category" value="{$key}">{$category_v}</label>
                        {/if}
                      </div>
                     {/foreach}
                  </div>

                  <div class="form-group">
                    <label>電話可能日<span class="required">＊</span></label>
                    <span class="error">{$date_error}</span>
                    <input type="date" name="date" value="{$date}">
                  </div>

                  <div class="form-group">
                    <label>電話可能時間帯<span class="required">＊</span></label>
                    <span class="error">{$time_error}</span>
                    <span class="error">{$differ_time_error}</span>
                    <input type="time" name="time_start"  min="10:00" max="19:00" value={$time_start} >
                    <span>〜</span>
                    <input type="time" name="time_end" min="10:00" max="19:00" value={$time_end}>
                  </div>

                   <div class="form-group">
                    <label>コース<span class="required">＊</span></label>
                    <span class="error">{$course_error}</span>
                    <select name="course" >
                    <option  selected="selected">---お選び下さい---</option>
                    {foreach $course_config_data as $key  => $course_v}
                      {if $course_v == $course}
                     <option selected>{$course_v}</option>
                     {else}
                    <option >{$course_v}</option>
                      {/if}
                     {/foreach}
                     </select>
                  </div>

                  <div class="form-group">    
                      <label>お問い合わせ内容<span class="required">＊</span></label>
                       <span class="error">{$comment_error}</span>
                         <textarea name="comment"class="form-control" rows="4">{$comment}</textarea>
                  </div>

                </div>
                <div class="card-footer">
                 <input type="submit" name="to_signup" type="submit" class="btn btn-primary" value="確認" />
                </div>
              </form>
            </div>

  </div>


<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
<!-- jQuery -->

<script src="./css/admin_lte/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="./css/admin_lte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="./css/admin_lte/dist/js/adminlte.min.js"></script>

</body>
</html>

{* <!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<title>ログインフォーム</title>
</head>
<style>
 .is-error{
   color:red;
   font-size: 14px;
   }
</style>
<body> *}




{* 
<style>
.error{
    color:red;
}
</style> *}


{*        
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
</form> *}
               
    <!--/fixPageTop-->
<!-- SiteCatalyst code version: H.21.
Copyright 1996-2010 Adobe, Inc. All Rights Reserved
More info available at http://www.omniture.com -->

<!--/DO NOT REMOVE/-->
<!-- End SiteCatalyst code version: H.21. -->
<!--/contentAll-->
    
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
