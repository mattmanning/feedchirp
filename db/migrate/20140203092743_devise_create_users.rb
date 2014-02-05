class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :uid
      t.string :screen_name

      t.timestamps
    end
  end
end
