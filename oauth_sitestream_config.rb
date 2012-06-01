require 'yaml'

auth = YAML::load(File.open("#{File.expand_path(File.dirname(__FILE__))}/credentials.yml"))

credentials = 'sitestream'

TweetStream.configure do |config|
  config.consumer_key       = auth[credentials]['consumer_key']
  config.consumer_secret    = auth[credentials]['consumer_secret']
  config.oauth_token        = auth[credentials]['oauth_token']
  config.oauth_token_secret = auth[credentials]['oauth_token_secret']
  config.parser   = :yajl
end