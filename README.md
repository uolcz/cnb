# CNB

[![Gem Version](https://badge.fury.io/rb/cnb.png)](http://badge.fury.io/rb/cnb)
[![Build Status](https://travis-ci.org/ucetnictvi-on-line/cnb.png?branch=master)](https://travis-ci.org/ucetnictvi-on-line/cnb)

CNB is a gem that will help you get daily and monthly currency rates for czech crown (CZK) from Czech National Bank. Besides the currency rate you can also get name of the currency, name of the country where it is used and date when the currency rates were published.


## Install

Add following into your Gemfile

    gem 'cnb'

Run

    $ bundle

Or install the gem by on your own

    $ gem install cnb


## Usage


### Daily currency rates
To work with current currency rates start with the following code:

    CNB.daily_rates

Get currency rate of currency towards czech crown (CZK) with given currency code

    CNB.rate('USD') # 19.927 (float value)

Get name of the currency in czech language.

    CNB.name('USD') # dolar

Get name of the country where the currency comes from in czech language.

    CNB.country('USD') # USA

The currency code is not case sensitive.

Get date when the currency rates were published. Czech National Bank does not publish currency rates during the weekend, so may want to check when exactly were the values published.

    CNB.date


### Monthly currency rates

Some currency rates are published on monthly basis. You can get currency rates for any month and year since 2004.

To get the monthly currency rates use the following code:

    # Get currency rates for March 2013
    CNB.monthly_rates(3, 2013)

After using the code above, you can use the same methods as for the daily currency rates.

    CNB.rate('HNL')
    CNB.name('HNL') # lempira
    CNB.country('HNL') # Honduras
    CNB.date


### Primary currency

Czech National Bank provides all currency rates towards czech crown (CZK). You can get the primary currency with the following code

    CNB::PRIMARY_CURRENCY # CZK


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License
MIT License. Copyright (c) 2014
