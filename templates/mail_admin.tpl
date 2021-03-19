お問合わせがありました。各担当者は確認後、対応をお願いします
{$auto_time}
名前：{$name}
メールアドレス：{$e_mail}
お聞きしたいこと：{foreach $question as $key => $question_array}
 {$question_config_data[$question_array]}
{/foreach}
カテゴリー：{$category_config_data[$category]}
電話可能日：{$date}
電話可能時間帯：{$time_start}〜{$time_end}
お問い合わせ内容：{$comment}
ID：{$login_id}
