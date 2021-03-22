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
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
  
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Sign in </p>
      {$login_error}
      <form action="" method="post" class="needs-validation" novalidate>
       <label for="sign_in_name">sign in</label>
       <div class="input-group mb-3">
          <input type="email" class="form-control" id="sign_in_name" placeholder="Email" name="login_e_mail" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
          <div class="invalid-feedback">
           {$e_mail_error}
          </div>
        </div>

        <label for="pass_word_n">password</label>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="password" name="login_password" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
          <div class="invalid-feedback">
          {$pass_error}
          </div>
        </div>
  
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                Remember Me
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <input type="submit" class="btn btn-primary btn-block" name="submit_btn" value="Sign In">
          </div>
          <!-- /.col -->
        </div>
      </form>

      <div class="social-auth-links text-center mb-3">
        <p>- OR -</p>
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
        </a>
      </div>
      <!-- /.social-auth-links -->

      <p class="mb-1">
        <a href="forgot-password.html">I forgot my password</a>
      </p>
      <p class="mb-0">
        <a href="register.html" class="text-center">Register a new membership</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->
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

{* <form method="post"  action="">
<h1>login.php</h1>
{$login_error}
<p>ログインE-mail</p>
<p class="is-error">{$email_error}</p>
<input type="text" placeholder="E-mail" name ="email" value="{$email}">
<p>ログインパスワード</p>
<p class="is-error">{$pass_error}</p>
<input type="password" placeholder="Password" name="loginpass" value="{$email}">
<input type="submit" name="submit_btn" value="ログインする">
</form> *}



{* <form method="post"  action="">
<h1>login.php</h1>
<p>ログインE-mail</p>
<p class="is-error">{$email_error}</p>
<input type="text" placeholder="E-mail" name ="email" value="{$email}">
<p>ログインパスワード</p>
<p class="is-error">{$pass_error}</p>
<input type="password" placeholder="Password" name="loginpass" value="{$email}">
<input type="submit" name="submit_btn" value="ログインする">
</form> *}
{* <form method="post" action="login.php?login=1">
<input type="hidden" name ="email" value="{$email}">
<input type="hidden" name="loginpass" value="{$email}">
</form> *}