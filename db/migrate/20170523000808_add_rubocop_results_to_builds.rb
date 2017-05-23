class AddRubocopResultsToBuilds < ActiveRecord::Migration[5.1]
  def change
    add_column :builds, :results, :json, null: false, default: '{}'
  end
end
