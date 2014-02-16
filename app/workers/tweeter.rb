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

  def self.url_length
    @@url_length ||= @@client.configuration.short_url_length
  end

  def tweet(screen_name, entry, feed_title)
    available_characters = 139 - screen_name.length - self.url_length - 2
    text = "@#{screen_name} "
    text += "#{entry.title} - #{feed_title}"[0..available_characters-1]
    text += " #{entry.url}"
  end

  def perform(screen_name, entry, feed_title)
    @@client.update tweet(screen_name, entry, feed_title)
  end
end