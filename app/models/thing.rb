class Thing < ActiveRecord::Base
  attr_accessible :type, :content, :event_id

  belongs_to :event
end
