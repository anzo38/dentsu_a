お問合わせありがとうございました。下記の内容で間違いがないかご確認ください。
名前：{$name}
メールアドレス：{$e_mail}
お聞きしたいこと：{foreach $question as $key => $question_array}
 {$question_config_data[$question_array]}
{/foreach}
カテゴリー：{$category_config_data[$category]}
電話可能日：{$date}
電話可能時間帯：{$time_start}〜{$time_end}
コース：{$course}
お問い合わせ内容：{$comment}
ID：{$login_id}
