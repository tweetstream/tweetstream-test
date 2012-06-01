require 'rubygems'
require "bundler/setup"

require 'tweetstream'
require 'yajl'

require './oauth_config'

EM.run do

  client = TweetStream::Client.new

  client.on_error do |message|
    puts message
  end

  # client.follow(['115192457']) do |status|
  #   puts status
  # end


  client.track("you") do |status|
    puts "#{status.text}"
  end

  # client.track('$T', '$MSFT', '$AAPL') do |status|
  #   puts "#{status.text}"
  # end

  # client.track("é") do |status|
  #   puts "#{status.text}"
  # end
end