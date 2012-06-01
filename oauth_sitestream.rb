require 'rubygems'
require "bundler/setup"

require 'tweetstream'
require 'yajl'

require './oauth_sitestream_config'

EM.run do

  client = TweetStream::Client.new

  client.on_error do |error|
    puts error
    # client.stop
  end

  client.sitestream(['115192457'], :followings => true) do |status|
    puts status.inspect
  end

  # test connection management, most of this stuff isn't working
  EM::Timer.new(60) do
    client.control.add_user('2039761')
    client.control.info { |i| puts i.inspect }
  end

  EM::Timer.new(75) do
    client.control.friends_ids('115192457') do |friends|
      puts friends.inspect
    end
  end

  EM::Timer.new(90) do
    client.control.remove_user('115192457')
    client.control.info { |i| puts i.inspect }
  end

  EM::Timer.new(120) do
    EM.stop
  end
end