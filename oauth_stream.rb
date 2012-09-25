require 'rubygems'
require "bundler/setup"

require 'tweetstream'

require './oauth_config'

EM.run do

  client = TweetStream::Client.new

  client.on_error do |message|
    puts message
  end

  # client.follow(['115192457']) do |status|
  #   puts status
  # end
  client.on_no_data_received do
    puts 'stall'
  end

  client.on_reconnect do |timeout, retries|
    puts "Hit reconnect with timeout of #{timeout} for #{retries} retries"
  end

  client.track(%w(you me leeds manchester)) do |status|
    puts status.text
  end

  # client.track('$T', '$MSFT', '$AAPL') do |status|
  #   puts "#{status.text}"
  # end

  # client.track("é") do |status|
  #   puts "#{status.text}"
  # end

  trap('INT') { client.stop }
  trap('TERM') { client.stop }
end