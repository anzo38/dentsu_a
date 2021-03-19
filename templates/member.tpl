<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<title>ログインフォーム</title>
</head>
<body>
<h1>検索</h1>

{$no_data}
<form method="post" action="">
    <p>id:</p>
    <input type="text" name="search_id" value={$id}>

    <p>name:</p>
    <input type="text" name="search_name" value={$name}>
    <p>e_mail:</p>
    <input type="text" name="search_e_mail" value={$e_mail}>
    <p>login_id:</p>
    <input type="text" name="search_login_id" value={$login_id}>
    <p>date:</p>
    <input type="date" name="search_date" value="{$date}">

<input type="submit" name="search" value="検索する">
<input type="reset" value="リセット">

</form>
{* {include file="$search_results_table.tpl"} *}
{* <form method="post" action="member.detail.php">
<input type="hidden" name="search_id">
</form> *}
<form method="get" action=""> 
<a href="./logout.php">ログアウト</a>

</form>

 
<table>


{* <a href="./download.php">CSV<a>
</form> *}



<p></p>


</body>
</html>
