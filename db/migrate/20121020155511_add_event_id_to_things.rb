class AddEventIdToThings < ActiveRecord::Migration
  def change
    add_column :things, :event_id, :integer
    add_index :things, :event_id
  end
end
