class Feed < ActiveRecord::Base
  attr_reader :entries
  has_many :user_feeds, dependent: :destroy
  has_many :users, through: :user_feeds

  def fetch
    @feed = Feedzirra::Feed.fetch_and_parse(url)
    update(title: feed.title)
    @entries = feed.entries
  end
end
