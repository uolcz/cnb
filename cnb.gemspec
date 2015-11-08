# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'cnb/version'

Gem::Specification.new do |s|
  s.name        = 'cnb'
  s.version     = CNB::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Jan Zikán', 'Tomas Koutsky']
  s.email       = ['zikan@uol.cz', 'tomas@stepnivlk.net']
  s.summary     = 'CNB currency rates'
  s.description = 'Get daily and monthly currency rates from Czech National Bank.'
  s.homepage    = 'http://www.uol.cz'
  s.license     = 'MIT'

  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.test_files  = `git ls-files -- spec/**/*`.split("\n")

  s.require_paths = %w('lib', 'config')

  s.add_dependency('nokogiri', '~> 1.6')
  s.add_development_dependency('bundler')
  s.add_development_dependency('rake', '~> 10.4')
  s.add_development_dependency('rspec', '~> 2.14')
  s.add_development_dependency('pry')
  s.add_development_dependency('webmock')
end
