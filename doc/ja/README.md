:jp: [![Build Status](https://travis-ci.org/sachin21/ruboty-dmm.svg?branch=master)](https://travis-ci.org/sachin21/ruboty-dmm) ![Gem Version](https://badge.fury.io/rb/ruboty-dmm.svg) [![Build Status](https://travis-ci.org/sachin21/ruboty-dmm.svg?branch=master)](https://travis-ci.org/sachin21/ruboty-dmm) [![Code Climate](https://codeclimate.com/github/sachin21/ruboty-dmm/badges/gpa.svg)](https://codeclimate.com/github/sachin21/ruboty-dmm) [![Gem](https://img.shields.io/gem/dt/ruboty-dmm.svg)](https://rubygems.org/gems/ruboty-dmm)

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
@ruboty dmm cg 24
--- output ---
```

例えば、上記のコマンドはdoujin cgの24ランキングを通知します。

### 仕様可能な引数
- 最初の引数はdmmのみ利用可能です。
- 二個目の引数はall, comic, cg, game, voiceのみ利用可能です。
- 三個目の引数は24, weekly, monthly, totalのみ利用可能です。


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
