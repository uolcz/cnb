# CNB [![Build Status](https://travis-ci.org/ucetnictvi-on-line/cnb.png?branch=master)](https://travis-ci.org/ucetnictvi-on-line/cnb)

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

    CNB.daily_cur_rates

Get currency rate of currency towards czech crown (CZK) with given currency code

    CNB.cur_rate('USD')

Get name of the currency in czech language.

    CNB.cur_name('USD') # dolar

Get name of the country where the currency comes from in czech language.

    CNB.cur_country('USD') # USA

Get date when the currency rates were published. Czech National Bank does not publish currency rates during the weekend, so may want to check when exactly were the values published.

    CNB.date


### Monthly currency rates

Some currency rates are published on monthly basis. You can get currency rates for any month and year since 2004.

To get the monthly currency rates use the following code:

    # Get currency rates for March 2013
    CNB.monthly_cur_rates(3, 2013)

After using the code above, you can use the same methods as for the daily currency rates.

    CNB.cur_rate('HNL')
    CNB.cur_name('HNL') # lempira
    CNB.cur_country('HNL') # Honduras
    CNB.date


## Configuration

The currency rates are downloaded to your disk so you don't have to download them repeatedly. You can set directory where the files should be stored in the configuration file

    config/cnb.yml


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License
MIT License. Copyright (c) 2014
