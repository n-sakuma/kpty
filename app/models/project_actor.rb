class ProjectActor < ActiveRecord::Base
  attr_accessible :project_id, :type, :user_id

  belongs_to :project
  belongs_to :user

  delegate :name, :to => :user
end
