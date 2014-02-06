class CreateUsersFeeds < ActiveRecord::Migration
  def change
    create_table :users_feeds do |t|
      t.belongs_to :user
      t.belongs_to :feed
      t.timestamp :last_updated
    end
  end
end
