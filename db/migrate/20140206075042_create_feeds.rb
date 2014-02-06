class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :url
      t.string :title
      t.timestamp :last_modified

      t.timestamps
    end
  end
end
