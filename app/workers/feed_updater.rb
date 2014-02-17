class FeedUpdater
  include Sidekiq::Worker

  def perform(feed_id)
    feed = Feed.find(feed_id)
    feed.fetch
    feed.user_feeds.each do |user_feed|
      feed.entries.each do |entry|
        next unless entry.published > user_feed.last_updated
        Tweeter.perform_async(user_feed.user.screen_name, entry.title,
                              entry.url, feed.title)
      end
      user_feed.update(last_updated: feed.last_updated)
    end
  end
end