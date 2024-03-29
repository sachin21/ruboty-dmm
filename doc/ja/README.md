[:us:](../../README.md) :jp: [![Build Status](https://travis-ci.org/sachin21/ruboty-dmm.svg?branch=master)](https://travis-ci.org/sachin21/ruboty-dmm) ![Gem Version](https://badge.fury.io/rb/ruboty-dmm.svg) [![Build Status](https://travis-ci.org/sachin21/ruboty-dmm.svg?branch=master)](https://travis-ci.org/sachin21/ruboty-dmm) [![Code Climate](https://codeclimate.com/github/sachin21/ruboty-dmm/badges/gpa.svg)](https://codeclimate.com/github/sachin21/ruboty-dmm) [![Gem](https://img.shields.io/gem/dt/ruboty-dmm.svg)](https://rubygems.org/gems/ruboty-dmm)

# Ruboty DMM

## :warning: 注意 :warning:

FANZA(旧DMM.R18)はクロールを禁止しているので、使用しないことをおすすめします。
ruboty-dmmを利用するにあたって不利益や損害が生じたとしても一切の責任を負わないものとします。

## Ruboty DMMとは
Ruboty DMMはDMM.R18のランキングをSlackに通知するためのボットです。
現在は同人のみになっています。

## インストール
使っているボットのGemfileに以下を追記してください。

```
gem 'ruboty-dmm'
```

## 使い方
ボットを招待しているSlackの部屋にて以下を実行します。

### 1. 24時間ランキングの表示の仕方

```
@ruboty dmm cg 24
--- output ---
```

例えば、上記のコマンドはdoujin cgの24ランキングを通知します。

### 仕様可能な引数
- 最初の引数はdmmのみ利用可能です。
- 二個目の引数は`all, comic, cg, game, voice`のみ利用可能です。
- 三個目の引数は`24, weekly, monthly, total`のみ利用可能です。


### 2. ruboty-cronを使い、特定の時間に通知する
ruboty-cronを追加します。

```
gem 'ruboty-cron'
```

deploy後、タスクを登録します。

```
@ruboty add job "0 21 * * *" @ruboty dmm cg 24
```

ruboty-cronを使ってCGジャンルのランキングを毎日9時に通知することが出来ます。

## 謝辞
ruboty, ruboty-cronを作ってくれた[r7kamura氏](https://github.com/r7kamura)に感謝。

- [r7kamura/ruboty](https://github.com/r7kamura/ruboty)
- [r7kamura/ruboty-cron](https://github.com/r7kamura/ruboty-cron)

## コントリビューション

1. フォークする
2. 新しくブランチを切る (`git checkout -b my-new-feature`)
3. 変更をコミットする (`git commit -am 'Add some feature'`)
4. 変更をプッシュする (`git push origin my-new-feature`)
5. プルリクエストを投げる :+1:
