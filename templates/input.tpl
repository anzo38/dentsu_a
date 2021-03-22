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
      
              <form method="post" action="contact.php?gui=2" class="needs-validation" novalidate>
                <div class="card-body">
                  <div class="form-group">
                    <label>名前<span class="required">＊</span></label>
                      <span class="error">{$name_error}</span>
                    <input type="text" name="name"  class="form-control" value="{$name}" size="30" maxlength="50" required>
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
           {* </div> *}
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