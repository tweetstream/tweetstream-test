require 'rubygems'
require "bundler/setup"

require 'tweetstream'
require 'yajl'

require './basic_auth_config'

client = TweetStream::Client.new

client.on_direct_message do |direct_message|
  puts "direct message"
  puts direct_message.text
end

client.on_timeline_status do |status|
  puts "timeline status"
  puts status.text
end

client.userstream