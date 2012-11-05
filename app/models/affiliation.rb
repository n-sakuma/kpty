class Affiliation < ActiveRecord::Base
  attr_accessible :admin, :project_id, :user_id

  belongs_to :user
  belongs_to :project

  after_create :set_admin

  private

  def set_admin
    return unless self.project.creator_id == self.user.id
    self.update_attribute(:admin, true)
  end
end
