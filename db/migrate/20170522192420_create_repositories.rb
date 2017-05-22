class CreateRepositories < ActiveRecord::Migration[5.1]
  def change
    # can be organization or individual user
    create_table :project_owners do |t|
      t.string :type, null: false
      t.string :remote_id, null: false
      t.string :name, null: false
      t.timestamps null: false
    end
    add_index :project_owners, [:type, :remote_id], unique: true

    create_table :projects do |t|
      t.integer :project_owner_id, null: false
      t.string :type, null: false
      t.string :remote_id, null: false
      t.string :name, null: false
      t.timestamps null: false
    end
    add_index :projects, :project_owner_id
    add_index :projects, [:type, :remote_id], unique: true

    create_table :builds do |t|
      t.integer :project_id, null: false
      t.string :remote_trigger_id # e.g. webhook ID
      t.string :branch, null: false
      t.string :commit, null: false
      t.datetime :started_at
      t.datetime :completed_at
      t.datetime :failed_at
      t.timestamps null: false
    end
    add_index :builds, :project_id
  end
end
