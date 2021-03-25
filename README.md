## お天気解説

### 主要コマンド
- `wget`
- `convert`

### 各コードの説明
```
(sh)
-- get_himawari8.sh ... ひまわり8号の衛星画像を取得
-- get_radar.sh　　　... 降水レーダー画像を取得
(csh)
-- get_tenkizu.sh   ... 地上天気図を取得(JST or UTCを選択する)
-- get_trough.sh    ... 上層高度場を取得(JST or UTCを選択する)
```

各コード，日付を設定して実行する！  
→二つの種類で書いてあるのは，田中先生は`csh`が好きだから二つ覚えておくといいかなって意味です！笑
```sh
(shの場合)
$ sh get_himawari.sh

(cshの場合)
$ csh get_tenkizu.sh
```

※出力は各命名先に，`png`と`gif`で出てくるよ!
