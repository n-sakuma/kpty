class CreateProjectActors < ActiveRecord::Migration
  def change
    create_table :project_actors do |t|
      t.integer :project_id
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
