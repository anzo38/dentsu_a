{* <!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>コンタクトフォーム（完了）</title>
<link href="../bootstrap.min.css" rel="stylesheet">
<link href="../style.css" rel="stylesheet">
</head>
<body> *}

<table>
<tr>
<td>
    <form method="post" action="member.detail.php">

    <input  type="hidden" name="search_id"  value="{$id}">
    <input  type="hidden" name="search_name"  value="{$name}">
    <input  type="hidden" name="search_e_mail"  value="{$e_mail}">
    <input  type="hidden" name="search_login_id"  value="{$login_id}">
    <input  type="hidden" name="search_date"  value="{$date}">
    <input  type="submit" name="result_id"  value="{$result_id}">
    </form>
</td>
<td>{$result_name}</td>
<td>{$result_e_mail}</td>
<td>{$result_login_id}</td>
<td>{$result_date}</td>
</tr>

</table>


{* {foreach $result_id as $k =>$result_id_v}
{* <tr><th>ID</th><th>名前</th><th>メールアドレス</th><th>ログインID</th><th>電話可能日</th></tr>
<form method="post" action="member.detail.php">
 

    <form method="post" action="member.detail.php">
    <tr>
    <td><input  type="submit" name="search_id"  value="{$result_id_v}"></td>
    <td>{$result_name_v}</td>
    <td>{$result_e_mail_v}</td>
    <td>{$result_login_id_v}</td>
    <td>{$result_data_v}</td>
    </tr>
    </form>
   {foreach $result_name as $k =>$result_name_v}
        {foreach $result_e_mail as $k =>$result_e_mail_v}
                {foreach $result_login_id as $k =>$result_login_id_v}
                    {foreach $result_date as $k =>$result_data_v}
                    {/foreach}
                {/foreach}
        {/foreach}
   {/foreach}
{/foreach}
</table> *}

{* <a href="./test.php">CSVダウンロード<a> *}
  {* <form method="post" action="./download.php">
<input type="hidden" name="result_id" value="{$result_id}">
<input type="hidden" name="result_name" value="{$result_name_v}">
<input type="hidden" name="result_e_mail" value="{$result_login_id_v}">


<input type="submit" name="csv_dl" value="CSVダウンロード">  *}
{* </form> *}






{* <form method="post" action="member.detail.php">
<input  type="hidden" name="{$result_id}">
<input  type="submit" value="CSVダウンロード">
</form> *}
{* <a href="./member.detail.php" >CSVダウンロード<a> *}

{* 
<body>
<html> *}