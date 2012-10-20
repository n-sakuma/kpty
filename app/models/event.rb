class Event < ActiveRecord::Base
  attr_protected :id, :created_at, :updated_at

  has_many :things
end
