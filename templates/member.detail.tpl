<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<title>ログインフォーム</title>

</head>

<body>

{* {$result_id}<br> *}
<p>名前：{$data.name}{$no_data}</p><br>
<p>メールアドレス：{$data.e_mail}{$no_data}</p><br>

<p>カテゴリ：{$no_data}
{foreach $data.question as $k => $v}
 {if $v@last}
 {#$v#}  
 {else}
 {#$v#},
 {/if}
{/foreach}</p><br>
<p>カテゴリー：{#$data.category#}{$no_data}</p><br>
<p>電話可能日：{$data.date}{$no_data}</p><br>
<p>電話可能時間：{$data.time_start}-{$data.time_end}{$no_data}</p><br>
<p>お問い合わせ内容：{$data.comment}{$no_data}</p><br>
<p>ID：{$data.login_id}{$no_data}</p><br>

{* {#$data.question#} *}
{* 
<a href="./member.php">一覧へ戻る</a> *}
    <form method="post" action="member.php">

        <input  type="hidden" name="search_id"  value="{$id}">
        <input  type="hidden" name="search_name"  value="{$name}">
        <input  type="hidden" name="search_e_mail"  value="{$e_mail}">
        <input  type="hidden" name="search_login_id"  value="{$login_id}">
        <input  type="hidden" name="search_date"  value="{$date}">
        <input  type="submit" name="back"  value="一覧へ">
    </form>

<a href="./logout.php">ログアウト</a>

</body>
</html>
