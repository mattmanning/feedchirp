class User < ActiveRecord::Base
  has_many :user_feeds
  has_many :feeds, through: :user_feeds

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth['uid']
      user.screen_name = auth['info']['nickname']
    end
  end
end
