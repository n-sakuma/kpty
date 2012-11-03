class Project < ActiveRecord::Base
  attr_accessible :creator_id, :description, :name
end
