# CNB

[![Gem Version](https://badge.fury.io/rb/cnb.png)](http://badge.fury.io/rb/cnb)
[![Build Status](https://travis-ci.org/ucetnictvi-on-line/cnb.png?branch=master)](https://travis-ci.org/ucetnictvi-on-line/cnb)
[![Dependency Status](https://gemnasium.com/ucetnictvi-on-line/cnb.svg)](https://gemnasium.com/ucetnictvi-on-line/cnb)
[![Code Climate](https://codeclimate.com/github/ucetnictvi-on-line/cnb/badges/gpa.svg)](https://codeclimate.com/github/ucetnictvi-on-line/cnb)
[![Test Coverage](https://codeclimate.com/github/ucetnictvi-on-line/cnb/badges/coverage.svg)](https://codeclimate.com/github/ucetnictvi-on-line/cnb)

CNB is a gem that will help you get daily and monthly currency rates for czech crown (CZK) from Czech National Bank.

## Install

Add following into your Gemfile

```ruby
gem 'cnb'
```

Or install the gem by on your own

```ruby
gem install cnb
```

## Usage

### Daily

```ruby
CNB.exchange_rate('AUD', Date.today)
```

Returns today's exchange rate between CZK and AUD.
Input date defaults to Date.today so the above line can written like this:

```ruby
CNB.exchange_rate('AUD')
```

### Monthly
You can set monthly switch to true whenever it's necessary to work with less known currencies.
These currencies are updated on monthly basis.

```ruby
CNB.exchange_rate('ALL', Date.today, monthly = true)
```

Returns today's exchange rate between CZK and ALL (Albanian lek).

#### Exceptions
* DateTooOld - triggers when date entered is older than 24 years, or 10 years if monthly.
* DateInFuture - triggers when date enetered is in future.
* CurrencyMissing - triggers when currency is not present.
* CurrencyNotSupported - triggers when currency is not in downloaded list of currencies.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License
MIT License. Copyright (c) 2014
