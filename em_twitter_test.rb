require 'bundler/setup'
require 'em-twitter'
require 'yaml'

auth = YAML::load(File.open("#{File.expand_path(File.dirname(__FILE__))}/credentials.yml"))

credentials = 'oauth'

EM::run do

  options = {
    :path   => '/1/statuses/filter.json',
    :params => {
      :track            => 'you,Obama,eli,bachelor,Romney'
    },
    # :ssl => {
    #   :verify_peer      => true,
    #   :cert_chain_file  => '/etc/ssl/certs/cacert.pem'
    # },
    :oauth  => {
      :consumer_key     => auth[credentials]['consumer_key'],
      :consumer_secret  => auth[credentials]['consumer_secret'],
      :token            => auth[credentials]['oauth_token'],
      :token_secret     => auth[credentials]['oauth_token_secret']
    }
    # , :encoding => 'gzip'
  }

  client = EM::Twitter::Client.connect(options)

  client.each do |item|
    puts item
  end

  client.on_error do |message|
    puts "oops: error: #{message}"
  end

  client.on_unauthorized do
    puts "oops: unauthorized"
  end

  client.on_forbidden do
    puts "oops: unauthorized"
  end

  client.on_not_found do
    puts "oops: not_found"
  end

  client.on_not_acceptable do
    puts "oops: not_acceptable"
  end

  client.on_too_long do
    puts "oops: too_long"
  end

  client.on_range_unacceptable do
    puts "oops: range_unacceptable"
  end

  client.on_enhance_your_calm do
    puts "oops: enhance_your_calm"
  end

  EM.add_timer(25) do
    EM.stop
  end

end