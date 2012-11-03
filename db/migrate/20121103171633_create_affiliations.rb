class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.integer :project_id
      t.integer :user_id
      t.boolean :admin, :default => false, :null => false

      t.timestamps
    end
    add_index :affiliations, :project_id
    add_index :affiliations, :user_id
  end
end
