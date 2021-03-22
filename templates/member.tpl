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
  <title>検索フォーム</title>
<body class="hold-transition login-page">

    <div class="card card-primary">
        <div class="card-header">
        <h3 class="card-title">検索フォーム</h3>
        </div>
        
         {$no_data}
        <form method="post" action="member.php?member=1" class="needs-validation">
            <div class="card-body">
               <div class="form-group">
                    <p>id:</p>
                    <input type="text" name="search_id" value={$id}>
                </div>
                <div class="form-group">
                    <p>name:</p>
                    <input type="text" name="search_name" value={$name}>
                </div>
                <div class="form-group">
                    <p>e_mail:</p>
                    <input type="text" name="search_e_mail" value={$e_mail}>
                </div>
                <div class="form-group">
                    <p>login_id:</p>
                    <input type="text" name="search_login_id" value={$login_id}>
                </div>
                <div class="form-group">
                    <p>date:</p>
                    <input type="date" name="search_date" value="{$date}">
                </div>
            </div>
                <div class="card-footer">
                    <input type="submit" name="search" class="btn btn-primary" value="検索する">
                    <input type="reset" class="btn btn-primary" value="リセット">
                    <form method="get" action=""> 
                        <a href="./logout.php" class="btn btn-primary">ログアウト</a>
                    </form>
                </div>   
        </form>


{* <tr>
<td>
    <form method="post" action="member.detail.php">

    <input  type="hidden" name="search_id"  value="{$id}">
    <input  type="hidden" name="search_name"  value="{$name}">
    <input  type="hidden" name="search_e_mail"  value="{$e_mail}">
    <input  type="hidden" name="search_login_id"  value="{$login_id}">
    <input  type="hidden" name="search_date"  value="{$date}">
    <input  type="submit" name="result_id"  value="{$result_id}">
    </form>
</td> *}
{* <td>{$result_name}</td>
<td>{$result_e_mail}</td>
<td>{$result_login_id}</td>
<td>{$result_date}</td> *}

<table>
<tr>
<td>ID</td>
<td>名前</td>
<td>メールアドレス</td>
<td>電話可能日時</td>
<td>ログインID</td>
</tr>
{foreach $result as $k => $v}
<tr>
    {foreach $v as $i => $j}
        {if $i== "id"}
        
            <td>
            <form method="post" action="member.detail.php">
            <input  type="hidden" name="search_id"  value="{$id}">
            <input  type="hidden" name="search_name"  value="{$name}">
            <input  type="hidden" name="search_e_mail"  value="{$e_mail}">
            <input  type="hidden" name="search_login_id"  value="{$login_id}">
            <input  type="hidden" name="search_date"  value="{$date}">
            <input  type="submit" name="result_id"  value="{$j}">
            </form>
            </td>
        {/if}
        {if $i== "name"}
           <td>  {$j}</td>
        {/if}
        {if $i== "e_mail"}
           <td> {$j}</td>
        {/if}
        {if $i== "date"}
            <td>{$j}</td>
        {/if}
        {if $i== "login_id"}
           <td> {$j}</td>
        {/if}
       
    {/foreach}
    </tr>
{/foreach}
</tr>

</table>
<a href="/download.php?id={$id}&name={$name}&e_mail={$e_mail}&login_id={$login_id}&date={$date}">CSVダウンロード</a>
      
     
    </div>
 



</body>
</html>
