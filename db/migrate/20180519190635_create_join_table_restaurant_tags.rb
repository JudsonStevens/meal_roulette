class CreateJoinTableRestaurantTags < ActiveRecord::Migration[5.2]
  def change
    create_join_table :restaurants, :tags do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
      t.integer :likeness
      # t.index [:restaurant_id, :tag_id]
      # t.index [:tag_id, :restaurant_id]

      t.timestamps
    end
  end
end
