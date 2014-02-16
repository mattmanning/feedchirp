class Tweeter
  include Sidekiq::Worker

  @@client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['CLIENT_CONSUMER_KEY']
    config.consumer_secret     = ENV['CLIENT_CONSUMER_SECRET']
    config.access_token        = ENV['CLIENT_ACCESS_TOKEN']
    config.access_token_secret = ENV['CLIENT_ACCESS_SECRET']
  end

  def self.client
    @@client
  end

  def perform(user_id, entry)
  end
end