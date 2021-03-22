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
  .no-display{
    display:none;
  }
  </style>
</head>
<body  class="hold-transition login-page">
  <div class="card card-primary">
      <div class="card-header">
        <h3 class="card-title">サインアップ</h3>
      </div>
     <div class="card-body">
        <p>名前:{$name}</p>
        <p>メールアドレス:{$e_mail}</p>
        <p>お聞きしたいこと:
          {foreach $question as $key => $question_array}
            {$question_config_data[$question_array]}
          {/foreach}
        </p>
        <p>カテゴリー:{$category_config_data[$category]}</p>
        <p>電話可能日:{$date}</p>
        <p>電話可能時間帯:{$time_start}-{$time_end}</p>
        <p>コース:{$course}</p>
        <p>お問合わせ内容:{$comment}</p>
     </div>
     
     <form method="post" action="contact.php?gui=3" class="needs-validation" novalidate>
       <div class="card-body">
          {* gui=1の情報を一緒gui=3にPOSTする *}
          <input type="hidden" name="name" value="{$name}">
          <input type="hidden" name="e_mail" value="{$e_mail}">
          {foreach $question as $key => $question_v}
            <td><label><input type="hidden" name="question[]" value="{$question_v}"><label></td>
          {/foreach}
          {foreach $category as $key => $category_v}
          <input type="hidden" name="category" value="{$category_v}">
          {/foreach}
          <input type="hidden" name="date" value="{$date}">
          <input type="hidden" name="time_start" value="{$time_start}">
          <input type="hidden" name="time_end" value="{$time_end}">
          <input type="hidden" name="course" value="{$course}">
          <input type="hidden" name="comment" value="{$comment}">
         
          <div class="form-group">
            <p>ID（半角英数字のみ）</p>
            <span class="error">{$login_id_error}</span><br>
            <span class="error">{$login_id_word_error}</span><br>
            <input type="text" name="login_id" value="{$login_id}">
          </div>
          
          <div class="form-group">
            <p>パスワード</p>
            <span class="error">{$pass_error}{$strlen_error}</span><br>
            <span class="error">{$pass_match_error}</span><br>
            <input type="password"  name="pass" placeholder="Password"  value="{$pass}" >
          </div>
          <div class="form-group">
            <p>パスワード再入力</p>
            <span class="error">{$pass2_error}</span><br>
            <input type="password"  name="pass2" placeholder="Password" value="{$pass2}">
          </div>
              
        </div>
      
        <div class="card-footer">
          <input type="submit" name="to_confirm" class="btn btn-primary" value="確認" >
        </div>
      </form>
      {* 修正する *}
     <div class="card-footer">
         <form method="post" action="contact.php?gui=1">
              <input type="hidden" name="name" value="{$name}">
              <input type="hidden" name="e_mail" value="{$e_mail}">
              {foreach $question as $key => $question_v}
                <td><label><input type="hidden" name="question[]" value="{$question_v}"><label></td>
              {/foreach}
              {foreach $category as $key => $category_v}
              <input type="hidden" name="category" value="{$category_v}">
              {/foreach}
              <input type="hidden" name="date" value="{$date}">
              <input type="hidden" name="time_start" value="{$time_start}">
              <input type="hidden" name="time_end" value="{$time_end}">
              <select name="course"class="no-display">
              {foreach $course as $key => $course_v}
              <option type="hidden">{$course_v}</option>
              {/foreach}
              <select>
              <input type="hidden" name="comment" value="{$comment}">
              <input type="hidden"name="login_id"  placeholder="E-mail" value="{$login_id}">
             <input type="submit" class="btn btn-primary" value="修正する">
        </form>
      </div>
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