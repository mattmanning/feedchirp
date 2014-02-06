class User < ActiveRecord::Base
  has_and_belongs_to_many :feeds

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth['uid']
      user.screen_name = auth['info']['nickname']
    end
  end
end
