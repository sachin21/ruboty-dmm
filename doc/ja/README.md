:jp:

# Ruboty DMM

## Ruboty DMMとは
Ruboty DMMはDMM.R18のランキングを通知するためのボットです。
現在は同人誌のみになっています。

## インストール
使っているボットのGemfileに以下を追記してください。

```
gem 'ruboty-dmm'
```

## 使い方
ボットを招待しているSlackの部屋にて

### 1. 24時間ランキングの表示の仕方

```
@ruboty dmm ranking 24
--- output ---
```

このコマンドは以下の4種類の引数を投げることが可能です。

- 24
- weekly
- monthly
- total

### 2. ruboty-cronを使い、特定の時間に通知する
ruboty-cronを追加します。

```
gem 'ruboty-cron'
```

deploy後タスクを登録します。

```
@ruboty add job "* 21 * * *" @ruboty dmm ranking 24
```

ruboty-cronを使って毎日9時に通知することが出来ます。

## 謝辞
ruboty, ruboty-cronを作ってくれた[r7kamura氏](https://github.com/r7kamura)に感謝

- [r7kamura/ruboty](https://github.com/r7kamura/ruboty)
- [r7kamura/ruboty-cron](https://github.com/r7kamura/ruboty-cron)

## コントリビューション

1. フォークする
2. 新しくブランチを切る (`git checkout -b my-new-feature`)
3. 変更をコミットする (`git commit -am 'Add some feature'`)
4. 変更をプッシュする (`git push origin my-new-feature`)
5. プルリクエストを投げる :+1:
