class SimplifySchema < ActiveRecord::Migration[5.1]
  def up
    remove_column :projects, :type
    remove_column :project_owners, :type
    add_column :project_owners, :vcs_type, :string, null: false
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
