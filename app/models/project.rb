class Project < ActiveRecord::Base
  attr_accessible :creator_id, :description, :name

  has_many :affiliations
  has_many :users, :through => :affiliations, :dependent => :destroy
  has_many :events, :dependent => :destroy
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

end
