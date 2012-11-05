class Project < ActiveRecord::Base
  attr_accessible :creator_id, :description, :name

  has_many :affiliations
  has_many :users, :through => :affiliations, :dependent => :destroy

end
