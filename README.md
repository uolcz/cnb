# CNB

[![Gem Version](https://badge.fury.io/rb/cnb.png)](http://badge.fury.io/rb/cnb)
[![Build Status](https://travis-ci.org/ucetnictvi-on-line/cnb.png?branch=master)](https://travis-ci.org/ucetnictvi-on-line/cnb)
[![Dependency Status](https://gemnasium.com/ucetnictvi-on-line/cnb.svg)](https://gemnasium.com/ucetnictvi-on-line/cnb)
[![Code Climate](https://codeclimate.com/github/ucetnictvi-on-line/cnb/badges/gpa.svg)](https://codeclimate.com/github/ucetnictvi-on-line/cnb)
[![Test Coverage](https://codeclimate.com/github/ucetnictvi-on-line/cnb/badges/coverage.svg)](https://codeclimate.com/github/ucetnictvi-on-line/cnb)

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
To work with daily currency rates start with the following code:

    CNB.daily_rates

This will provide you object from which you can get the currency rates and other information. Everytime you use the code above, actual currency rates are retrived from Czech National Bank, so it is a good idea to assign the result to variable if you don't want to make more HTTP requests than neccessary.

Get currency rate of currency with given currency code towards czech crown (CZK)

    CNB.daily_rates.rate('USD') # 19.927 (float value)
    CNB.daily_rates.rate('EUR') # 27.34

By using the code above you make 2 requests for currency rates.

The following code does the same thing but it retrives the currency rates just once.

    daily_rates = CNB.daily_rates
    daily_rates.rate('USD')
    daily_rates.rate('EUR')

Get name of the currency in czech language.

    CNB.daily_rates.name('USD') # dolar

Get name of the country where the currency comes from in czech language.

    CNB.daily_rates.country('USD') # USA

**The currency code parameter is not case sensitive.**

Get date when the currency rates were published. Czech National Bank does not publish currency rates during the weekend, so you may want to check when exactly were the values published.

    CNB.date

You can get all currencies as hash where currency codes are used as keys by the following code

    CNB.daily_rates.currencies


### Monthly currency rates

Some currency rates are published on monthly basis. You can get currency rates for any month and year since 2004.

To get the monthly currency rates use the following code:

    # Get currency rates for March 2013
    CNB.monthly_rates(3, 2013)

You can only retrieve monthly currency rates that were published since 2004. If you try to get older currency rates, exception will be raised.

After using the code above, you can use the same methods as for the daily currency rates.

    monthly_rates = CNB.monthly_rates(3, 2013)
    monthly_rates.rate('HNL')
    monthly_rates.name('HNL') # lempira
    monthly_rates.country('HNL') # Honduras
    monthly_rates.date

Get all currencies as hash

    CNB.monthly_rates(3, 2013).currencies


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
