class User < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :affiliations, :dependent => :destroy
  has_many :projects, :through => :affiliations

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.screen_name = auth["info"]["nickname"]
    end
  end
end
