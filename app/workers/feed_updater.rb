class FeedUpdater
  include Sidekiq::Worker

  def perform(feed_id)
    feed = Feed.find(feed_id)
    feed.fetch
    feed.user_feeds.each do |user_feed|
      feed.entries.each do |entry|
        next unless entry.published > user_feed.last_updated
        puts user_feed.user.id + " #{entry.title}"
        #Tweeter.perform(user_feed.user.id, entry)
      end
    end
  end
end