class Thing < ActiveRecord::Base
  attr_accessible :type, :content, :event_id

  belongs_to :event

  validates :content, :presence => true, :length => {:maximum => 5}
end
