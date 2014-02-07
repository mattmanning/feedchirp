class CreateUserFeeds < ActiveRecord::Migration
  def change
    create_table :user_feeds do |t|
      t.belongs_to :user
      t.belongs_to :feed
      t.timestamp :last_updated
    end
  end
end
