:us: [:jp:](./doc/ja/README.md) [![Build Status](https://travis-ci.org/sachin21/ruboty-dmm.svg?branch=master)](https://travis-ci.org/sachin21/ruboty-dmm) ![Gem Version](https://badge.fury.io/rb/ruboty-dmm.svg) [![Build Status](https://travis-ci.org/sachin21/ruboty-dmm.svg?branch=master)](https://travis-ci.org/sachin21/ruboty-dmm) [![Code Climate](https://codeclimate.com/github/sachin21/ruboty-dmm/badges/gpa.svg)](https://codeclimate.com/github/sachin21/ruboty-dmm) [![Gem](https://img.shields.io/gem/dt/ruboty-dmm.svg)](https://rubygems.org/gems/ruboty-dmm)

# Ruboty DMM

## What is Ruboty DMM
Ruboty DMM is a notifying rankings for DMM.R18's Japanese doujin CG.

## Installation
On your gemfile:

```
gem 'ruboty-dmm'
```

## Usage
From the bot in invited Slack's room:

### 1. Show the 24's ranking

```
@ruboty dmm cg 24
--- output ---
```

For example, Above command will notify the doujin cg 24's ranking.

### Available arguments
- The first argument is only available for dmm.
- The second argument is available for all, comic, cg, game, voice.
- The third argument is available for 24, weekly, monthly, total.

### 2. Register a job by ruboty-cron
Add ruboty-cron to your bot's Gemfile.

```
gem 'ruboty-cron'
```

Deployed after, register a task.

```
@ruboty add job "0 21 * * *" @ruboty dmm cg 24
```

Notify the 24-hour ranking for CG genre at every 9 pm.


## Thanks
Thanks for creating awesome gems

- [r7kamura/ruboty](https://github.com/r7kamura/ruboty)
- [r7kamura/ruboty-cron](https://github.com/r7kamura/ruboty-cron)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
