require 'rubygems'
require "bundler/setup"

require 'tweetstream'
require 'yajl'

require './basic_auth_config'

client = TweetStream::Client.new

client.on_error do |message|
  puts message
end

client.on_interval(5) do
  puts '5 seconds have passed'
end

client.track("you") do |status|
  puts "#{status.text}"
end