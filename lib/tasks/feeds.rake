namespace :feeds do
  desc "Check all the feeds for new posts and update users"
  task update: :environment do
    Feed.all.each do |feed|
      FeedUpdater.perform_async(feed.id)
    end
  end
end
