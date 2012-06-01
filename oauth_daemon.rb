require 'rubygems'
require "bundler/setup"

require 'tweetstream'
require 'yajl'

tracks = 'yankees'
puts "Starting a daemon to track: #{tracks}"

require './oauth_config'

TweetStream::Daemon.new('tracker').track(tracks) do |status|
  puts status
end