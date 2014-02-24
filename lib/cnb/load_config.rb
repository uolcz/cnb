require 'yaml'

if File.exists?('config/cnb.yml')
  filename = 'config/cnb.yml'
elsif File.exists?(ENV['HOME'] + '/.cnb.yml')
  filename = ENV['HOME'] + '/.cnb.yml'
end

CONFIG = YAML.load_file(filename)
