require 'yaml'

auth = YAML::load(File.open("#{File.expand_path(File.dirname(__FILE__))}/credentials.yml"))

TweetStream.configure do |config|
  config.username = auth['basic']['username']
  config.password = auth['basic']['password']
  config.parser   = :yajl
  config.auth_method = :basic
end