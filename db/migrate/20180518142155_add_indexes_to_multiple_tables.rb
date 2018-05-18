class AddIndexesToMultipleTables < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :name
    add_index :tags, :type
  end
end
