class RenameJoinTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :tags_users, :tag_users
    rename_table :restaurants_tags, :restaurant_tags
  end
end
