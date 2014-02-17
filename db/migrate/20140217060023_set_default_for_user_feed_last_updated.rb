class SetDefaultForUserFeedLastUpdated < ActiveRecord::Migration
  def up
    execute "ALTER TABLE user_feeds ALTER COLUMN last_updated SET DEFAULT now()"
  end
  def down
    change_column_default(:user_feeds, :last_updated, nil)
  end
end
