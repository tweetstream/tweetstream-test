# -*- encoding: utf-8 -*-
require 'rubygems'
require "bundler/setup"

require 'tweetstream'
require 'yajl'

if RUBY_VERSION < '1.9'
  $KCODE = "U"
  require 'jcode'
end

require './basic_auth_config'

client = TweetStream::Client.new
client.track("é") do |status|
  puts status.text
end