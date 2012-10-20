class Thing < ActiveRecord::Base
  attr_protected :id, :created_at, :updated_at
end
